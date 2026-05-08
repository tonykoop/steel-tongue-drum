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
