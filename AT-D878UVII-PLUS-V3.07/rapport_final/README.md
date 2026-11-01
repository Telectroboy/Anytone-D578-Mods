# Analyse statique AnyTone : mode Satellite D878 -> D578

## Contenu

- `rapport_technique.md` : observations, adresses et limites du reverse engineering.
- `preuves.json` : hachages SHA-256 des `.CDD`, adresses, constantes et branchements ARM contrôlés.
- `ELF/` : cinq vues ELF **pour Ghidra seulement**, construites à partir des images `.CDD` des ZIP fournis. **Ne pas flasher** ces ELF.
- `desassemblages/` : extraits Thumb-2 des fonctions candidates du D878.
- `analyse_satellite_anytone.py` : analyse reproductible, standard-library Python 3, lecture seule.
- `Ghidra_Satellite_D878.py` : script Ghidra de décompilation ciblée (optionnel, **non exécuté** ici).

## Reproduire l'analyse

Avec les trois ZIP officiels que tu as transmis, dans un même dossier :

```sh
python3 analyse_satellite_anytone.py \
  --d878 'AT-D878UVII-PLUS-V3.07.zip' \
  --pro 'D578UV PRO V1.20  official release 240131.zip' \
  --plus 'D578UV PLUS V2.08 official release 240619.zip' \
  --out analyse_reproduite --elf --disasm --selftest
```

`llvm-objdump` est facultatif et utilisé uniquement pour produire les extraits assembleur.

Pour aller plus loin dans Ghidra, importer `ELF/D878.elf`, laisser tourner l'analyse auto, puis lancer `Ghidra_Satellite_D878.py` avec le programme D878 sélectionné. Le script peut aussi être lancé en headless, selon la version de Ghidra, avec l'option `-postScript Ghidra_Satellite_D878.py /chemin/rapport.txt` et le dossier de scripts ajouté via `-scriptPath`.

## Avertissements et limites

- Les ZIP PRO et PLUS datent de 2024, alors que le D878 V3.07 date de 2025 ; les différences ne sont pas un diff isolé de la fonction Satellite.
- L'existence de constantes géographiques, d'éléments de menus et d'appels ARM **ne prouve pas** que le calcul Doppler a été totalement retrouvé.
- Toute modification réelle exige l'identification des appels RF du D578, de la mémoire Flash libre, du format de mise à jour, du MCU (AT32 ou GD32) et une méthode de restauration fiable.
- Aucune modification ou émission radio n'a été réalisée. Aucune image flashable n'est fournie.
