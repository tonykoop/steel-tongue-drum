# MCP Session Log

Status: `no tool session run`.

This V5 provenance stub is intentionally empty of CAD or creative-tool output.
The Round 2 recovery lane had no MCP, OpenSCAD, Blender, Illustrator,
Photoshop, Fusion, SolidWorks, Wolfram execution, or physical measurement
session available. No CAD geometry, DXF coordinates, tuning frequencies, or
measured dimensions were generated in this lane.

| session_id | tool | input_authority | outputs | role | authority_result | review_status | notes |
| --- | --- | --- | --- | --- | --- | --- | --- |
| NO-MCP-2026-05-29-R2 | none | `visual-output-register.csv`; `cnc/coupon-first-cam-cad-gate.md`; `data/coupon-cam-cad-log.csv` | none | provenance_stub | concept_only | self_checked | Records absence of tool execution; all geometry and tuning authority remains pending measurement. |
| fable-v5-refresh-2026-07-01 | claude-code (Fable 5) + OpenSCAD CLI | steel-tongue-drum-design-table.xlsx, design.md, family-spec.csv | cad/steel-tongue-drum.scad | cad_authoring | pending_measurement | self_checked | Parametric build-envelope + tongue-cut LAYOUT master (equation-driven L=sqrt(32098*t/f)). openscad render check: pass (openscad -o STL, exit 0, Simple: yes). NOT fabrication authority — kerf/slot-radii/HAZ/tuned-trim out of scope pending coupon gate. |
| fable-v5-refresh-2026-07-01 | claude-code (Fable 5) | steel-tongue-drum-design-table.xlsx | wolfram/steel-tongue-drum-wolfram-model.wl | analysis_source | derived_preview | unreviewed | Register row added for the epic197-deployed Wolfram model source; not executed — source-only L2 evidence. |

## Promotion Rule

If a future lane uses OpenSCAD, Blender, Illustrator, Photoshop, Fusion,
SolidWorks, Wolfram, or another external tool to create or modify packet
artifacts, add a real session row before describing any output as reviewed,
derived, or fabrication authority.
