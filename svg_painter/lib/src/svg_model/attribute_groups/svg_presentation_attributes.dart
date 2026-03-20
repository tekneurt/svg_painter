import 'package:meta/meta.dart';

import 'svg_fill_attributes.dart';
import 'svg_font_attributes.dart';
import 'svg_graphics_attributes.dart';
import 'svg_stroke_attributes.dart';

/// Represents a unified set of presentation attributes for an SVG element.
///
/// This DTO consolidates fill, stroke, font, and graphics attributes into a
/// single object, providing methods for merging (priority resolution) and
/// inheritance as defined by the SVG specification.
@immutable
final class SvgPresentationAttributes {
  const SvgPresentationAttributes({this.fill, this.stroke, this.font, this.graphics});

  /// Fill-related attributes.
  final SvgFillAttributes? fill;

  /// Stroke-related attributes.
  final SvgStrokeAttributes? stroke;

  /// Font-related attributes.
  final SvgFontAttributes? font;

  /// Graphics-related presentation attributes (e.g., opacity, transform).
  final SvgGraphicsAttributes? graphics;

  /// Merges this set of attributes with another set.
  ///
  /// This is used to resolve attribute priority (e.g., Inline Style > CSS > Attribute).
  /// The [other] set takes precedence over `this` set for any non-null properties.
  SvgPresentationAttributes merge(SvgPresentationAttributes? other) {
    if (other == null) {
      return this;
    }
    return SvgPresentationAttributes(
      fill: _mergeFill(fill, other.fill),
      stroke: _mergeStroke(stroke, other.stroke),
      font: _mergeFont(font, other.font),
      graphics: _mergeGraphics(graphics, other.graphics),
    );
  }

  /// Inherits attributes from a parent set.
  ///
  /// This is used to resolve attribute inheritance. Only properties that are
  /// specified as inherited in the SVG spec will be taken from the [parent].
  SvgPresentationAttributes inherit(SvgPresentationAttributes? parent) {
    if (parent == null) {
      return this;
    }
    return SvgPresentationAttributes(
      // Inherited groups
      fill: _inheritFill(fill, parent.fill),
      stroke: _inheritStroke(stroke, parent.stroke),
      font: _inheritFont(font, parent.font),
      // Non-inherited groups (opacity, transform, etc. do NOT inherit)
      graphics: graphics,
    );
  }

  static SvgFillAttributes? _mergeFill(SvgFillAttributes? a, SvgFillAttributes? b) {
    if (a == null) {
      return b;
    }
    if (b == null) {
      return a;
    }
    return SvgFillAttributes(color: b.color ?? a.color, opacity: b.opacity ?? a.opacity);
  }

  static SvgStrokeAttributes? _mergeStroke(SvgStrokeAttributes? a, SvgStrokeAttributes? b) {
    if (a == null) {
      return b;
    }
    if (b == null) {
      return a;
    }
    return SvgStrokeAttributes(
      color: b.color ?? a.color,
      opacity: b.opacity ?? a.opacity,
      width: b.width ?? a.width,
      dashArray: b.dashArray ?? a.dashArray,
      linecap: b.linecap ?? a.linecap,
      linejoin: b.linejoin ?? a.linejoin,
    );
  }

  static SvgFontAttributes? _mergeFont(SvgFontAttributes? a, SvgFontAttributes? b) {
    if (a == null) {
      return b;
    }
    if (b == null) {
      return a;
    }
    return SvgFontAttributes(
      size: b.size ?? a.size,
      weight: b.weight ?? a.weight,
      style: b.style ?? a.style,
      family: b.family ?? a.family,
    );
  }

  static SvgGraphicsAttributes? _mergeGraphics(SvgGraphicsAttributes? a, SvgGraphicsAttributes? b) {
    if (a == null) {
      return b;
    }
    if (b == null) {
      return a;
    }
    return SvgGraphicsAttributes(
      opacity: b.opacity ?? a.opacity,
      transformAttributes: b.transformAttributes ?? a.transformAttributes,
    );
  }

  static SvgFillAttributes? _inheritFill(SvgFillAttributes? child, SvgFillAttributes? parent) {
    if (parent == null) {
      return child;
    }
    if (child == null) {
      return parent;
    }
    return SvgFillAttributes(
      color: child.color ?? parent.color,
      opacity: child.opacity ?? parent.opacity,
    );
  }

  static SvgStrokeAttributes? _inheritStroke(
    SvgStrokeAttributes? child,
    SvgStrokeAttributes? parent,
  ) {
    if (parent == null) {
      return child;
    }
    if (child == null) {
      return parent;
    }
    return SvgStrokeAttributes(
      color: child.color ?? parent.color,
      opacity: child.opacity ?? parent.opacity,
      width: child.width ?? parent.width,
      dashArray: child.dashArray ?? parent.dashArray,
      linecap: child.linecap ?? parent.linecap,
      linejoin: child.linejoin ?? parent.linejoin,
    );
  }

  static SvgFontAttributes? _inheritFont(SvgFontAttributes? child, SvgFontAttributes? parent) {
    if (parent == null) {
      return child;
    }
    if (child == null) {
      return parent;
    }
    return SvgFontAttributes(
      size: child.size ?? parent.size,
      weight: child.weight ?? parent.weight,
      style: child.style ?? parent.style,
      family: child.family ?? parent.family,
    );
  }

  @override
  String toString() {
    final List<String> parts = <String>[
      if (fill != null) 'fill: $fill',
      if (stroke != null) 'stroke: $stroke',
      if (font != null) 'font: $font',
      if (graphics != null) 'graphics: $graphics',
    ];
    return 'SvgPresentationAttributes(${parts.join(', ')})';
  }
}
