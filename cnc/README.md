# CNC / Cutting Plan

## Preferred Prototype Path

Use a test coupon before cutting the real top. The coupon should measure actual kerf, edge taper, heat affected zone, burr behavior, and whether the deburring method changes pitch on a simple tongue.

## Process Comparison

| Process | Strength | Risk | Required validation |
| --- | --- | --- | --- |
| Waterjet | Low heat input | Edge taper, abrasive texture, burr | Measure slot width top/bottom and deburr response |
| Fiber laser | Fast, accurate | HAZ, stress, warp, hard edge | Photograph discoloration and first-strike drift |
| CNC mill | Controlled geometry | Fixturing thin steel, chatter, burrs | Prove hold-down and slot finish on coupon |
| Manual abrasive | Accessible | Low repeatability | Use only for tuning corrections, not full layout |

## CAM Notes

- Use rounded slot termini.
- Avoid sharp internal corners.
- Keep a consistent datum/orientation mark.
- Include the validation coupon in the first setup.
- Document actual kerf and any compensation used.
