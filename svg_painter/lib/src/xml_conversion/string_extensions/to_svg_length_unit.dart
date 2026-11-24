import '../../svg_model/_svg_model.dart'; // For SvgLengthUnit

/// Extension on [String] to convert XML unit suffixes to [SvgLengthUnit] enum values.
extension ToSvgLengthUnit on String {
  /// Converts this string unit suffix to an [SvgLengthUnit].
  ///
  /// Returns [SvgLengthUnit.none] if the suffix is empty or unknown.
  SvgLengthUnit toSvgLengthUnit() {
    return _suffixToUnit[toLowerCase()] ?? SvgLengthUnit.none;
  }
}

/// Internal map for converting string suffixes to [SvgLengthUnit] enum values.
const Map<String, SvgLengthUnit> _suffixToUnit = <String, SvgLengthUnit>{
  '': SvgLengthUnit.none,
  'ch': SvgLengthUnit.ch,
  'cm': SvgLengthUnit.cm,
  'em': SvgLengthUnit.em,
  'ex': SvgLengthUnit.ex,
  'in': SvgLengthUnit.inUnit,
  'mm': SvgLengthUnit.mm,
  'pc': SvgLengthUnit.pc,
  'pt': SvgLengthUnit.pt,
  'px': SvgLengthUnit.px,
  'q': SvgLengthUnit.q,
  'rem': SvgLengthUnit.rem,
  'vh': SvgLengthUnit.vh,
  'vmax': SvgLengthUnit.vmax,
  'vmin': SvgLengthUnit.vmin,
  'vw': SvgLengthUnit.vw,
};
