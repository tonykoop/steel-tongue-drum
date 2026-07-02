// steel-tongue-drum.scad — parametric build-envelope + tongue-cut LAYOUT master
// ===========================================================================
// UNITS: inches (design table native). OpenSCAD units are generic.
//
// SOURCE OF TRUTH:
//   steel-tongue-drum-design-table.xlsx, design.md (Governing Model + Target
//   Tongue Table), family-spec.csv (STD-001: 12 in OD, 6 in H, 0.079 in steel,
//   11 tongues, 1 in tongue width, 2.5 in port).
//   Tongue free lengths are EQUATION-DRIVEN from target frequency:
//     L = sqrt(K_steel * t / f),  K_steel = 32098 (imperial), t = 0.079 in.
//
// AUTHORITY: pending_measurement. This is a build-ENVELOPE + tongue-cut-LAYOUT
//   master only. The tuning-sensitive geometry — actual kerf, slot-end
//   stress-relief radii, heat-affected zone, and the final tuned trim length of
//   every tongue — is HAND-REFINED from measured coupon + strike data and is
//   OUT OF SCOPE here (design.md Empirical Tuning Workflow; cnc coupon gate).
//   Do NOT export a tongue-field DXF/CAM cut file from this master until the
//   coupon gate (data/coupon-cam-cad-log.csv) and validation.csv are measured.
// ===========================================================================

// ---- Shell / vessel envelope (family-spec.csv STD-001) --------------------
body_diameter_in  = 12.0;   // body_diameter_in
shell_height_in   = 6.0;    // shell_height_in
steel_thickness_in= 0.079;  // steel_thickness_in (verify with calipers)
port_diameter_in  = 2.5;    // port_diameter_in
top_plate_in      = steel_thickness_in;

// ---- Tongue field (design.md Governing Model + Target Tongue Table) --------
K_steel           = 32098;  // workbook steel constant (imperial), first-pass
tongue_width_in   = 1.0;    // tongue_width, design table
tongue_root_inset = 0.6;    // radial inset of tongue root from rim (layout)
slot_kerf_in      = 0.040;  // kerf (process-dependent; coupon-verify)

// Tongue schedule: [label, target_Hz]  (design.md Target Tongue Table)
tongues = [
  ["D3",  146.83],  // bass
  ["A3",  220.00],
  ["Bb3", 233.08],
  ["C4",  261.63],
  ["D4",  293.66],
  ["E4",  329.63],
  ["F4",  349.23],
  ["G4",  392.00],
  ["A4",  440.00],
  ["C5",  523.25],
  ["D5",  587.33],
];
n_tongues = len(tongues);

// Equation-driven free tongue length (in) from target frequency (design.md).
function tongue_len_in(f) = sqrt(K_steel * steel_thickness_in / f);

$fn = 160;

// ---- Modules --------------------------------------------------------------
module shell() {
    R = body_diameter_in/2;
    // Closed-bottom cylindrical vessel with a side port.
    difference() {
        cylinder(h = shell_height_in, r = R);
        translate([0,0,top_plate_in])
            cylinder(h = shell_height_in, r = R - steel_thickness_in);
        // side sound port
        translate([0, -R-1, shell_height_in*0.35])
            rotate([-90,0,0]) cylinder(h = 2, r = port_diameter_in/2);
    }
}

module top_plate() {
    R = body_diameter_in/2;
    translate([0,0,shell_height_in - top_plate_in])
        cylinder(h = top_plate_in, r = R);
}

// One radial tongue-cut LAYOUT slot (U-outline), root near rim, tip inward.
// Length is equation-driven; this is layout, not a tuned cut.
module tongue_slot(f, angle_deg) {
    R = body_diameter_in/2;
    L = tongue_len_in(f);
    w = tongue_width_in;
    rotate([0,0,angle_deg])
        translate([0,0, shell_height_in - top_plate_in - 0.01])
            // U-shaped kerf around a radial tongue; open end at the root (rim side)
            difference() {
                // outer kerf footprint
                translate([R - tongue_root_inset - L - slot_kerf_in, -w/2 - slot_kerf_in, 0])
                    cube([L + slot_kerf_in, w + 2*slot_kerf_in, top_plate_in + 0.02]);
                // tongue body left uncut (attached at root, rim side)
                translate([R - tongue_root_inset - L, -w/2, -0.01])
                    cube([L + 0.02, w, top_plate_in + 0.04]);
            }
}

module tongue_field() {
    for (i = [0 : n_tongues-1])
        tongue_slot(tongues[i][1], i * 360/n_tongues);
}

// ---- Top-level assembly ---------------------------------------------------
module steel_tongue_drum() {
    shell();
    difference() {
        top_plate();
        tongue_field();   // cut the tongue-window LAYOUT into the top plate
    }
}

steel_tongue_drum();
