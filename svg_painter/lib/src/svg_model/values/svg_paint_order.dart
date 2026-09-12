part of '../svg_value.dart';

/// The components that can be ordered by the `paint-order` property.
enum SvgPaintOrderComponent {
  /// The fill of the shape or text.
  fill('fill'),

  /// The stroke of the shape or text.
  stroke('stroke'),

  /// The markers of the shape.
  markers('markers');

  const SvgPaintOrderComponent(this.value);

  /// The string value as it appears in SVG XML or CSS.
  final String value;

  /// Parses a string into an [SvgPaintOrderComponent], or returns null if unknown.
  static SvgPaintOrderComponent? from(String? value) {
    if (value == null) {
      return null;
    }
    return SvgPaintOrderComponent.values.cast<SvgPaintOrderComponent?>().firstWhere(
      (component) => component?.value == value,
      orElse: () => null,
    );
  }
}

/// Represents the order that the fill, stroke, and markers of a shape or text element are painted.
@immutable
final class SvgPaintOrder with SvgBaseValue {
  const SvgPaintOrder(this.components);

  /// Default paint-order where fill is painted first, then stroke, then markers.
  static const normal = SvgPaintOrder(<SvgPaintOrderComponent>[
    SvgPaintOrderComponent.fill,
    SvgPaintOrderComponent.stroke,
    SvgPaintOrderComponent.markers,
  ]);

  /// The ordered painting components.
  final List<SvgPaintOrderComponent> components;

  /// Whether the stroke should be drawn before the fill.
  bool get isStrokeFirst {
    final int strokeIndex = components.indexOf(SvgPaintOrderComponent.stroke);
    final int fillIndex = components.indexOf(SvgPaintOrderComponent.fill);
    if (strokeIndex == -1 || fillIndex == -1) {
      return false;
    }
    return strokeIndex < fillIndex;
  }

  @override
  String toString() => 'SvgPaintOrder(${components.map((c) => c.value).join(' ')})';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! SvgPaintOrder || components.length != other.components.length) {
      return false;
    }
    for (var i = 0; i < components.length; i++) {
      if (components[i] != other.components[i]) {
        return false;
      }
    }
    return true;
  }

  @override
  int get hashCode => Object.hashAll(components);
}
