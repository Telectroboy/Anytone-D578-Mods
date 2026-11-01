# AnyTone D578UV PRO GD32 - Satellite Engine, Phase 2

**Standalone ARM Cortex-M4 satellite engine. No flashable firmware, no CAT/RF access.**

## One-command build, test and ARM compilation

Requirements: Linux/macOS with GCC (or C11-compatible cc), Python 3. Optional:
Clang 17+ and LLVM `llvm-objdump` to compile for Cortex-M4 and report size.

```sh
sh run_all.sh
```

The script executes the two published Vallado verification vectors, view geometry,
AOS/LOS pass detection, cooperative predictor, Doppler, PTT and feedback control,
then builds ARM objects if Clang is present. No firmware or radio is accessed.

`out/demo_satellite` runs a **historical** TLE to illustrate results and prints
explicit warnings. Its RX/TX example frequencies are fictional and for
simulation only.

To try fresh TLEs saved locally (two-line or three-line TLE file) without a radio:

```sh
./out/demo_satellite new.tle 49.0 4.6 200 1794000000
```

Parameters: `TLE_FILE LATITUDE_DEG LONGITUDE_DEG ALTITUDE_METERS UNIX_UTC_SECONDS`.
The program refuses a TLE older than 14 days. Replace the numeric UTC example
with a timestamp corresponding to your own *fresh* TLE. No actual radio model
or satellite is needed to execute it.

## Modules

- `src/sat_sgp4.[ch]`: original near-Earth SGP4/WGS-72 implementation with fixed-size state (no malloc), TLE parser and checksum validation. **No SDP4/deep space.**
- `src/sat_track.[ch]`: TEME to Earth-fixed coordinates (approx. UT1=UTC), WGS-84 observer, azimuth/elevation/range/range-rate; blocking reference pass predictor for host simulation.
- `src/sat_predict.[ch]`: **cooperative** AOS/LOS predictor; limit each invocation to at most 1..16 SGP4 propagations.
- `src/satellite_doppler.[ch]`: RX and TX Doppler in units of 10 Hz, band bounds, PTT gate.
- `src/sat_controller.[ch]`: no-hardware command proposal with acknowledgements, timeout, stale-TLE guard, manual-QSY detection, PTT gate.
- `src/satellite_runtime.[ch]`: previous phase simple rate limiting (included for regression testing).
- `src/demo_satellite.c`: read-only simulator.
- `tests/`: host unit/integration tests with published verification vectors.
- `tools/measure_resources.py`: ARM `.text` and compiler-reported stack use.
- `out/resource_report.md`: measured resource footprint of compiler objects.
- `docs/ANALYSE_TECHNIQUE.md`: conclusions and non-tested aspects.

## Verified scope

- Object 00005, 4 position+velocity references in TEME at 0..1080 minutes
- Object 06251, 5 references at 0..720 minutes (nonzero atmospheric drag)
- TLE checksum rejection
- Azimuth, elevation, range, signed radial velocity consistency
- AOS/LOS and maximum elevation (cooperative and blocking paths)
- PTT held, invalid telemetry, stale TLE, explicit frequency acknowledgment,
  timeout and replan, manual VFO frequency divergence
- Cortex-M4 freestanding **object** compilation

## Critical caveats

- No radio hardware testing, no RF write and no AnyTone patch yet.
- This is a near-Earth SGP4 implementation only. Sun/Moon, SDP4, orbit decay
  edge cases and exhaustive conformance are out of scope.
- WGS-84 observer geometry uses approximate Earth orientation and UT1=UTC;
  polar motion and atmospheric refraction are omitted.
- Predicted AOS/LOS have **not** been cross-validated against a separate
  ground-station tracking program.
- GD32 Cortex-M4 has an FPU for `float` but not `double`; numerical routines
  require libm + compiler support. Processor cycle cost is not measured.
- ARM `.o` sections do **not** include linked libm/compiler runtime, Bootloader,
  menus, TLE storage or RF drivers.
- There is no proven spare area for code insertion. Known firmware references
  upper internal Flash around `0x082F5800` and `0x082FF800`.
- The firmware uploader and recovery path have not been validated for a
  relocated or expanded image. Do not flash any of these objects.

## Public reference data

- Vallado et al., *Revisiting Spacetrack Report #3*, Rev 2, Appendix E,
  CelesTrak: https://celestrak.org/publications/aiaa/2006-6753/AIAA-2006-6753-Rev2.pdf
- CelesTrak's SGP4 verification overview:
  https://celestrak.org/software/tutorials/sgp4-verification.php
- AnyTone D578 GD Phase 1 findings (Flash audit) came from the user-provided
  official V1.20 and V2.08 ZIP archives. Original proprietary binary files
  are **not redistributed** in this Phase 2 bundle.

## Development priorities

1. Full ARM linkage with validated GCC/Clang libm/ABI and concrete CPU/stack timing.
2. Verify D578 GD32 MCU and AnyTone bootloader Flash layout and recovery.
3. Locate RF frequency update API, PTT/radio-mode arbitration and menu handlers.
4. Add external-data update path for TLEs and coherent UTC/GPS handling.
5. On-device validation through an initially read-only satellite menu.
