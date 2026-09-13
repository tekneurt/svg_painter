import 'package:meta/meta.dart';

import '../svg_value.dart';

/// Represents the grouped fill attributes of an SVG element.
@immutable
class SvgFillAttributes {
  const SvgFillAttributes({this.color, this.opacity, this.rule});

  /// The fill color (mapped from `fill` attribute).
  final SvgColor? color;

  /// The opacity of the fill (mapped from `fill-opacity` attribute).
  final SvgLengthPercentage? opacity;

  /// The fill rule (mapped from `fill-rule` attribute).
  final SvgFillRule? rule;

  @override
  String toString() {
    final parts = <String>[
      if (color != null) 'color: $color',
      if (opacity != null) 'opacity: $opacity',
      if (rule != null) 'rule: $rule',
    ];
    return 'SvgFillAttributes(${parts.join(', ')})';
  }
}
