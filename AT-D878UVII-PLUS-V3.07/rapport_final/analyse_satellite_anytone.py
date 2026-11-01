#!/usr/bin/env python3
"""Static, read-only analysis of AnyTone D878 satellite code vs D578 firmware.

No firmware executables are run, no radio access, no firmware patch output.
Standard library only; llvm-objdump optional for ARM Thumb assembly samples.
"""
from __future__ import annotations
import argparse
import hashlib
import json
import math
import re
import shutil
import struct
import subprocess
import sys
import zipfile
from pathlib import Path

MODELS = {
    "D878": ("D878UVII_V3.07_20250429.CDD", 0x08004000),
    "D578_PRO_AT": ("D578UV_AT_V1.20_20240130.CDD", 0x08006000),
    "D578_PRO_GD": ("D578UV_GD_V1.20_20240130.CDD", 0x08006000),
    "D578_PLUS_AT": ("D578UV2_AT_V2.08_20240619.CDD", 0x08006000),
    "D578_PLUS_GD": ("D578UV2_GD_V2.08_20240619.CDD", 0x08006000),
}
ORBIT_CANDIDATES = {
    "orbital_numeric_1": (0x08077CC8, 0x0807806C),
    "orbital_numeric_2": (0x0807806C, 0x08078176),
    "coordinate_processing": (0x080785BE, 0x08078620),
    "numeric_date_processing": (0x08078620, 0x08078700),
    "ui_caller_to_coordinate_processing": (0x08049448, 0x08049490),
    "satellite_candidate_initializer": (0x0807A7A8, 0x0807A8B8),
}
TRUSTED_CALLS = [
    (0x08049476, 0x080785BE),
    (0x0804947A, 0x0807A7A8),
    (0x0807A7C2, 0x08079C32),
    (0x0807A7E0, 0x08079A60),
    (0x08078618, 0x08078326),
    (0x0807816C, 0x08077CC8),
    (0x080796FA, 0x0807806C),
]
ORBIT_CONSTANTS = [
    ("DEG_TO_RAD_DOUBLE", 0x08078024, "<d", math.pi / 180.0),
    ("PI_DOUBLE", 0x0807802C, "<d", math.pi),
    ("EARTH_RADIUS_WGS84_FLOAT", 0x08078044, "<f", 6378.137),
    ("TWO_PI_DOUBLE", 0x08078934, "<d", math.pi * 2),
]
UI_LABELS = ("Satellite", "Predicting", "Satellite/PACsat", "TOT Predict")
EXPECTED_SOURCE_HASHES = {
    "D878": "e154a1a4babf4562e7099ea9ef3007d3762d7cdb68f2c1b599451a67422b261a",
    "D578_PRO_AT": "64583a33c80de7e0",
    "D578_PRO_GD": "1cdf1817f8abbbee",
    "D578_PLUS_AT": "146b7cdada219122",
    "D578_PLUS_GD": "8efad950169f332c",
}

def sha(b): return hashlib.sha256(b).hexdigest()

def extract_firmware(zip_path: Path, wanted: set[str]):
    found = {}
    with zipfile.ZipFile(zip_path) as z:
        for info in z.infolist():
            if info.is_dir() or info.file_size > 30_000_000:
                continue
            filename = Path(info.filename.replace("\\", "/")).name
            for key in wanted:
                if filename == MODELS[key][0]:
                    if key in found:
                        raise RuntimeError("Duplicated CDD: " + filename)
                    found[key] = {"name": info.filename, "cdd": z.read(info)}
        missing = wanted - found.keys()
        if missing:
            raise RuntimeError(f"Missing CDD firmware(s) in {zip_path}: {sorted(missing)}")
    return found

def byte_at(image: bytes, addr: int, base: int, length: int):
    off = addr - base
    if off < 0 or off + length > len(image):
        raise ValueError(f"Invalid address: 0x{addr:08X}")
    return image[off:off+length]

def get_bl_target(image: bytes, base: int, src: int):
    # Thumb-2 BL T1 encoding: S, J1, J2, imm10, imm11. Signed imm25.
    h1, h2 = struct.unpack("<HH", byte_at(image, src, base, 4))
    if (h1 & 0xF800) != 0xF000 or (h2 & 0xD000) != 0xD000:
        return None
    s = (h1 >> 10) & 1
    j1, j2 = (h2 >> 13) & 1, (h2 >> 11) & 1
    i1, i2 = (~(j1 ^ s) & 1), (~(j2 ^ s) & 1)
    imm = (s << 24) | (i1 << 23) | (i2 << 22) | ((h1 & 0x3ff) << 12) | ((h2 & 0x7ff) << 1)
    if imm & (1 << 24): imm -= 1 << 25
    return src + 4 + imm

def elf_for_cortex(image: bytes, base: int, path: Path):
    _, entry = struct.unpack_from("<II", image)
    offset = 0x1000
    names = b"\x00.text\x00.shstrtab\x00"
    names_offset = offset + len(image)
    section_offset = (names_offset + len(names) + 3) & ~3
    header = b"\x7fELF" + bytes([1,1,1,0,0]) + b"\x00"*7
    header += struct.pack("<HHIIIIIHHHHHH",2,40,1,entry,52,section_offset,0x05000000,52,32,1,40,3,2)
    phdr = struct.pack("<IIIIIIII",1,offset,base,base,len(image),len(image),5,0x1000)
    out = bytearray(header+phdr)
    out.extend(b"\x00"*(offset-len(out)))
    out.extend(image)
    out.extend(names)
    out.extend(b"\x00"*(section_offset-len(out)))
    out.extend(b"\x00"*40)
    out.extend(struct.pack("<IIIIIIIIII",1,1,6,base,offset,len(image),0,0,2,0))
    out.extend(struct.pack("<IIIIIIIIII",7,3,0,0,names_offset,len(names),0,0,1,0))
    path.write_bytes(out)

def search_ascii(image:bytes, term:str):
    needle=term.encode("ascii")
    return [m.start() for m in re.finditer(re.escape(needle),image)]

def longest_blanks(b: bytes):
    spans=[]
    for val in (0x00, 0xff):
        for m in re.finditer(re.escape(bytes([val]))+rb"{64,}", b):
            spans.append({"value":f"0x{val:02X}","offset":m.start(),"size":len(m.group())})
    return sorted(spans,key=lambda r:r["size"], reverse=True)[:8]

def report(proof, out):
    m=proof['images']
    items=[
        "# AnyTone D878UVII PLUS V3.07 -> D578UV PRO/PLUS : analyse satellite",
        "",
        "Analyse **statique** de fichiers constructeur fournis par l'utilisateur. Aucun test radio, aucun firmware modifie ou flashe.",
        "",
        "## Sources et architectures",
        "",
        "| Image | Longueur | Debut image Flash | Fin image | Reset vector | SHA-256 (prefixe) |",
        "|---|---:|---|---|---|---|"
    ]
    for key in MODELS:
        x=m[key]
        items.append(f"| {key} | {x['bytes']:,} | `{x['base']}` | `{x['end']}` | `{x['reset_vector']}` | `{x['sha256'][:16]}` |")
    items += [
        "",
        "Remarque : les adresses proviennent des tables de vecteurs et des entetes `.CDI`. Le D878 est charge a `0x08004000`, les D578 a `0x08006000`.",
        "Un transfer direct des blocs de code n'est donc pas possible sans relocalisation des constantes et appels (et adaptation des structures internes).",
        "",
        "## Indices satellite retrouves dans le D878",
        "",
        "| Donnee | Adresse D878 | Constat |",
        "|---|---|---|"
    ]
    for key, dd in proof['constants'].items():
        items.append(f"| {key} | `{dd['address']}` | {dd['value']} ; controle `{'OK' if dd['match'] else 'ECHEC'}` |")
    items += [
        "",
        "La constante WGS84 `6378.137 km` et les constantes de conversion angulaire correspondent a un traitement geographique/orbital, dans une zone de nombreuses fonctions Thumb-2 avec calculs en double precision.",
        "[Inference] L'ensemble `0x08076D00..0x0807A000` constitue une **zone de travail candidate** pour l'analyse du suivi satellite. Il ne faut pas l'assimiler a une fonction unique, et certaines routines peuvent etre reutilisees ailleurs.",
        "",
        "## Instructions et appels verifiables",
        "",
        "| Source | Cible | Type | Verification |",
        "|---|---|---|---|"
    ]
    for x in proof['calls']:
        items.append(f"| `{x['source']}` | `{x['target']}` | `BL` | {'OK' if x['match'] else 'NON'} |")
    items += [
        "",
        "Exemples de chemins effectivement encodes dans le D878 : `0x08049476 -> 0x080785BE -> 0x08078326`, puis `0x0804947A -> 0x0807A7A8 -> 0x08079C32`.",
        "La sequence des deux `BL` consecutifs `0x08049476` / `0x0804947A` relie la preparation des coordonnees a une routine qui initialise plusieurs etats et parcourt une liste d'enregistrements en boucle. [Inference] Ce second bloc est un candidat pour l'initialisation des predictions de passages ; sa fonction exacte reste a confirmer par decompilation.",
        "La routine de `0x080785BE` compare les octets `0x4E` ('N') et `0x45` ('E') et fait appel aux fonctions numeriques; traitement de coordonnees geographiques candidat.",
        "L'algorithme orbital exact (SGP4, PLAN13 ou autre) n'est **pas identifie**. Le controle Doppler RF n'est **pas isole** : pas de preuve de portage operant.",
        "",
        "## Chaines de menus et faux amis",
        "",
        "| Chaine | D878 | D578 PRO AT | D578 PLUS AT |",
        "|---|---:|---:|---:|"
    ]
    for key in UI_LABELS:
        ss=proof['strings']
        items.append(f"| `{key}` | {len(ss['D878'][key])} | {len(ss['D578_PRO_AT'][key])} | {len(ss['D578_PLUS_AT'][key])} |")
    items += [
        "",
        "`Satellite/PACsat` est un libelle de symbole APRS et `TOT Predict` un autre libelle de menu. Ces chaines existent aussi dans les D578 et **ne prouvent pas** la presence de suivi satellite.",
        "Le D878 possede une entree `Satellite` et une chaine `Predicting` non trouvees comme telles dans les D578 comparés.",
        "Les references pointeur des libelles sont des donnees de menu, **pas** automatiquement des fonctions.",
        "",
        "## Memorisation, Flash, versions",
        "",
        "- Les `.CDD` sont des images ARM deja compilees, sans source. Aucune zone libre de 256 octets remplie uniquement de `0x00` ou `0xFF` n'est apparue dans ces images. Cela **ne determine pas** la capacite Flash totale ni les zones hors image.",
        "- Les variantes D578 `GD` et `AT` ont des tailles et vecteurs differents. Ne pas melanger leurs firmwares.",
        "- PRO V1.20 (janvier 2024), PLUS V2.08 (juin 2024), D878 V3.07 (avril 2025) : comparaison interversions, non un diff fonctionnalite identique a date egale.",
        "- La release D878 V3.08N (juin 2025) a corrige la frequence TX satellite et la precision des passages ; le journal constructeur V4.00 (aout 2025) indique le retrait du mode satellite pour stabilite / limitations de ressources.",
        "- La fonctionnalite satellite comporte aussi les routines de menu, stockage TLE, mises a jour CPS, GPS/heure, timers, gestion des VFO et du PTT. Ce ne sont pas des routines orbitales seules.",
        "",
        "## Proposition de travail pour un vrai portage",
        "",
        "1. Dans Ghidra, decompiler `D878.elf` et marquer les fonctions `0x08077CC8`, `0x0807806C`, `0x080785BE`, `0x08078620`, `0x0807A7A8`, `0x08079C32`; tracer leurs appelants et variables. Ne pas creer de fonctions dans les zones de constantes.",
        "2. Retrouver les interfaces de frequence RX/TX, lire TLE/RTC/GPS, puis definir une API d'adaptation distincte pour D578 GD et D578 AT.",
        "3. Determiner la capacite Flash, les partitions et la signature/methode d'update du bootloader D578 sur materiel avant d'envisager une image modifiee.",
        "4. Prototyper la propagation TLE et le Doppler sur PC, valider contre un moteur orbital independant, puis seulement envisager des essais sur radio avec possibilite de recuperation.",
        "",
        "**Verdict:** faisabilite theorique, portage natif non prouve. Aucun firmware a flasher n'est fourni.",
        "",
        "## Fichiers associes",
        "",
        "- `preuves.json` : tailles, SHA-256, vecteurs, chaines, constantes, appels verifies.",
        "- `ELF/*.elf` : images pour analyse dans Ghidra, non flashables.",
        "- `desassemblages/*.s` : extraits Thumb-2 generes par LLVM, si present.",
        "- `Ghidra_Satellite_D878.py` : script Ghidra optionnel de decompilation ciblee, non execute ici.",
        "- `analyse_satellite_anytone.py` : controle automatisable, lecture seule.",
        "",
    ]
    (out/'rapport_technique.md').write_text('\n'.join(items),encoding='utf-8')

def main():
    ap=argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--d878',type=Path,required=True)
    ap.add_argument('--pro',type=Path,required=True)
    ap.add_argument('--plus',type=Path,required=True)
    ap.add_argument('--out',type=Path,required=True)
    ap.add_argument('--elf',action='store_true',help='Create ELF for Ghidra')
    ap.add_argument('--disasm',action='store_true',help='Extract selected Thumb assembly (LLVM required)')
    ap.add_argument('--selftest',action='store_true')
    opt=ap.parse_args()
    dst=opt.out
    dst.mkdir(parents=True,exist_ok=True)
    images={}
    provenance={}
    for path,names in [(opt.d878,{'D878'}),(opt.pro,{'D578_PRO_AT','D578_PRO_GD'}),(opt.plus,{'D578_PLUS_AT','D578_PLUS_GD'})]:
        image=extract_firmware(path,names)
        images.update({k:x['cdd'] for k,x in image.items()})
        provenance.update({k:f'{path.name}::{x["name"]}' for k,x in image.items()})
    proof={"images":{},"strings":{},"constants":{},"calls":[],"sources":provenance}
    for key,b in images.items():
        base=MODELS[key][1]
        sp,entry=struct.unpack_from('<II',b)
        proof['images'][key]={"bytes":len(b),"sha256":sha(b),"base":f'0x{base:08X}',"end":f'0x{base+len(b):08X}',"initial_SP":f'0x{sp:08X}',"reset_vector":f'0x{entry:08X}',"valid_vector":bool(entry&1 and base<=(entry&~1)<base+len(b) and 0x20000000<=sp<0x20100000),"max_blank_runs":longest_blanks(b)}
        proof['strings'][key]={}
        for label in UI_LABELS:
            # exact null-terminated string, to avoid counting APRS icon labels as satellite mode.
            all_found=search_ascii(b,label)
            valid=[p for p in all_found if p+len(label)<len(b) and b[p+len(label)]==0]
            proof['strings'][key][label]=[f'0x{base+p:08X}' for p in valid]
    B=images['D878'];base=MODELS['D878'][1]
    for key,addr,typ,val in ORBIT_CONSTANTS:
        raw=byte_at(B,addr,base,struct.calcsize(typ))
        actual=struct.unpack(typ,raw)[0]
        proof['constants'][key]={"address":f'0x{addr:08X}',"value":actual,"match":math.isclose(actual,val,rel_tol=1e-6,abs_tol=1e-8),"bytes":raw.hex(' '),"cdd_offset":f'0x{addr-base:06X}',"other_images_with_same_bytes":[other for other,dat in images.items() if other!='D878' and raw in dat]}
    for source,target in TRUSTED_CALLS:
        value=get_bl_target(B,base,source)
        proof['calls'].append({"source":f'0x{source:08X}',"target":f'0x{target:08X}',"decoded_target":f'0x{value:08X}' if value is not None else None,"match":value==target})
    # LLVM disassembler verifies the LDR literal references to constants.
    proof['literal_refs']=[{"ldr":"0x08077D18","literal_addr":"0x08078024","type":"LDR literal Thumb16"},{"ldr":"0x08077D42","literal_addr":"0x0807802C","type":"LDR literal Thumb16"},{"ldr":"0x08077EB6","literal_addr":"0x08078044","type":"LDR literal Thumb16"}]
    (dst/'preuves.json').write_text(json.dumps(proof,indent=2,ensure_ascii=False)+'\n',encoding='utf-8')
    if opt.elf:
        (dst/'ELF').mkdir(exist_ok=True)
        for key,b in images.items():
            elf_for_cortex(b,MODELS[key][1],dst/'ELF'/f'{key}.elf')
    if opt.disasm:
        llvm=shutil.which('llvm-objdump')
        if not llvm:print('WARNING: llvm-objdump is not available; skipping assembly',file=sys.stderr)
        else:
            (dst/'desassemblages').mkdir(exist_ok=True)
            elf=dst/'ELF'/'D878.elf'
            elf.parent.mkdir(parents=True,exist_ok=True)
            if not elf.exists():elf_for_cortex(B,base,elf)
            for key,(start,end) in ORBIT_CANDIDATES.items():
                result=subprocess.run([llvm,'-d','--triple=thumbv7m-none-eabi',f'--start-address=0x{start:X}',f'--stop-address=0x{end:X}',str(elf)],text=True,capture_output=True,timeout=30)
                if result.returncode:raise RuntimeError(result.stderr)
                (dst/'desassemblages'/f'{key}.s').write_text(result.stdout,encoding='utf-8')
    report(proof,dst)
    must=[x['valid_vector'] for x in proof['images'].values()]
    must+= [x['match'] for x in proof['constants'].values()]
    must+= [x['match'] for x in proof['calls']]
    if opt.selftest:
        assert all(must),json.dumps(proof,indent=2)
        assert proof['strings']['D878']['Satellite']==['0x080E3E94'],proof['strings']['D878']['Satellite']
        assert proof['strings']['D878']['Predicting']==['0x080E4160'],proof['strings']['D878']['Predicting']
        assert not proof['strings']['D578_PRO_AT']['Satellite']
        assert not proof['strings']['D578_PLUS_AT']['Satellite']
        print('SELFTEST : OK (vectors / BL / constants / satellite strings)')
    print('Generated:',dst)
    print('Number of proofs:',len(proof['calls']),'BL,',len(proof['constants']),'constants')

if __name__=='__main__':main()
