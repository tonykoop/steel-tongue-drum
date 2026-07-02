# Design Intent — steel-tongue-drum rev A

- Master CAD: `cad/steel-tongue-drum.scad` (sha256: 0e1638eccd13ec92ad5bc1255719e85c75dedc66023e533947869e00f35b9f05), driven by `steel-tongue-drum-design-table.xlsx` (sha256: e1663ea1faadcabe5026d6eda636c8874fcc8eba346b22df14e118949e094d0b).
- Function: Tuned steel tongue drum (idiophone). A 12 in OD × 6 in vessel with a 0.079 in steel top plate carrying 11 radial cantilever tongues (bass D3 plus a D-centered mixed pentatonic/diatonic field to D5), struck with mallets/hands; a 2.5 in port colors the coupled shell resonance. Each tongue's pitch follows the fixed-free cantilever model f = K·t/L² (design.md Governing Model); final pitch is set empirically by trimming length. See design.md.
- Environment: indoor idiophone. Tongues are stressed plate cantilevers taking repeated strike impact; steel grade/heat treatment and cut process (laser HAZ vs waterjet taper) move pitch and crack risk.
- Target qty: 1 (root prototype). Deadline: TBD. Budget/unit ceiling: TBD.

## Critical dimensions (carry tolerances)

| Feature | Nominal | Tolerance | Why critical | Source |
| --- | --- | --- | --- | --- |
| Steel thickness t | 0.079 in | verify w/ calipers on actual blank | sets every tongue pitch (f∝t) | design.md Workbook Inputs / family-spec.csv |
| Tongue free lengths | D3 4.16 in .. D5 2.08 in | rough-cut long, tune by trim | tongue pitch (L=sqrt(K·t/f)) | design.md Target Tongue Table |
| Kerf width | 0.040 in | measured process value (coupon) | tongue width margin, tuning | design.md / cad/README.md |
| Tongue width | 1.0 in | layout | radiation/sustain balance | design table |
| Shell OD / height | 12.0 / 6.0 in | after forming/selection | coupled shell resonance | family-spec.csv |
| Port diameter | 2.5 in | after deburr/finish | Helmholtz coloration | design.md Shell/Helmholtz |

## Incidental (free for DFM)

- Exact tongue angular clocking (even fan preserved), shell wall finish, port trim styling, mounting/isolation hardware, foot/stand interface.

## Must-nots (DFM may never violate)

- Every inside slot end MUST get a smooth stress-relief radius — square slot ends initiate cracks (design.md Manufacturing Assumptions).
- Do NOT lock CAD tongue lengths as final tuned values; rough-cut long and trim to measured pitch (design.md / cad/README.md).
- Do NOT mark any tongue-field DXF/CAM export build-ready until the coupon gate (data/coupon-cam-cad-log.csv) logs measured kerf, edge condition, and HAZ (cad/README.md).
- Do NOT switch steel grade (mild → stainless) without revisiting K, cutting method, corrosion plan, and work-hardening (design.md).

## Material intent

- Preferred: mild low-carbon steel top plate/shell (default planning case). Stainless acceptable only after re-deriving K and cut process.
- Acceptable subs: per sourcing.csv (spec-first; live prices unverified).
- Forbidden: assuming nominal sheet gauge instead of measured thickness; square (un-radiused) slot terminations.

## Stage status

Stage 0 intake complete 2026-07-01. Gate A (Alpha shop compile) NOT yet run — no concessions logged, nothing presented as shippable. All tongue lengths remain first-pass estimates (no measured prototype data).
