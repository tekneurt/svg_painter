import 'package:meta/meta.dart';

import '../svg_value.dart';

/// Represents the grouped transform attributes of an SVG element.
@immutable
final class SvgTransformAttributes with SvgBaseValue {
  const SvgTransformAttributes(this.operations);

  /// The list of transform operations to apply in order.
  final List<SvgTransformOperation> operations;

  @override
  String toString() => 'SvgTransformAttributes(${operations.join(', ')})';
}

/// Base class for all SVG transform operations.
@immutable
sealed class SvgTransformOperation {
  const SvgTransformOperation();
}

/// A matrix transformation: matrix(a, b, c, d, e, f).
final class SvgMatrix extends SvgTransformOperation {
  const SvgMatrix(this.a, this.b, this.c, this.d, this.e, this.f);
  final double a, b, c, d, e, f;

  @override
  String toString() => 'matrix($a, $b, $c, $d, $e, $f)';
}

/// A translation transformation: translate(x, [y]).
final class SvgTranslate extends SvgTransformOperation {
  const SvgTranslate(this.x, [this.y = 0.0]);
  final double x;
  final double y;

  @override
  String toString() => 'translate($x, $y)';
}

/// A scaling transformation: scale(x, [y]).
final class SvgScale extends SvgTransformOperation {
  const SvgScale(this.x, [double? y]) : y = y ?? x;
  final double x;
  final double y;

  @override
  String toString() => 'scale($x, $y)';
}

/// A rotation transformation: rotate(a, [cx, cy]).
final class SvgRotate extends SvgTransformOperation {
  const SvgRotate(this.angle, [this.cx, this.cy]);
  final double angle;
  final double? cx;
  final double? cy;

  @override
  String toString() {
    if (cx == null || cy == null) {
      return 'rotate($angle)';
    }
    return 'rotate($angle, $cx, $cy)';
  }
}

/// A skew transformation along the x-axis: skewX(a).
final class SvgSkewX extends SvgTransformOperation {
  const SvgSkewX(this.angle);
  final double angle;

  @override
  String toString() => 'skewX($angle)';
}

/// A skew transformation along the y-axis: skewY(a).
final class SvgSkewY extends SvgTransformOperation {
  const SvgSkewY(this.angle);
  final double angle;

  @override
  String toString() => 'skewY($angle)';
}
