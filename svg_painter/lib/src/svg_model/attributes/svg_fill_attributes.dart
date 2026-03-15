import 'package:meta/meta.dart';

import '../svg_value.dart';

/// Represents the grouped fill attributes of an SVG element.
@immutable
class SvgFillAttributes {
  const SvgFillAttributes({this.color, this.opacity});

  /// The fill color (mapped from `fill` attribute).
  final SvgColor? color;

  /// The opacity of the fill (mapped from `fill-opacity` attribute).
  final SvgLengthPercentage? opacity;

  @override
  String toString() {
    final List<String> parts = <String>[
      if (color != null) 'color: $color',
      if (opacity != null) 'opacity: $opacity',
    ];
    return 'SvgFillAttributes(${parts.join(', ')})';
  }
}
