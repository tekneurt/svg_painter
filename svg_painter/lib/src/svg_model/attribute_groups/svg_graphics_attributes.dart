import 'package:meta/meta.dart';

import '../svg_value.dart';
import 'svg_transform_attributes.dart';

/// Represents the grouped presentation attributes that apply to graphics elements.
@immutable
final class SvgGraphicsAttributes {
  const SvgGraphicsAttributes({this.opacity, this.transformAttributes});

  /// The transparency of the element (mapped from `opacity` attribute).
  final SvgLengthPercentage? opacity;

  /// The transformation(s) applied to the element (mapped from `transform` attribute).
  final SvgTransformAttributes? transformAttributes;

  @override
  String toString() {
    final parts = <String>[
      if (opacity != null) 'opacity: $opacity',
      if (transformAttributes != null) 'transform: $transformAttributes',
    ];
    return 'SvgGraphicsAttributes(${parts.join(', ')})';
  }
}
