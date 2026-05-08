# CAD Starter

CAD should be driven from the workbook and `family-spec.csv`, but final tuned slot geometry must come from measured prototype correction.

## Suggested Files

- `STD-001_MasterLayout.SLDPRT` - master sketch with shell, port, tongues, root radii, and datum axes.
- `STD-001_TongueField.DXF` - waterjet/laser/CNC export after kerf compensation.
- `STD-001_ValidationCoupon.DXF` - kerf and HAZ test coupon.

## Global Variables

- `BodyDiameter = 12 in`
- `ShellHeight = 6 in`
- `SteelThickness = measured actual`
- `KerfWidth = measured process value`
- `TongueWidth = 1 in`
- `PortDiameter = 2.5 in`

Do not lock CAD dimensions as final tuned values until `validation.csv` has measured data.
