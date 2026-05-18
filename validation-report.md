# Validation Report

**Status:** pre-build validation path is defined; no measured prototype data has been logged yet.

## Current result

The packet is ready for human shop review and first-prototype planning. All tongue lengths, target notes, and shell assumptions are still predictions from the workbook and first-order models. No row in `validation.csv` should be treated as measured performance until the `measured_hz`, `cents_error`, `environment`, `support_condition`, and `result` fields are populated from a real build.

## Prototype under test

| Field | Value |
|---|---|
| Member | STD-001 |
| Form | 12 in round steel shell / vessel |
| Scale study | D3 bass plus 10 upper tongues from the workbook layout |
| Material assumption | Low-carbon steel around 0.079 in thick |
| Port assumption | 2.5 in |
| Validation state | Planning packet only; no rough-cut prototype measured |

## What has been validated

- A4 reference and equal-temperament target method are documented.
- Workbook assumptions and first-pass tongue lengths are surfaced in `design.md`.
- The required tuning workflow exists in `validation.csv`.
- Manufacturing risks for laser, waterjet, CNC, deburring, support, finish, and drift are documented.
- `cnc/README.md`, `jig-decision.md`, and `data/measurement-capture-plan.md` define the coupon, support, and evidence path before any public tuning claims.
- `cnc/coupon-first-cam-cad-gate.md` and `data/coupon-cam-cad-log.csv` now define the issue #5 CAM/CAD promotion gate and evidence row.

## Physical measurements still needed

| Category | Required measurement | Why it matters |
|---|---|---|
| Material | Actual steel grade, thickness, and any forming/weld notes | The cantilever estimate depends directly on thickness and indirectly on real material behavior |
| Cutting | Actual kerf, taper, burr condition, HAZ, and top warp | Process artifacts can move pitch before any tuning begins |
| Rough-cut tuning | First-strike Hz for every tongue before trimming | Establishes how far the workbook estimate is from reality |
| Tuning path | Cents error and trim notes at each pass | Needed to prove the process is repeatable rather than lucky |
| Mounting | Temporary cradle vs final-feet pitch and sustain shift | Support condition is part of the instrument |
| Finish | Post-finish pitch shift and damping change | Coating mass can move tuning and sustain |
| Drift | 24-72 hour rest re-check | Confirms the result is stable enough for public review |

## Acceptance gates

| Gate | Target | Pass condition | Current state |
|---|---|---|---|
| Material confirmation | Real blank documented | Grade/spec recorded or explicitly marked unknown; thickness measured at multiple points | Pending build |
| Kerf coupon | First-process sample | Actual slot width and burr condition logged before cutting the instrument | Pending build |
| CAM/CAD release | Coupon-first authority | Coupon log records kerf, edge condition, and compensation decision before DXF/CAM promotion | Blocked until coupon evidence |
| Rough-cut first strike | Every tongue measured | Stable Hz captured for bass plus all numbered tongues | Pending build |
| Tuning pass | Pre-mount tuning | Each tongue within plus/minus 10 cents before final mount, or deviation explained | Pending build |
| Final mount | Mount-dependent shift documented | Temporary support vs final feet comparison recorded | Pending build |
| Finish check | Coating effect documented | Pitch and sustain re-checked after finish cure | Pending build |
| Drift check | Short-term stability | 24-72 hour rest reading logged | Pending build |
| Structural review | No cracks or unsafe edges | Slot roots intact, edges deburred, no rattles from feet or trim | Pending build |

## Test sequence

1. Measure the real blank thickness at multiple points and note the best available steel spec.
2. Cut and strike a kerf/tuning coupon using the actual process before cutting the full tongue field.
3. Document slot taper, burr condition, any HAZ or warp, and the CAM compensation decision in `data/coupon-cam-cad-log.csv`.
4. Rough-cut the full tongue field and capture first-strike Hz for every tongue on the temporary cradle.
5. Tune iteratively, logging every trim pass and cents change in `validation.csv`.
6. Install final feet or isolation supports and re-measure the full tongue set.
7. Apply finish only after pre-finish tuning is documented, then re-check after cure.
8. Run the 24-72 hour drift check and update this report from assumptions to measured results.

## Readiness call

Private-prototype ready: yes.

Public-review ready as a tuned instrument: no.

Close-ready as a public-safe build packet: yes, provided the repo continues to describe all tuning values as predictions until the measurements above are captured.

CAM/CAD build-ready: no. The issue #5 coupon gate remains blocked until a real
coupon row is measured and reviewed.
