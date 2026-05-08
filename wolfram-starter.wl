(* Steel Tongue Drum Wolfram starter *)

ClearAll["Global`*"];

(* Inputs from steel-tongue-drum-design-table.xlsx *)
bodyDiameterIn = 12.0;
shellHeightIn = 6.0;
steelThicknessIn = 0.079;
kerfIn = 0.040;
tongueWidthIn = 1.0;
portDiameterIn = 2.5;
a4Hz = 440.0;
kSteel = 32098.0;

targetMidis = <|
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
tongueLengthIn[f_] := Sqrt[kSteel*steelThicknessIn/f];
centsError[measured_, target_] := 1200*Log2[measured/target];

targetTable = KeyValueMap[
  {#1, #2, midiToHz[#2], tongueLengthIn[midiToHz[#2]], 25.4*tongueLengthIn[midiToHz[#2]]} &,
  targetMidis
];

Grid[
  Prepend[targetTable, {"Tongue", "MIDI", "Target Hz", "Length in", "Length mm"}],
  Frame -> All
]

(* Validation example: replace with measured data from validation.csv. *)
measuredExampleHz = <|"T8" -> 440.0|>;
KeyValueMap[{#1, centsError[#2, midiToHz[targetMidis[#1]]]} &, measuredExampleHz]

(* Simple sensitivity plot: pitch versus tongue length for the selected steel thickness. *)
Plot[kSteel*steelThicknessIn/l^2, {l, 2.0, 4.5},
  AxesLabel -> {"Tongue length (in)", "Frequency (Hz)"},
  PlotLabel -> "First-pass cantilever estimate only"
]
