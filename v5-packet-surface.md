# V5 Packet Surface - Steel Tongue Drum

Status: `L2 V5 build-packet candidate; pending measurement`.

Issue: Refs #5.

This file defines the honest V5 surface for the steel tongue drum packet. It is
a structure and authority map only. It does not add CAD geometry, DXF
coordinates, CAM setup values, measured partials, or tuning frequencies.

## Authority Summary

| Surface | Current authority | Why it is not L3 |
| --- | --- | --- |
| Workbook and family spec | `pending_measurement` | Values are workbook assumptions and first-pass planning inputs; real steel thickness, kerf, stress, and tuning response are not measured. |
| Starter SVG | `concept_only` | It is a human preview, not a DXF, CAD source, or CAM input. |
| Coupon log | `pending_measurement` | `STD-COUPON-001` is `not_run`; no material, kerf, taper, burr, HAZ, warp, or strike evidence exists. |
| Validation CSV | `pending_measurement` | It is a measurement template with open rows, not a measured performance record. |
| MCP/CAD provenance | `concept_only` | `cad/mcp-session-log.md` records that no external tool session was run in this lane. |

## Coupon-First Protocol

Before promoting any CAD, DXF, CAM, or G-code claim:

1. Select the actual material blank and record supplier/spec information or
   explicitly mark the grade unknown.
2. Measure real thickness at multiple points and record the instrument state
   used for measurement.
3. Cut a representative coupon with the same process intended for the drum.
4. Measure kerf at multiple points and record top/bottom taper or edge angle
   if visible.
5. Record burr, heat affected zone, discoloration, warp, and slot-root
   condition.
6. Strike the coupon before and after deburring only if the coupon geometry is
   safely strikeable.
7. Enter the compensation decision in `data/coupon-cam-cad-log.csv`.
8. Update `validation-report.md` before any artifact changes from
   `pending_measurement` to fabrication authority.

## V5 Gate Table

| Gate | Required evidence | Current state |
| --- | --- | --- |
| G1 material evidence | Actual blank source and measured thickness | Pending |
| G2 coupon cut | Coupon made with intended process | Pending |
| G3 kerf/taper evidence | Measured kerf and edge notes | Pending |
| G4 burr/HAZ/warp evidence | Inspection notes or photos | Pending |
| G5 coupon strike evidence | Pre/post deburr Hz if safely strikeable | Pending |
| G6 CAM compensation decision | Keep/change kerf, slot radius, or process | Blocked by G1-G5 |
| G7 full tongue-field release | Reviewed coupon result and updated register | Blocked by G6 |
| G8 tuned-instrument claim | Full `validation.csv` first-strike, trim, mount, finish, and drift data | Blocked by physical build |

## What Is Needed Next

- Run the physical coupon protocol and populate `data/coupon-cam-cad-log.csv`.
- Add real evidence paths for photos, measurement sheets, or shop notes.
- Update `visual-output-register.csv` only after measurement evidence exists.
- Replace or regenerate CAD/DXF artifacts from reviewed authority before any
  build-ready claim.
- Keep the packet at L2 until the measurement and CAD authority chain is
  complete.
