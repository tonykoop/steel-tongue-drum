(* Steel Tongue Drum Wolfram starter *)

(* Wolfram QA 2026-05-30: estimate - pending measurement, not fabrication authority.
   Variables and associations with Estimate suffix are planning values only unless
   later replaced by measured validation data or reviewed design-table authority. *)

ClearAll["Global`*"];

(* Inputs from steel-tongue-drum-design-table.xlsx *)
bodyDiameterInEstimate = 12.0;
shellHeightInEstimate = 6.0;
steelThicknessInEstimate = 0.079;
kerfInEstimate = 0.040;
tongueWidthInEstimate = 1.0;
portDiameterInEstimate = 2.5;
a4Hz = 440.0;
kSteelEstimate = 32098.0;

targetMidisEstimate = <|
  "Bass" -> 50,
  "T1" -> 57,
  "T2" -> 58,
  "T3" -> 60,
  "T4" -> 62,
  "T5" -> 64,
  "T6" -> 65,
  "T7" -> 67,
  "T8" -> 69,
  "T9" -> 72,
  "T10" -> 74
|>;

(* Core parametric relations (EMPIRICAL ESTIMATES). *)
midiToHz[m_] := a4Hz*2^((m - 69)/12);

(* Cantilever-style relation: f = k*thickness/length^2  =>  length = Sqrt[k*thickness/f]. *)
tongueLengthIn[f_, kSteel_, thick_] := Sqrt[kSteel*thick/f];
tongueLengthIn[f_] := tongueLengthIn[f, kSteelEstimate, steelThicknessInEstimate];

centsError[measured_, target_] := 1200*Log2[measured/target];

(* Build the tongue layout table for a given steel constant and thickness. *)
targetTableFor[kSteel_, thick_] := KeyValueMap[
  Function[{name, midi},
    {name, midi, midiToHz[midi], tongueLengthIn[midiToHz[midi], kSteel, thick],
     25.4*tongueLengthIn[midiToHz[midi], kSteel, thick]}],
  targetMidisEstimate
];

(* Final interactive app: expose steel constant, thickness, and length-sweep range. *)
steelTongueDrumExplorer = Manipulate[
  Module[
    {tbl, rows},
    tbl = targetTableFor[kSteel, thick];
    rows = Map[
      {#[[1]], #[[2]], NumberForm[#[[3]], {6, 1}],
        NumberForm[#[[4]], {5, 2}], NumberForm[#[[5]], {6, 1}]} &,
      tbl];
    Column[{
      Style["Steel Tongue Drum \[Dash] EMPIRICAL ESTIMATES (pending measurement)",
        Bold, 14],
      Style[
        "Cantilever-style estimate only \[Dash] not fabrication authority. " <>
          "Replace with measured validation data before cutting.",
        Italic, Gray],
      Grid[
        Prepend[rows,
          Style[#, Bold] & /@ {"Tongue", "MIDI", "Target Hz (EST)",
            "Length in (EST)", "Length mm (EST)"}],
        Frame -> All, Spacings -> {1.5, 0.8}],
      Plot[
        kSteel*thick/l^2, {l, lRange[[1]], lRange[[2]]},
        AxesLabel -> {"Tongue length (in)", "Frequency (Hz)"},
        PlotLabel -> "First-pass cantilever estimate only (EMPIRICAL ESTIMATE)",
        ImageSize -> 420, PlotRange -> All]
    }]
  ],
  {{kSteel, kSteelEstimate, "Steel constant k \[Dash] ESTIMATE"}, 20000., 45000.},
  {{thick, steelThicknessInEstimate, "Steel thickness in \[Dash] ESTIMATE"}, 0.05, 0.15},
  {{lRange, {2.0, 4.5}, "Length sweep in \[Dash] ESTIMATE"}, 1.0, 6.0,
    ControlType -> IntervalSlider},
  ControlPlacement -> Left,
  SaveDefinitions -> True
]
