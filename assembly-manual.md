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
