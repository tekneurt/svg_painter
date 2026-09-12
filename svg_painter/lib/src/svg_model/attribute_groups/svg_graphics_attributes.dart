import 'package:meta/meta.dart';

import '../svg_value.dart';
import 'svg_transform_attributes.dart';

/// Represents the grouped presentation attributes that apply to graphics elements.
@immutable
final class SvgGraphicsAttributes {
  const SvgGraphicsAttributes({this.opacity, this.transformAttributes, this.mask, this.clipPath});

  /// The transparency of the element (mapped from `opacity` attribute).
  final SvgLengthPercentage? opacity;

  /// The transformation(s) applied to the element (mapped from `transform` attribute).
  final SvgTransformAttributes? transformAttributes;

  /// The reference to a mask element (mapped from `mask` attribute).
  final String? mask;

  /// The reference to a clipPath element (mapped from `clip-path` attribute).
  final String? clipPath;

  @override
  String toString() {
    final parts = <String>[
      if (opacity != null) 'opacity: $opacity',
      if (transformAttributes != null) 'transform: $transformAttributes',
      if (mask != null) 'mask: $mask',
      if (clipPath != null) 'clip-path: $clipPath',
    ];
    return 'SvgGraphicsAttributes(${parts.join(', ')})';
  }
}
