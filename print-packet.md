# Steel Tongue Drum Capstone Print Packet

Generated: 2026-05-08
Packet folder: `/mnt/c/Users/Tony/Documents/GitHub/steel-tongue-drum`

## File Map

| File | Purpose |
| --- | --- |
| `design.md` | Project intent, catalog metadata, assumptions, and validation plan. |
| `bom.csv` | Starter bill of materials with part categories, quantities, drawing refs, and notes. |
| `sourcing.csv` | Supplier/search tracker with specs, price/date fields, lead time, substitutes, and risks. |
| `cut-list.csv` | Rough/final stock sizes, material, grain/orientation, operations, yield, and offcuts. |
| `drawing-brief.md` | Manufacturing drawing and technical product sketch brief. |
| `assembly-manual.md` | Shop-facing sequence, tools, fixtures, safety, tuning, finishing, and maintenance notes. |
| `validation.csv` | Target/measured values, tolerance, environment, result, and tuning/build action log. |
| `supplier-rfq.md` | Supplier email/request-for-quote starter. |
| `visual-bom-brief.md` | Art direction for an image-forward visual BOM. |
| `steel-tongue-drum-starter.wl` | Wolfram starter for physics, optimization, visualization, and validation. |
| `README.md` | Project artifact. |
| `family-spec.csv` | Project artifact. |
| `jig-decision.md` | Project artifact. |
| `photo-shotlist.md` | Project artifact. |
| `resources.md` | Project artifact. |
| `risks.md` | Project artifact. |
| `validation-report.md` | Project artifact. |

<div class="page-break"></div>

## design.md

Project intent, catalog metadata, assumptions, and validation plan.

# Steel Tongue Drum Design

Generated: 2026-05-08

## Intent

Create a traceable root-mode packet for a tuned steel tongue drum. The packet documents the first-pass geometry from `steel-tongue-drum-design-table.xlsx`, the manufacturing assumptions that can move pitch, and the validation workflow needed to turn estimates into a tuned instrument.

This design is intentionally conservative about claims. The workbook formulas size tongues from a cantilever model, but the final instrument must be tuned by measured cutting and strike tests.

## Source Artifacts

| Source | Role | Status |
| --- | --- | --- |
| `steel-tongue-drum-design-table.xlsx` | Design table and first-pass geometry | Present |
| `README.md` | Root repo overview | Expanded in this packet |
| `instrument-maker-v4` references | Physics, sourcing, print packet, validator | Applied |
| Measured prototype data | Required for final tuning confidence | Not present |

## Workbook Inputs Used

| Parameter | Value | Unit | Source / confidence |
| --- | ---: | --- | --- |
| Shell outside diameter | 12.000 | in | workbook input, assumption |
| Shell height | 6.000 | in | workbook input, assumption |
| Steel thickness | 0.079 | in | workbook input, verify with calipers |
| Kerf width | 0.040 | in | workbook input, process-dependent |
| Tongue count | 11 | count | workbook note rows include bass row plus 10 numbered rows |
| Tongue width | 1.000 | in | workbook input, derived estimate |
| Port diameter | 2.500 | in | workbook input, derived estimate |
| Tuning standard | 440 | Hz | A4 reference |
| Selected K constant | 32098 | imperial | workbook steel table, first-pass only |

## Governing Model

Use the cantilever beam model only as an initial layout estimate:

```text
f = K_steel * t / L^2
L = sqrt(K_steel * t / f)
```

Where:

- `f` is target frequency in Hz.
- `K_steel` is the workbook steel constant, currently 32098 for the selected steel row.
- `t` is steel thickness in inches.
- `L` is free tongue length in inches.

The model assumes an ideal fixed-free tongue. A real steel tongue drum departs from that ideal because the tongue remains part of a stressed plate/shell, is cut by a finite kerf, may be heat affected, may retain burrs, and is coupled to the vessel body and support system.

## Target Tongue Table

The values below are first-pass estimates from the workbook formula family. Treat every length as a starting cut length with trim allowance, not a final tuned dimension.

| Tongue | MIDI | Note | Target Hz | Derived length in | Derived length mm | Status |
| ---: | ---: | --- | ---: | ---: | ---: | --- |
| Bass | 50 | D3 | 146.83 | 4.16 | 105.6 | derived estimate |
| 1 | 57 | A3 | 220.00 | 3.39 | 86.2 | derived estimate |
| 2 | 58 | A#3/Bb3 | 233.08 | 3.30 | 83.7 | derived estimate |
| 3 | 60 | C4 | 261.63 | 3.11 | 79.0 | derived estimate |
| 4 | 62 | D4 | 293.66 | 2.94 | 74.6 | derived estimate |
| 5 | 64 | E4 | 329.63 | 2.77 | 70.4 | derived estimate |
| 6 | 65 | F4 | 349.23 | 2.69 | 68.4 | derived estimate |
| 7 | 67 | G4 | 392.00 | 2.54 | 64.5 | derived estimate |
| 8 | 69 | A4 | 440.00 | 2.40 | 60.9 | derived estimate |
| 9 | 72 | C5 | 523.25 | 2.20 | 55.9 | derived estimate |
| 10 | 74 | D5 | 587.33 | 2.08 | 52.8 | derived estimate |

## Shell / Helmholtz Estimate

The workbook includes a first-pass vessel estimate using a 12 in diameter, 6 in high partial volume assumption and a 2.5 in port. This is useful for checking whether the shell may reinforce or color the tongue field, but it should not be treated as a final resonator design.

For this packet, the shell resonance is documented as a support variable:

- Verify actual internal volume after forming, welding, or purchased shell selection.
- Measure the port diameter after deburring and finish.
- Compare struck tongue spectra mounted and unmounted.
- Record whether final mounting shifts pitch or sustain.

## Empirical Tuning Workflow

1. Rough-cut the tongues long or conservative, with rounded stress-relief termini.
2. Deburr both sides without thinning the root unpredictably.
3. Strike each tongue with the same mallet and support condition.
4. Log measured Hz and cents error in `validation.csv`.
5. Remove material in controlled passes, favoring tip/length correction first.
6. Re-measure after each tuning pass and after final mounting.
7. Re-check drift after finish cure and 24-72 hours of rest.

## Manufacturing Assumptions

- Steel grade is not locked. Mild low-carbon sheet is the default planning case; stainless is acceptable only after revisiting K, cutting method, corrosion plan, and work hardening behavior.
- Thickness must be measured at the actual blank, not assumed from nominal sheet gauge.
- Laser cutting is fast but risks heat affected zones and local stress changes.
- Waterjet cutting reduces heat risk but can leave taper, abrasive edge texture, and local burrs.
- CNC milling can control slot geometry but needs serious fixturing and coolant/chip planning on thin steel.
- Every inside slot end needs a smooth radius to reduce crack initiation.

## Unresolved Tuning Assumptions

- Actual steel grade, modulus, density, hardness, and residual stress.
- Actual kerf after the chosen cutting process.
- Whether the blank is flat sheet, preformed shell, salvaged vessel, or welded assembly.
- Final support/isolation scheme.
- Mallet hardness and strike point standard.
- Finish mass and corrosion-protection method.
- Whether the bass tongue and high tongues remain balanced in volume and sustain after final trimming.

## Acceptance Criteria

The packet becomes public-review ready only after:

- Each tongue has target Hz, measured Hz, cents error, mallet condition, support condition, and environment logged.
- Rough-cut, deburr, first strike, tuning pass, final mount, and drift check rows are complete.
- At least one process note records actual kerf, burr condition, and heat/warp observations.
- `validation-report.md` is updated from measured data rather than assumptions.

<div class="page-break"></div>

## bom.csv

Starter bill of materials with part categories, quantities, drawing refs, and notes.

| item_id | part_name | qty | unit | required_spec | estimated_cost | cost_basis | critical_to_tuning | notes |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| BOM-001 | Steel shell or formed blank | 1 | each | 12 in diameter by 6 in high steel vessel or equivalent blank; thickness near 0.079 in; low-carbon steel preferred for first prototype | 60 | rough planning estimate; verify before purchase | yes | Actual grade and thickness drive the first-pass K assumption. |
| BOM-002 | Top tongue field blank | 1 | each | Integral shell top or welded steel top compatible with 0.079 in tongue field | 35 | rough planning estimate; verify before purchase | yes | Avoid unknown hardened or heavily stressed salvage until measured. |
| BOM-003 | Rubber isolation feet | 3 | set | Low-profile rubber feet or grommet supports; non-rattling; mechanically isolated from tongues | 8 | rough planning estimate; verify before purchase | yes | Mounting can shift pitch and sustain. |
| BOM-004 | Mallet pair | 1 | pair | Medium-soft rubber or yarn-wrapped mallets; repeatable hardness for validation | 15 | rough planning estimate; verify before purchase | yes | Mallet hardness must be recorded in validation. |
| BOM-005 | Edge trim or rim protection | 1 | length | Non-rattling edge trim compatible with finish and hand contact | 12 | rough planning estimate; verify before purchase | no | Avoid added mass near tongues unless measured after install. |
| BOM-006 | Finish system | 1 | set | Corrosion-resistant finish or oil/wax compatible with struck instrument use | 18 | rough planning estimate; verify before purchase | yes | Finish mass and cure can move pitch. |
| BOM-007 | Abrasives and deburring tools | 1 | set | Files, deburring wheel, abrasive pad, fine abrasive sheets | 20 | rough planning estimate; verify before purchase | yes | Deburr must smooth without uncontrolled thinning. |
| BOM-008 | Tuning measurement tools | 1 | set | Chromatic tuner or spectrum app, microphone, calipers, notebook | 0 | shop-owned or verify before purchase | yes | Required for public-review readiness. |

<div class="page-break"></div>

## sourcing.csv

Supplier/search tracker with specs, price/date fields, lead time, substitutes, and risks.

| item_id | part_name | required_spec | search_terms | candidate_sources | date_checked | unit_price | lead_time | substitution_policy | sourcing_risk |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| SRC-001 | Low-carbon steel shell | 12 in diameter by about 6 in high; thickness close to 0.079 in; weldable low-carbon steel | 12 inch steel hemisphere shell 14 gauge low carbon steel vessel blank | metal supplier, fabrication shop, online metal spinner | not checked | verify before purchase | verify before purchase | Substitute only after recalculating and measuring thickness | Unknown grade or forming stress changes tuning. |
| SRC-002 | Steel sheet/top blank | Flat or formed steel compatible with tongue cutting and shell attachment | 14 gauge mild steel sheet 0.075 0.080 low carbon | local metal supplier, OnlineMetals, McMaster search | not checked | verify before purchase | verify before purchase | Accept nearby gauge only with measured thickness update | Nominal gauge may differ from actual thickness. |
| SRC-003 | Cutting service | Laser, waterjet, or CNC service that can hold slot geometry and document kerf | waterjet steel tongue drum blank laser cutting mild steel 14 gauge | local waterjet shop, laser cutting shop, makerspace metal shop | not checked | quote required | quote required | Prefer waterjet when heat warp is unacceptable | Laser HAZ and waterjet taper both affect pitch. |
| SRC-004 | Rubber isolation feet | Soft non-rattling feet with screws or adhesive backing | rubber bumper feet instrument isolation grommet | hardware store, McMaster, Amazon search | not checked | verify before purchase | verify before purchase | Any equivalent that does not rattle | Mount stiffness affects sustain and pitch. |
| SRC-005 | Mallets | Medium-soft repeatable mallet pair | steel tongue drum mallets rubber yarn medium soft | music supplier, percussion supplier | not checked | verify before purchase | verify before purchase | Substitute only if hardness is logged | Hard mallets emphasize partials and can confuse tuner readings. |
| SRC-006 | Finish | Low-build corrosion protection compatible with hand contact | clear lacquer steel instrument finish paste wax corrosion protection | hardware store, finishing supplier | not checked | verify before purchase | verify before purchase | Avoid thick coatings until measured | Finish adds mass and can damp tongues. |

<div class="page-break"></div>

## cut-list.csv

Rough/final stock sizes, material, grain/orientation, operations, yield, and offcuts.

| cut_id | part_name | qty | material | rough_dimensions_in | final_dimensions_in | operation | datum | kerf_allowance_in | inspection |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| CUT-001 | Shell blank | 1 | low-carbon steel | 12.5 dia x 6.25 high planning envelope | 12.0 dia x 6.0 high target | source/form/trim shell | centerline and rim plane | 0.040 | Confirm roundness, thickness, and no oil-can flex. |
| CUT-002 | Port opening | 1 | same shell | pilot hole plus trim margin | 2.5 dia port | cut/deburr port | shell centerline | 0.040 | Measure actual diameter and edge smoothness. |
| CUT-003 | Bass tongue slot | 1 | 0.079 in steel top | layout from 4.16 in tongue length plus stress radius | derived estimate; tune by measurement | rough-cut slot | top centerline | 0.040 | Leave trim allowance; log first-strike Hz. |
| CUT-004 | Tongue 1 slot | 1 | 0.079 in steel top | layout from 3.39 in tongue length plus stress radius | derived estimate; tune by measurement | rough-cut slot | top centerline | 0.040 | Deburr before first measured strike. |
| CUT-005 | Tongue 2 slot | 1 | 0.079 in steel top | layout from 3.30 in tongue length plus stress radius | derived estimate; tune by measurement | rough-cut slot | top centerline | 0.040 | Check kerf and root radius. |
| CUT-006 | Tongue 3 slot | 1 | 0.079 in steel top | layout from 3.11 in tongue length plus stress radius | derived estimate; tune by measurement | rough-cut slot | top centerline | 0.040 | Check for heat warp before tuning. |
| CUT-007 | Tongue 4 slot | 1 | 0.079 in steel top | layout from 2.94 in tongue length plus stress radius | derived estimate; tune by measurement | rough-cut slot | top centerline | 0.040 | Measure Hz before material removal. |
| CUT-008 | Tongue 5 slot | 1 | 0.079 in steel top | layout from 2.77 in tongue length plus stress radius | derived estimate; tune by measurement | rough-cut slot | top centerline | 0.040 | Tune in small passes. |
| CUT-009 | Tongue 6 slot | 1 | 0.079 in steel top | layout from 2.69 in tongue length plus stress radius | derived estimate; tune by measurement | rough-cut slot | top centerline | 0.040 | Watch for burr mass and damping. |
| CUT-010 | Tongue 7 slot | 1 | 0.079 in steel top | layout from 2.54 in tongue length plus stress radius | derived estimate; tune by measurement | rough-cut slot | top centerline | 0.040 | Check sustain versus adjacent tongues. |
| CUT-011 | Tongue 8 slot | 1 | 0.079 in steel top | layout from 2.40 in tongue length plus stress radius | derived estimate; tune by measurement | rough-cut slot | top centerline | 0.040 | A4 formula sanity row. |
| CUT-012 | Tongue 9 slot | 1 | 0.079 in steel top | layout from 2.20 in tongue length plus stress radius | derived estimate; tune by measurement | rough-cut slot | top centerline | 0.040 | High tongues may be quiet; verify volume. |
| CUT-013 | Tongue 10 slot | 1 | 0.079 in steel top | layout from 2.08 in tongue length plus stress radius | derived estimate; tune by measurement | rough-cut slot | top centerline | 0.040 | Avoid over-thinning short tongue roots. |
| CUT-014 | Fixture ring or cradle | 1 | MDF plywood or printed fixture | 14 x 14 x 0.75 planning blank | cradle fits shell without rocking | cut jig | rim plane | 0.000 | Must hold shell without damping tongue field. |

<div class="page-break"></div>

## drawing-brief.md

Manufacturing drawing and technical product sketch brief.

# Drawing Brief

## Required Drawing Set

1. Top layout with all tongue slots, centerline, port, rim, and orientation mark.
2. Section view through shell showing top thickness, shell height, port, support feet, and rim/edge treatment.
3. Detail view of a tongue root with slot-end radius, kerf, burr limit, and stress-relief note.
4. Fixture view showing temporary tuning support and final isolation feet.
5. Process coupon drawing for kerf and HAZ validation.

## Critical Dimensions

- 12.0 in body diameter assumption.
- 6.0 in shell height assumption.
- 0.079 in steel thickness assumption.
- 0.040 in kerf assumption.
- 1.0 in tongue width assumption.
- 2.5 in port diameter assumption.
- Tongue lengths from `design.md` are derived estimates and must be marked "rough-cut; tune by measurement."

## Drawing Rules

- Units: inches with metric equivalents where useful.
- Include title block, revision, date, material, finish, and "not final tuned dimensions" note.
- Show datum A as top center, datum B as rim plane, datum C as orientation line.
- Call out all inside slot ends as smooth radiused transitions.
- Do not publish as final manufacturing drawing until validation data exists.

<div class="page-break"></div>

## assembly-manual.md

Shop-facing sequence, tools, fixtures, safety, tuning, finishing, and maintenance notes.

# Assembly Manual

## Safety

Steel cutting, deburring, and tuning can create sharp edges, hot work, abrasive dust, and springy tongues. Wear eye protection, gloves when handling raw cuts, and hearing protection during cutting or repeated striking. Do not strike an unfinished blank with sharp burrs in a way that can throw chips.

## Tools

- Calipers and steel rule.
- Layout template or CAD print.
- Cutting process: waterjet, laser, CNC mill, or carefully controlled manual process.
- Deburring tools, small files, abrasive pads, and inspection light.
- Tuner or spectrum analyzer with repeatable microphone placement.
- Medium-soft mallets reserved for validation.
- Temporary support cradle and final isolation feet.

## Build Sequence

1. Confirm the actual steel grade, thickness, shell diameter, shell height, and port diameter.
2. Update the workbook or `design.md` assumptions if measured thickness differs from 0.079 in.
3. Mark the top centerline, tongue layout, port, and any logo or orientation mark.
4. Cut the port first if it helps workholding; deburr and record actual diameter.
5. Rough-cut tongue slots using rounded slot ends and the documented kerf.
6. Inspect for heat discoloration, slot taper, burrs, and oil-can distortion.
7. Deburr both sides, preserving root radius and avoiding uncontrolled thinning.
8. Place the drum on a temporary isolation support and record first-strike measurements.
9. Tune iteratively, one tongue at a time, recording measured Hz and cents error.
10. Install final feet, edge trim, and finish only after pre-finish tuning is documented.
11. Re-check pitch after final mounting, after finish cure, and after a 24-72 hour drift rest.

## Tuning Notes

For this first prototype, do not chase a perfect tuner reading from one strike. Use the same mallet, strike point, support, and microphone distance. Record at least three stable readings per tongue where possible.

If a tongue is sharp after rough cutting, lower pitch by increasing effective length or removing material in a way that reduces stiffness. If a tongue is flat, options are limited; shorten the effective tongue or accept a revised target. This is why rough-cut length should stay conservative.

## Photo Checkpoints

- Raw shell and thickness measurement.
- Layout before cutting.
- Slot kerf sample coupon.
- Rough-cut top before deburr.
- Deburred tongue roots.
- First-strike measurement setup.
- Tuning pass with tool marks visible.
- Final mount and underside/support detail.

<div class="page-break"></div>

## validation.csv

Target/measured values, tolerance, environment, result, and tuning/build action log.

| check_id | phase | tongue_or_feature | target_note | target_hz | measured_hz | cents_error | tolerance | environment | support_condition | mallet | process_state | result | action_notes |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| VAL-001 | formula sanity | A4 | A4 | 440.00 |  |  | 0 cents | shop temp logged at test | free support and final mount | validation mallet | pre-build | open | Confirm target formula returns A4 = 440 Hz. |
| VAL-002 | rough-cut | bass | D3 | 146.83 |  |  | record only | log temp/humidity | rough support | medium-soft | after slot cutting | open | Measure before deburr if safe; note cutter, kerf, HAZ, and warp. |
| VAL-003 | rough-cut | tongue 1 | A3 | 220.00 |  |  | record only | log temp/humidity | rough support | medium-soft | after slot cutting | open | Do not tune until burrs are controlled. |
| VAL-004 | deburr | all tongues | n/a |  |  |  | no sharp burrs; no uncontrolled thinning | shop | rough support | n/a | after deburr | open | Inspect both sides and root radius; photograph burr condition. |
| VAL-005 | first strike | bass | D3 | 146.83 |  |  | plus/minus 50 cents initial | log temp/humidity | consistent temporary isolation | medium-soft | deburr complete | open | Record first stable tuner reading and spectrum if available. |
| VAL-006 | first strike | tongue 1 | A3 | 220.00 |  |  | plus/minus 50 cents initial | log temp/humidity | consistent temporary isolation | medium-soft | deburr complete | open | Repeat for every tongue before material removal. |
| VAL-007 | tuning pass | all tongues | scale targets |  |  |  | final target plus/minus 10 cents before mount | log temp/humidity | consistent temporary isolation | medium-soft | incremental trim | open | Log every trim pass and whether pitch rose or fell. |
| VAL-008 | final mount | all tongues | scale targets |  |  |  | plus/minus 10 cents after mount | log temp/humidity | final feet/cradle | medium-soft | mounted | open | Compare mounted readings to temporary support readings. |
| VAL-009 | finish check | all tongues | scale targets |  |  |  | plus/minus 10 cents after finish cure | log temp/humidity | final feet/cradle | medium-soft | finish cured | open | Check damping and pitch shift after finish. |
| VAL-010 | drift check | all tongues | scale targets |  |  |  | plus/minus 10 cents after 24-72 h rest | log temp/humidity | final feet/cradle | medium-soft | rested | open | Public-review gate: update validation-report.md from measured data. |
| VAL-011 | structural check | slot roots | n/a |  |  |  | no visible cracks after tuning | shop | final support | n/a | post tuning | open | Inspect root radii under bright light. |
| VAL-012 | ergonomic check | playing surface | n/a |  |  |  | comfortable reach; no sharp edges | shop | final support | medium-soft | post assembly | open | Confirm player can strike all tongues without contacting sharp rim. |

<div class="page-break"></div>

## supplier-rfq.md

Supplier email/request-for-quote starter.

# Supplier RFQ Draft

Subject: RFQ - steel tongue drum blank / cutting service

Hello,

I am preparing a prototype steel tongue drum and need either a steel shell/blank, cutting service, or both. The project is a struck musical instrument, so material consistency, low warp, clean edges, and documented kerf matter more than cosmetic speed.

## Requested Quote

- Quantity: 1 prototype, with option for 2-3 follow-up blanks.
- Material: low-carbon mild steel preferred for the first prototype.
- Thickness target: near 0.079 in; please quote actual available thickness and tolerance.
- Body target: 12 in diameter, 6 in high shell/vessel or compatible top/shell blank.
- Cutting: tongue slots and 2.5 in port from supplied DXF/SVG when finalized.
- Edge condition: quote as-cut condition, deburring options, and expected kerf/taper.
- Process options: waterjet, fiber laser, CO2 laser, CNC mill, or recommended alternative.

## Please Include

- Material grade and data sheet.
- Actual thickness tolerance.
- Cutting kerf estimate.
- Heat affected zone or warp expectations.
- Deburring/edge-finishing options.
- Unit price and lead time.
- Whether nested test coupons can be included for kerf and tuning trials.

Substitutions are acceptable only if the grade, thickness, cutting process, and expected edge condition are clearly identified.

<div class="page-break"></div>

## visual-bom-brief.md

Art direction for an image-forward visual BOM.

# Visual BOM Brief

## Goal

Create a one-page visual BOM that lets a fabricator or reviewer understand the steel tongue drum parts without reading every CSV.

## Layout

- Header: Steel Tongue Drum, STD-001, quote date, estimated total.
- Main image: top layout drawing from `drawings/steel-tongue-drum-layout.svg`.
- Row images: shell blank, tongue field, port, rubber feet, mallets, finish, deburring tools.
- Columns: item id, part, visual, quantity, required spec, cost basis, tuning risk.

## Required Labels

- "Derived estimate" for any tongue geometry.
- "Verify before purchase" for price and supplier information.
- "Measured data required" near tuning-critical parts.

## Shot Priority

Until real photos exist, use clean line drawings and explicit placeholders. Do not use atmospheric concept images as proof of manufactured geometry.

<div class="page-break"></div>

## steel-tongue-drum-starter.wl

Wolfram starter for physics, optimization, visualization, and validation.

```wolfram
(* Steel Tongue Drum Wolfram starter *)

ClearAll["Global`*"];

(* Inputs from steel-tongue-drum-design-table.xlsx *)
bodyDiameterIn = 12.0;
shellHeightIn = 6.0;
steelThicknessIn = 0.079;
kerfIn = 0.040;
tongueWidthIn = 1.0;
portDiameterIn = 2.5;
a4Hz = 440.0;
kSteel = 32098.0;

targetMidis = <|
  "Bass" -> 50,
  "T1" -> 57,
  "T2" -> 58,
  "T3" -> 60,
  "T4" -> 62,
  "T5" -> 64,
  "T6" -> 65,
  "T7" -> 67,
  "T8" -> 69,
  "T9" -> 72,
  "T10" -> 74
|>;

midiToHz[m_] := a4Hz*2^((m - 69)/12);
tongueLengthIn[f_] := Sqrt[kSteel*steelThicknessIn/f];
centsError[measured_, target_] := 1200*Log2[measured/target];

targetTable = KeyValueMap[
  {#1, #2, midiToHz[#2], tongueLengthIn[midiToHz[#2]], 25.4*tongueLengthIn[midiToHz[#2]]} &,
  targetMidis
];

Grid[
  Prepend[targetTable, {"Tongue", "MIDI", "Target Hz", "Length in", "Length mm"}],
  Frame -> All
]

(* Validation example: replace with measured data from validation.csv. *)
measuredExampleHz = <|"T8" -> 440.0|>;
KeyValueMap[{#1, centsError[#2, midiToHz[targetMidis[#1]]]} &, measuredExampleHz]

(* Simple sensitivity plot: pitch versus tongue length for the selected steel thickness. *)
Plot[kSteel*steelThicknessIn/l^2, {l, 2.0, 4.5},
  AxesLabel -> {"Tongue length (in)", "Frequency (Hz)"},
  PlotLabel -> "First-pass cantilever estimate only"
]
```

<div class="page-break"></div>

## README.md

Project artifact.

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

<div class="page-break"></div>

## family-spec.csv

Project artifact.

| family_id | member_id | instrument_name | variant | key_or_scale | body_diameter_in | shell_height_in | steel_thickness_in | tongue_count | port_diameter_in | design_stage | validation_state | notes |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| STD-FAM-001 | STD-001 | Steel Tongue Drum | 12 inch root prototype | D-centered mixed pentatonic/diatonic study | 12.0 | 6.0 | 0.079 | 11 | 2.5 | root-mode packet | no measured prototype data | Derived from steel-tongue-drum-design-table.xlsx; final tuning empirical. |

<div class="page-break"></div>

## jig-decision.md

Project artifact.

# Jig Decision

## Decision

Use a two-stage jig approach:

1. A non-marring temporary tuning cradle that supports the shell consistently while leaving the tongue field free.
2. A final isolation-foot layout that is re-measured after installation.

## Why

The support condition is part of the instrument. A rigid clamp, bench pad, hand hold, rubber foot, and display stand can all change damping and perceived pitch. Separating the temporary tuning cradle from the final mount makes that shift visible in `validation.csv`.

## Requirements

- Cradle must locate the shell repeatably without contacting vibrating tongues.
- Contact points should be soft enough to prevent rattles but stable enough for repeatable measurements.
- Fixture should expose the port and underside for inspection.
- Final feet must be installed before the final-mount validation phase.

## Rejected Options

- Freehand holding during tuning: too variable.
- Clamping the shell rigidly to a bench: likely to damp shell modes.
- Tuning only after final finish: hides process causes and makes correction harder.

<div class="page-break"></div>

## photo-shotlist.md

Project artifact.

# Photo Shotlist

- Raw steel shell or blank with label/spec visible.
- Caliper reading of actual steel thickness.
- Layout on top surface before cutting.
- Kerf coupon or test cut close-up.
- Rough-cut slots before deburring.
- Deburred slot root close-up with light showing radius.
- Temporary tuning support setup.
- Tuner/microphone placement during first strike.
- Tuning pass in progress with tool and tongue identified.
- Final feet or isolation mount underside.
- Finished top view with all tongues visible.
- Detail of port, rim, and edge trim.

<div class="page-break"></div>

## resources.md

Project artifact.

# Resources

## Local Packet Sources

- `steel-tongue-drum-design-table.xlsx` - workbook source for dimensions, K constants, target notes, and formulas.
- `design.md` - narrative design basis and assumptions.
- `validation.csv` - required measurement log.
- `drawings/steel-tongue-drum-layout.svg` - starter layout drawing.

## Instrument Maker References

- `instrument-maker-v4/references/new-instruments-v4.md` - steel tongue drum entry.
- `instrument-maker-v4/references/acoustic-models.md` - cantilever beam formulas and guard rules.
- `instrument-maker-v4/references/manufacturing-and-cnc.md` - machining and fixture guidance.
- `instrument-maker-v4/references/sourcing-and-production.md` - sourcing, RFQ, cut list, validation guidance.

## Sister Repos

- `tongue-drum` - wooden slit tongue drum done-bar reference and DoE pattern.
- `glockenspiel` - metal bar idiophone sibling concept.
- `handpan` - steel shell idiophone sibling, but different governing model.

## Measurement Tools To Use

- Chromatic tuner or spectral analysis app.
- Calipers for thickness, kerf, port, and slot checks.
- Consistent microphone placement.
- Temperature/humidity record for each tuning session.

<div class="page-break"></div>

## risks.md

Project artifact.

# Risks

## Acoustic

| Risk | Why it matters | Verification test |
| --- | --- | --- |
| Cantilever model over-promises accuracy | Real tongues are cut from a coupled steel shell, not ideal beams | First-strike each tongue and log cents error before tuning |
| Mallet hardness changes apparent pitch and partial balance | Hard mallets excite noisy partials and can confuse readings | Record mallet type; compare soft vs medium mallet on two tongues |
| Support condition shifts sustain and pitch | Feet/cradle can damp the shell or tongue roots | Measure before and after final mount |

## Structural

| Risk | Why it matters | Verification test |
| --- | --- | --- |
| Slot roots crack | Sharp inside corners concentrate stress | Inspect radiused roots after tuning and after drift check |
| Heat warp from cutting | Warped top changes stiffness and strike height | Photograph and straightedge-check before deburr |
| Over-tuning weakens short tongues | Removing too much material can make tongues unstable | Log every material-removal pass and stop if sustain collapses |

## Ergonomic

| Risk | Why it matters | Verification test |
| --- | --- | --- |
| Edge remains sharp | Player contact with rim and port is likely | Glove-off touch test only after full deburr |
| Tongue spacing is cramped | Adjacent tongues may be struck accidentally | Play-test simple scale pattern with final mallets |

## Supply

| Risk | Why it matters | Verification test |
| --- | --- | --- |
| Unknown steel grade | K and tuning response vary by material | Record grade/data sheet or mark as unknown in validation |
| Nominal sheet gauge differs from actual | Thickness enters the formula linearly | Caliper thickness at multiple points |

## Fit / Finish

| Risk | Why it matters | Verification test |
| --- | --- | --- |
| Finish adds damping or mass | Pitch and sustain can drift after coating | Measure before finish, after cure, and after drift rest |
| Feet or trim rattle | Rattles mask tuning and reduce quality | Strike every tongue at playing volume after final assembly |

<div class="page-break"></div>

## validation-report.md

Project artifact.

# Validation Report

## Current Status

No measured prototype data is present yet. The packet is documentation-complete enough to guide a prototype, but it is not public-review ready as a tuned instrument.

## What Has Been Validated

- A4 reference and equal-temperament target method are documented.
- Workbook assumptions have been surfaced in `design.md`.
- The required validation workflow exists in `validation.csv`.
- Manufacturing risks for laser, waterjet, CNC, deburring, support, finish, and drift are documented.

## What Remains Open

- Actual steel grade and thickness.
- Actual cutting kerf and edge condition.
- First-strike Hz for every tongue.
- Cents error before and after tuning.
- Pitch shift after final mounting.
- Pitch drift after finish cure and rest.

## Readiness Call

Private-prototype ready: yes.

Public-review ready: no. Keep the repo private or clearly marked as unvalidated until measured rough-cut, deburr, first-strike, tuning-pass, final-mount, and drift-check data exists.
