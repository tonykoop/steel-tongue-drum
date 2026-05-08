# Steel Tongue Drum

Root-mode engineering packet for a tuned steel tongue drum: a slit-tongue steel idiophone whose final tuning must be measured and corrected on the actual prototype.

This repo is part of the [tonykoop/instrument-maker](https://github.com/tonykoop/instrument-maker) catalogue and uses the `instrument-maker-v4` root packet shape.

## What this is

This packet turns the existing `steel-tongue-drum-design-table.xlsx` into a build-ready documentation set for a circular steel tongue drum. The workbook provides first-pass geometry, material constants, target MIDI notes, a rough Helmholtz body estimate, and tongue length formulas.

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

## Packet map

- `design.md` - design intent, assumptions, formulas, tuning workflow.
- `family-spec.csv` - root-mode family row for the current steel tongue drum.
- `bom.csv`, `sourcing.csv`, `cut-list.csv` - purchasing and shop prep.
- `assembly-manual.md` - rough build, cutting, tuning, finish, and mount steps.
- `validation.csv` - tuning and process validation rows, including rough-cut, deburr, first strike, tuning pass, final mount, and drift check.
- `drawing-brief.md`, `drawings/` - drawing requirements and starter layout SVG.
- `cad/`, `cnc/`, `jigs/` - SolidWorks/CAM/fixture briefs.
- `risks.md` - acoustic, structural, ergonomic, supply, and finish risks with tests.
- `capstone-deck.md`, `print-packet.md`, `print-packet.html`, `site/index.html` - review and presentation layers.

## Readiness

This packet is private-prototype ready. It should stay private for public technical review until a rough-cut prototype is struck, tuned, mounted, drift-checked, and logged with measured Hz and cents error.

## License

[CC BY 4.0](LICENSE) - see LICENSE for details.
