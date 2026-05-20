# Steel Tongue Drum

Root-mode engineering packet for a tunable steel tongue drum: a slit-tongue steel idiophone whose final tuning must be measured and corrected on the actual prototype.

**Status:** L2 root-mode packet / prototype planning. This repo is not L3,
measured, or build-ready evidence yet; slot geometry, heat/stress behavior,
tuning response, support shift, finish shift, and safety checks still require
logged prototype measurements.

This repo is part of the [tonykoop/instrument-maker](https://github.com/tonykoop/instrument-maker) catalogue and uses the `instrument-maker-v4` root packet shape.

## What this is

This packet turns the existing `steel-tongue-drum-design-table.xlsx` into a prototype-planning documentation set for a circular steel tongue drum. The workbook provides first-pass geometry, material constants, target MIDI notes, a rough Helmholtz body estimate, and tongue length formulas.

The important caveat: steel tongue drums are empirical instruments. The cantilever equation is useful for rough layout, but final pitch depends on steel batch, residual stress, slot kerf, heat affected zone, burrs, mounting isolation, mallet hardness, finish mass, and the way each tongue is trimmed. This repo is therefore not "tuned" until measured prototype data exists in `validation.csv`.

## Current design baseline

| Item | Baseline |
| --- | --- |
| Body form | Round steel shell / vessel |
| Outside diameter | 12 in assumption from workbook |
| Shell height | 6 in assumption from workbook |
| Steel thickness | 0.079 in derived from workbook input |
| Slot kerf | 0.040 in workbook assumption |
| Tongue width | 1.0 in workbook assumption |
| Port diameter | 2.5 in workbook assumption |
| Tuning reference | A4 = 440 Hz |
| Governing model | `f = K_steel * t / L^2`, first-pass only |
| Validation state | No measured prototype data yet |

## Predicted vs measured

| Category | Current packet status | What still needs physical measurement |
| --- | --- | --- |
| Tongue lengths and target notes | First-pass predictions from the workbook and `design.md` | First-strike Hz, cents error, and trim history for every tongue |
| Steel thickness and K behavior | 0.079 in and workbook K treated as assumptions | Actual sheet thickness, steel grade, and back-solved effective K after tuning |
| Cutting process | Laser / waterjet / CNC options documented | Actual kerf, burr condition, HAZ or taper, and any warp from the chosen process |
| Shell / port behavior | Port and body resonance treated as support variables | Actual port diameter, internal geometry, mount-dependent sustain, and any shell-coupled pitch shift |
| Final readiness | Private-prototype ready packet | Measured rough-cut, deburr, tuning-pass, final-mount, finish-cure, and drift-check data |

## Physical measurements still needed

- Steel grade or best-available supplier spec for the actual blank.
- Thickness measurements at multiple points on the real shell or top plate.
- Kerf coupon results for the chosen cutting method, including burr and taper notes.
- First-strike Hz for bass plus every numbered tongue before trimming.
- Cents error before tuning, after tuning, after final mounting, after finish cure, and after 24-72 hour rest.
- Port diameter and any change after deburring or finish.
- Support-condition notes for temporary cradle versus final feet.

## Packet map

- `design.md` - design intent, assumptions, formulas, tuning workflow.
- `family-spec.csv` - root-mode family row for the current steel tongue drum.
- `bom.csv`, `sourcing.csv`, `cut-list.csv` - purchasing and shop prep.
- `assembly-manual.md` - rough build, cutting, tuning, finish, and mount steps.
- `validation.csv` - tuning and process validation rows, including rough-cut, deburr, first strike, tuning pass, final mount, and drift check.
- `validation-report.md` - current readiness call, acceptance gates, and human-owned measurement work.
- `data/coupon-cam-cad-log.csv` - coupon evidence capture table for CAM/CAD promotion decisions.
- `drawing-brief.md`, `drawings/` - drawing requirements and starter layout SVG.
- `explorer.html` - issue #5 explorer surface for packet status, authority boundaries, and measurement gates.
- `visual-output-register.csv` - visual authority register for the workbook, measurement template, and layout SVG.
- `cad/`, `cnc/`, `jigs/` - SolidWorks/CAM/fixture briefs, including the issue #5 coupon-first CAM/CAD authority gate.
- `images/`, `data/`, `wolfram/` - starter folders for future photos, measured results, notebook notes, and the measurement capture plan.
- `issue-comment-draft.md` - sprint-ready issue summary for `tonykoop/steel-tongue-drum#1`; do not post automatically.
- `risks.md` - acoustic, structural, ergonomic, supply, and finish risks with tests.
- `capstone-deck.md`, `print-packet.md`, `print-packet.html`, `site/index.html` - review and presentation layers.

## Readiness

This packet is private-prototype planning ready. It should stay private for public technical review until a rough-cut prototype is struck, tuned, mounted, drift-checked, and logged with measured Hz and cents error.

## Round 3 L2 Boundary

For the Round 3 build-packet sweep, treat this repo as an L2 root-mode packet:
complete enough for design review, sourcing review, and first prototype
planning, but not L3/build-ready evidence. The existing workbook and packet
tables define a controlled measurement path; they do not replace measured
strike data from a real steel shell.

The acceptance line for L3 is unchanged: every tongue needs target Hz, measured
Hz, cents error, support condition, trim history, final mount shift, finish
shift, and 24-72 hour drift logged in `validation.csv`.

## Issue 5 CAM/CAD Coupon Gate

Issue #5 is not complete yet. The repo now has an explicit
`cnc/coupon-first-cam-cad-gate.md` and `data/coupon-cam-cad-log.csv` so the
first coupon can promote or block CAD/DXF/CAM decisions with evidence. Until
that coupon row contains real material, kerf, taper, burr/HAZ/warp, and strike
measurements, the starter SVG, workbook, CAD brief, and CNC brief remain
documentation and prototype-planning artifacts only.

## License

[CC BY 4.0](LICENSE) - see LICENSE for details.
