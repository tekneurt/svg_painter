import 'package:meta/meta.dart';

import '../svg_value.dart';

/// Represents the grouped font attributes of an SVG element.
@immutable
class SvgFontAttributes {
  const SvgFontAttributes({this.size, this.weight, this.style, this.family});

  /// The size of the font (mapped from `font-size` attribute).
  final SvgLengthPercentage? size;

  /// The weight of the font (mapped from `font-weight` attribute).
  final String? weight;

  /// The style of the font (mapped from `font-style` attribute).
  final String? style;

  /// The family of the font (mapped from `font-family` attribute).
  final String? family;

  @override
  String toString() {
    final List<String> parts = <String>[
      if (size != null) 'size: $size',
      if (weight != null) 'weight: $weight',
      if (style != null) 'style: $style',
      if (family != null) 'family: $family',
    ];
    return 'SvgFontAttributes(${parts.join(', ')})';
  }
}
