part of '../svg_value.dart';

/// Defines the orientation of an `<marker>` element.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/orient
@immutable
sealed class SvgMarkerOrient extends SvgValue with SvgBaseValue {
  const SvgMarkerOrient();

  /// Orients the marker such that its positive x-axis points in the direction of the path.
  static const SvgMarkerOrient auto = SvgMarkerOrientAuto();

  /// For the start marker on a path, orients the marker 180 degrees opposite from `auto`.
  /// For all other markers, orients identically to `auto`.
  static const SvgMarkerOrient autoStartReverse = SvgMarkerOrientAutoStartReverse();

  /// Orients the marker at a fixed angle of 0 degrees.
  static const SvgMarkerOrient zero = SvgMarkerOrientAngle(0.0);
}

/// Orients the marker such that its positive x-axis points in the direction of the path.
final class SvgMarkerOrientAuto extends SvgMarkerOrient {
  const SvgMarkerOrientAuto();

  @override
  String toString() => 'auto';

  @override
  bool operator ==(Object other) => identical(this, other) || other is SvgMarkerOrientAuto;

  @override
  int get hashCode => 0x6175746f; // 'auto'
}

/// For the start marker on a path, orients the marker 180 degrees opposite from `auto`.
/// For all other markers, orients identically to `auto`.
final class SvgMarkerOrientAutoStartReverse extends SvgMarkerOrient {
  const SvgMarkerOrientAutoStartReverse();

  @override
  String toString() => 'auto-start-reverse';

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is SvgMarkerOrientAutoStartReverse;

  @override
  int get hashCode => 0x61737472; // 'astr'
}

/// Orients the marker at a fixed angle in degrees.
final class SvgMarkerOrientAngle extends SvgMarkerOrient {
  const SvgMarkerOrientAngle(this.degrees);

  /// The angle in degrees.
  final double degrees;

  @override
  String toString() => '$degrees';

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is SvgMarkerOrientAngle && other.degrees == degrees);

  @override
  int get hashCode => degrees.hashCode;
}
