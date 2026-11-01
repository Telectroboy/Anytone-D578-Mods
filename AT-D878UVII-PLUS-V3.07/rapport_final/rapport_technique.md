# AnyTone D878UVII PLUS V3.07 -> D578UV PRO/PLUS : analyse satellite

Analyse **statique** de fichiers constructeur fournis par l'utilisateur. Aucun test radio, aucun firmware modifie ou flashe.

## Sources et architectures

| Image | Longueur | Debut image Flash | Fin image | Reset vector | SHA-256 (prefixe) |
|---|---:|---|---|---|---|
| D878 | 938,744 | `0x08004000` | `0x080E92F8` | `0x08004CB1` | `e154a1a4babf4562` |
| D578_PRO_AT | 1,039,472 | `0x08006000` | `0x08103C70` | `0x08006335` | `64583a33c80de7e0` |
| D578_PRO_GD | 1,020,096 | `0x08006000` | `0x080FF0C0` | `0x08006D39` | `1cdf1817f8abbbee` |
| D578_PLUS_AT | 1,040,008 | `0x08006000` | `0x08103E88` | `0x08006335` | `146b7cdada219122` |
| D578_PLUS_GD | 1,020,408 | `0x08006000` | `0x080FF1F8` | `0x08006D39` | `8efad950169f332c` |

Remarque : les adresses proviennent des tables de vecteurs et des entetes `.CDI`. Le D878 est charge a `0x08004000`, les D578 a `0x08006000`.
Un transfer direct des blocs de code n'est donc pas possible sans relocalisation des constantes et appels (et adaptation des structures internes).

## Indices satellite retrouves dans le D878

| Donnee | Adresse D878 | Constat |
|---|---|---|
| DEG_TO_RAD_DOUBLE | `0x08078024` | 0.017453292519943295 ; controle `OK` |
| PI_DOUBLE | `0x0807802C` | 3.141592653589793 ; controle `OK` |
| EARTH_RADIUS_WGS84_FLOAT | `0x08078044` | 6378.13720703125 ; controle `OK` |
| TWO_PI_DOUBLE | `0x08078934` | 6.283185307179586 ; controle `OK` |

La constante WGS84 `6378.137 km` et les constantes de conversion angulaire correspondent a un traitement geographique/orbital, dans une zone de nombreuses fonctions Thumb-2 avec calculs en double precision.
[Inference] L'ensemble `0x08076D00..0x0807A000` constitue une **zone de travail candidate** pour l'analyse du suivi satellite. Il ne faut pas l'assimiler a une fonction unique, et certaines routines peuvent etre reutilisees ailleurs.

## Instructions et appels verifiables

| Source | Cible | Type | Verification |
|---|---|---|---|
| `0x08049476` | `0x080785BE` | `BL` | OK |
| `0x0804947A` | `0x0807A7A8` | `BL` | OK |
| `0x0807A7C2` | `0x08079C32` | `BL` | OK |
| `0x0807A7E0` | `0x08079A60` | `BL` | OK |
| `0x08078618` | `0x08078326` | `BL` | OK |
| `0x0807816C` | `0x08077CC8` | `BL` | OK |
| `0x080796FA` | `0x0807806C` | `BL` | OK |

Exemples de chemins effectivement encodes dans le D878 : `0x08049476 -> 0x080785BE -> 0x08078326`, puis `0x0804947A -> 0x0807A7A8 -> 0x08079C32`.
La sequence des deux `BL` consecutifs `0x08049476` / `0x0804947A` relie la preparation des coordonnees a une routine qui initialise plusieurs etats et parcourt une liste d'enregistrements en boucle. [Inference] Ce second bloc est un candidat pour l'initialisation des predictions de passages ; sa fonction exacte reste a confirmer par decompilation.
La routine de `0x080785BE` compare les octets `0x4E` ('N') et `0x45` ('E') et fait appel aux fonctions numeriques; traitement de coordonnees geographiques candidat.
L'algorithme orbital exact (SGP4, PLAN13 ou autre) n'est **pas identifie**. Le controle Doppler RF n'est **pas isole** : pas de preuve de portage operant.

## Chaines de menus et faux amis

| Chaine | D878 | D578 PRO AT | D578 PLUS AT |
|---|---:|---:|---:|
| `Satellite` | 1 | 0 | 0 |
| `Predicting` | 1 | 0 | 0 |
| `Satellite/PACsat` | 1 | 1 | 1 |
| `TOT Predict` | 1 | 1 | 1 |

`Satellite/PACsat` est un libelle de symbole APRS et `TOT Predict` un autre libelle de menu. Ces chaines existent aussi dans les D578 et **ne prouvent pas** la presence de suivi satellite.
Le D878 possede une entree `Satellite` et une chaine `Predicting` non trouvees comme telles dans les D578 comparés.
Les references pointeur des libelles sont des donnees de menu, **pas** automatiquement des fonctions.

## Memorisation, Flash, versions

- Les `.CDD` sont des images ARM deja compilees, sans source. Aucune zone libre de 256 octets remplie uniquement de `0x00` ou `0xFF` n'est apparue dans ces images. Cela **ne determine pas** la capacite Flash totale ni les zones hors image.
- Les variantes D578 `GD` et `AT` ont des tailles et vecteurs differents. Ne pas melanger leurs firmwares.
- PRO V1.20 (janvier 2024), PLUS V2.08 (juin 2024), D878 V3.07 (avril 2025) : comparaison interversions, non un diff fonctionnalite identique a date egale.
- La release D878 V3.08N (juin 2025) a corrige la frequence TX satellite et la precision des passages ; le journal constructeur V4.00 (aout 2025) indique le retrait du mode satellite pour stabilite / limitations de ressources.
- La fonctionnalite satellite comporte aussi les routines de menu, stockage TLE, mises a jour CPS, GPS/heure, timers, gestion des VFO et du PTT. Ce ne sont pas des routines orbitales seules.

## Proposition de travail pour un vrai portage

1. Dans Ghidra, decompiler `D878.elf` et marquer les fonctions `0x08077CC8`, `0x0807806C`, `0x080785BE`, `0x08078620`, `0x0807A7A8`, `0x08079C32`; tracer leurs appelants et variables. Ne pas creer de fonctions dans les zones de constantes.
2. Retrouver les interfaces de frequence RX/TX, lire TLE/RTC/GPS, puis definir une API d'adaptation distincte pour D578 GD et D578 AT.
3. Determiner la capacite Flash, les partitions et la signature/methode d'update du bootloader D578 sur materiel avant d'envisager une image modifiee.
4. Prototyper la propagation TLE et le Doppler sur PC, valider contre un moteur orbital independant, puis seulement envisager des essais sur radio avec possibilite de recuperation.

**Verdict:** faisabilite theorique, portage natif non prouve. Aucun firmware a flasher n'est fourni.

## Fichiers associes

- `preuves.json` : tailles, SHA-256, vecteurs, chaines, constantes, appels verifies.
- `ELF/*.elf` : images pour analyse dans Ghidra, non flashables.
- `desassemblages/*.s` : extraits Thumb-2 generes par LLVM, si present.
- `Ghidra_Satellite_D878.py` : script Ghidra optionnel de decompilation ciblee, non execute ici.
- `analyse_satellite_anytone.py` : controle automatisable, lecture seule.
