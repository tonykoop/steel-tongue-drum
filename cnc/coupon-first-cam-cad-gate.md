# Coupon-First CAM/CAD Authority Gate

Current status: `blocked-no-coupon-evidence`.

This gate separates validator-clean documentation from machine-ready authority.
The workbook, family spec, starter SVG, and packet docs can guide a first
prototype review, but they do not authorize final CAD, DXF, CAM compensation,
or G-code until coupon evidence is captured from the real material and process.

## Current Authority Boundary

| Artifact | Current role | Machine-ready status |
| --- | --- | --- |
| `steel-tongue-drum-design-table.xlsx` | Planning design table | Not final tuned geometry |
| `family-spec.csv` | Family/member assumptions | Not measured material authority |
| `drawings/steel-tongue-drum-layout.svg` | Derived preview | Not DXF, CAM, or cut authority |
| `cad/README.md` | CAD intent brief | No reviewed CAD source present |
| `cnc/README.md` | Coupon-first process brief | No released CAM setup present |
| `data/coupon-cam-cad-log.csv` | Evidence capture template | No coupon result logged yet |

## Required Coupon Evidence

Before any file is described as final CAD/CAM, record:

- actual material grade or best-available supplier description;
- actual thickness measurements from the real blank;
- cutting process, machine, nozzle/tool, speed/feed/power notes where known;
- measured kerf at multiple coupon locations;
- top/bottom taper or edge angle notes;
- burr, heat affected zone, discoloration, warp, and slot-root condition;
- pre-deburr and post-deburr strike Hz if the coupon geometry supports a strike;
- compensation decision: keep workbook kerf, change kerf, change slot radius, or change process.

## Promotion Rules

- `STD-001_ValidationCoupon.DXF` may be promoted from planned to coupon-ready
  after it includes datum, material, thickness, nominal kerf, root radius, and
  "coupon only; not full drum CAM" notes.
- `STD-001_TongueField.DXF` remains blocked until coupon measurements are
  logged and the kerf/slot-radius decision is updated.
- Any CAM setup remains blocked until the coupon row records process evidence
  and the validation report explains whether the process is acceptable.
- Public build-ready or L3 language remains blocked until measured first-strike,
  tuning-pass, mount, finish, and drift evidence exists for the full instrument.

## Issue 5 Status

For issue #5, this repo now has an explicit coupon-first CAM/CAD gate and a
log template, but the gate remains blocked because no physical coupon evidence
is present in the repository.
