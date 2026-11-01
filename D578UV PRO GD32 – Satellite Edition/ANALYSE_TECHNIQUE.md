# Rapport technique - D578UV PRO GD32, phase 2

Date : 2026-11-01. Statut : prototype logiciel indépendant, non flashable.

## 1. Plateforme et contraintes

Deux D578UV PRO avec MCU GigaDevice GD32F303VKT6 (Cortex-M4, Flash 3 Mio,
SRAM 96 Kio). Branche firmware GD, et non AT32.

D'après l'audit de phase 1, le PRO V1.20 se charge a `0x08006000` avec une fin
exclusive `0x080FF0C0`, soit 3904 octets avant `0x08100000`.
Le firmware utilise aussi des adresses supérieures comme `0x082F5800` et
`0x082FF800`. Cela interdit de déclarer automatiquement la Flash supérieure
libre. L'existence d'une plage adressable n'est pas une méthode de mise a jour.

## 2. Travail réellement fait

Une implémentation originale des formules SGP4 proche-Terre (WGS-72) a été
écrite en C11 ; aucun bloc du firmware AnyTone n'y est copié. Elle est
indépendante du pilote RF et n'alloue aucune mémoire dynamiquement.
Le parseur vérifie le numéro de catalogue, les deux checksums TLE, la date et
les paramètres orbitaux élémentaires. Les périodes > 225 min ne sont pas
supportées (pas de SDP4).

Validation numérique :
- Vallado 00005, t=0, 360, 720, 1080 min : erreur max <0.1 millimètre
  en position sur les références arrondies de l'appendice.
- Vallado 06251, t=0, 120, 240, 360, 720 min : erreur max observée
  0.000000543 km (=0.543 mm), erreur vitesse 0.000000000734 km/s.
- Les tests C passent sur ordinateur. Ce sont des tests du propagateur, pas
  une évaluation des passages visibles à partir d'un QTH réel.

La chaîne additionnelle calcule les coordonnées station (WGS-84), la position
ECEF approximée, l'azimut, l'élévation, la distance et la dérivée de distance.
La correction Doppler tient compte du signe de la vitesse radiale :
- vitesse positive (satellite s'éloigne) => fréquence RX reçue plus basse ;
  l'émetteur doit corriger sa fréquence montante vers le haut ;
- vitesse négative (satellite approche) => inverse.

## 3. Prédiction en tranches pour protéger les tâches radio

Le calcul du prochain passage peut demander des milliers d'évaluations
SGP4. Une boucle de 12h ne doit pas être lancée dans la tâche centrale du
poste. `sat_predict_step` prend un budget de 1 à 16 évaluations et retourne
un état RUNNING/READY/NO_PASS/ERROR. Les calculs sont répartis entre des
cycles du scheduler, sans prétendre connaître sa disponibilité réelle.

Test avec 2 évaluations par appel : 1072 invocations pour l'exemple ; les
horaires AOS/LOS correspondent au prédicteur bloquant à moins de 2 secondes.

## 4. Gestionnaire sécurisé de consignes

Le contrôleur produit des suggestions de fréquences et attend une confirmation
par **relecture des fréquences RX et TX** avant d'enregistrer la commande comme
appliquée. Les tests couvrent :
- aucune consigne quand PTT actif ;
- TLE plus vieux que la limite ;
- réjection des états temps/GPS/DMR non compatibles ;
- détection d'un QSY manuel et invalidation du cache ;
- ID de requête, timeout, ACK correct, rejet d'ACK obsolète.

**Un vrai pilote RF devra refaire sa propre vérification PTT de façon atomique**
avant de modifier des registres ou une structure radio ; une vérification dans
un calculateur ne remplace jamais un verrouillage dans le pilote TX.

## 5. Taille et CPU

Voir `out/resource_report.md`. Le module complet représente 18 236 octets
de section `.text` ARM non liée, sans les bibliothèques mathématiques
et les dépendances `__aeabi_*`. Cela dépasse la marge d'environ 3904 octets
avant le premier Mio Flash. Il est donc impossible de l'insérer en l'état
uniquement dans cette marge.

Au minimum, 344 octets de contexte SGP4, 168 octets pour le prédicteur,
28 octets pour le contrôleur et 24 pour la station, auxquels s'ajoutent
la pile, les TLE, les états et bibliothèques. Ces tailles ne sont pas des
mesures de RAM totale du firmware.

Les calculs sont en `double`, qui n'est pas matériellement accéléré par le
GD32. La charge CPU reste **non mesurée**. On ne peut pas confirmer le budget
<2% fixé précédemment sans tests matériels.

## 6. Limitations et travaux suivants

- Les codes ARM sont des objets compilés, sans lien final ni intégration
  dans les modules de firmware AnyTone.
- La carte réelle et le bootloader n'ont pas été lus.
- Le logiciel ne met pas à jour ni ne formate des CDD/CDI/SPI.
- La synchronisation GPS/RTC, CPS et la gestion des TLE ne sont pas branchées.
- Le contrôle automatique de la RF, et surtout TX, n'est pas validé.
- SGP4 est validé sur deux cas proche-Terre ; aucune prétention pour SDP4,
  orbites résonantes ou satellites hors service.
- Les passes calculées utilisent des corrections astronomiques approchées
  (sans données EOP/UT1 précises), suffisantes pour un prototype mais à comparer
  à une application reconnue avant usage opérationnel.

## 7. Prochaine étape technique recommandée

1. Déterminer les secteurs Flash librement programmables avec une procédure
   de récupération garantie, sans écrire sur un poste en service.
2. Lier le code avec une libm cible et mesurer ses temps sur Cortex-M4.
3. Décompiler et comparer les fonctions de réglage RX/TX de la branche GD,
   leurs conditions de mode, et les routines d'affichage.
4. Ne tester les réglages RF qu'après avoir validé l'intégrité des mémoires
   et l'inhibition PTT de la voie de modification.

Références techniques : CelesTrak Vallado Rev2 et tutoriel officiel de
vérification SGP4 (liens dans README.md).
