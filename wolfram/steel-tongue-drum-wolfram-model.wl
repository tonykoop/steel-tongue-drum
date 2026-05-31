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

midiToHz[m_] := a4Hz*2^((m - 69)/12);
tongueLengthIn[f_] := Sqrt[kSteelEstimate*steelThicknessInEstimate/f];
centsError[measured_, target_] := 1200*Log2[measured/target];

targetTable = KeyValueMap[
  {#1, #2, midiToHz[#2], tongueLengthIn[midiToHz[#2]], 25.4*tongueLengthIn[midiToHz[#2]]} &,
  targetMidisEstimate
];

Grid[
  Prepend[targetTable, {"Tongue", "MIDI", "Target Hz", "Length in", "Length mm"}],
  Frame -> All
]

(* Validation example: replace with measured data from validation.csv. *)
measuredExampleHzPlaceholder = <|"T8" -> 440.0|>;
KeyValueMap[{#1, centsError[#2, midiToHz[targetMidisEstimate[#1]]]} &, measuredExampleHzPlaceholder]

(* Simple sensitivity plot: pitch versus tongue length for the selected steel thickness. *)
Plot[kSteelEstimate*steelThicknessInEstimate/l^2, {l, 2.0, 4.5},
  AxesLabel -> {"Tongue length (in)", "Frequency (Hz)"},
  PlotLabel -> "First-pass cantilever estimate only"
]
