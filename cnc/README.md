# CNC / Cutting Plan

## Preferred Prototype Path

Do not start with the full tongue field. Start with a coupon that uses the same material, process, and nominal kerf as the intended build. The coupon's job is to reveal real kerf, edge taper, burr behavior, and whether the chosen process pushes the first strike noticeably sharp or flat before the actual drum is cut.

Issue #5 gate file: `coupon-first-cam-cad-gate.md`.
Coupon evidence log: `../data/coupon-cam-cad-log.csv`.

## Process Comparison

| Process | Strength | Risk | Required validation |
| --- | --- | --- | --- |
| Waterjet | Low heat input | Edge taper, abrasive texture, burr | Measure slot width top and bottom, log burr cleanup, compare first strike before and after deburr |
| Fiber laser | Fast, accurate | HAZ, stress, warp, hard edge | Photograph discoloration, check flatness, and compare coupon pitch before and after stress relief |
| CNC mill | Controlled geometry | Fixturing thin steel, chatter, burrs | Prove hold-down, coolant/chip control, and slot finish on coupon before real cutting |
| Manual abrasive | Accessible | Low repeatability | Use only for tuning corrections, not full layout |

## Coupon-First Validation Path

1. Cut a simple coupon with one representative tongue, one slot-end radius, and one kerf sample.
2. Measure actual kerf at multiple points and record top/bottom taper if present.
3. Deburr in the intended shop sequence and note whether measured pitch changes.
4. Inspect the slot root for cracks, gouges, or over-thinning.
5. Only then cut the real top or shell tongue field.

## Manufacturing Release Gates

- The first setup must include a coupon or sacrificial strip.
- Every slot end must be radiused; no sharp internal corners.
- The layout must keep a stable orientation mark and datum so the tuning log matches the physical instrument.
- Actual kerf and any CAM compensation must be written into `validation.csv` or `data/measurement-capture-plan.md`.
- The coupon result and CAM compensation decision must be written into `data/coupon-cam-cad-log.csv`.
- No file in this folder should be described as build-ready G-code until coupon evidence and first-strike measurements exist.

## CAM Notes

- Use rounded slot termini.
- Avoid sharp internal corners.
- Keep a consistent datum/orientation mark.
- Include the validation coupon in the first setup.
- Document actual kerf and any compensation used.
