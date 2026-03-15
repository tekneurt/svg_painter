part of '../svg_value.dart';

/// Represents the weight of a font in SVG.
/// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/font-weight
@immutable
sealed class SvgFontWeight with SvgBaseValue {
  const SvgFontWeight();
}

/// The 'normal' font weight (numeric 400).
final class SvgFontWeightNormal extends SvgFontWeight {
  const SvgFontWeightNormal();

  @override
  String toString() => 'SvgFontWeight(normal)';
}

/// The 'bold' font weight (numeric 700).
final class SvgFontWeightBold extends SvgFontWeight {
  const SvgFontWeightBold();

  @override
  String toString() => 'SvgFontWeight(bold)';
}

/// A relative font weight, bolder than the parent.
final class SvgFontWeightBolder extends SvgFontWeight {
  const SvgFontWeightBolder();

  @override
  String toString() => 'SvgFontWeight(bolder)';
}

/// A relative font weight, lighter than the parent.
final class SvgFontWeightLighter extends SvgFontWeight {
  const SvgFontWeightLighter();

  @override
  String toString() => 'SvgFontWeight(lighter)';
}

/// A specific numeric font weight (1 to 1000).
final class SvgFontWeightNumeric extends SvgFontWeight {
  const SvgFontWeightNumeric(this.value)
    : assert(value >= 1 && value <= 1000, 'Font weight must be between 1 and 1000');

  /// The numeric value of the font weight.
  final double value;

  @override
  String toString() => 'SvgFontWeight($value)';
}
