import '../../svg_model/_svg_model.dart'; // For SvgLengthUnit

/// Extension on [String] to convert XML unit suffixes to [SvgLengthUnit] enum values.
extension ToSvgLengthUnit on String {
  /// Converts this string unit suffix to an [SvgLengthUnit].
  ///
  /// Returns [SvgLengthUnit.none] if the suffix is empty or unknown.
  SvgLengthUnit toSvgLengthUnit() {
    return _suffixToUnit[this] ?? SvgLengthUnit.none;
  }
}

/// Internal map for converting string suffixes to [SvgLengthUnit] enum values.
const Map<String, SvgLengthUnit> _suffixToUnit = <String, SvgLengthUnit>{
  '': SvgLengthUnit.none,
  'px': SvgLengthUnit.px,
  'cm': SvgLengthUnit.cm,
  'mm': SvgLengthUnit.mm,
  'Q': SvgLengthUnit.q,
  'in': SvgLengthUnit.inUnit,
  'pt': SvgLengthUnit.pt,
  'pc': SvgLengthUnit.pc,
  'vw': SvgLengthUnit.vw,
  'vh': SvgLengthUnit.vh,
  'vmin': SvgLengthUnit.vmin,
  'vmax': SvgLengthUnit.vmax,
};
