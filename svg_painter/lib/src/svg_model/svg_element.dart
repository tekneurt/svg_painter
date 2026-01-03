import 'package:meta/meta.dart';

import 'attributes/svg_stroke_attributes.dart';
import 'svg_style_sheet.dart';
import 'svg_value.dart';

part 'elements/svg_circle.dart';
part 'elements/svg_defs.dart';
part 'elements/svg_ellipse.dart';
part 'elements/svg_group.dart';
part 'elements/svg_line.dart';
part 'elements/svg_path.dart';
part 'elements/svg_rect.dart';
part 'elements/svg_stop.dart';
part 'elements/svg_style.dart';
part 'elements/svg_radial_gradient.dart';
part 'elements/svg_linear_gradient.dart';
part 'elements/svg_polyline.dart';
part 'elements/svg_polygon.dart';
part 'elements/svg_svg.dart';
part 'elements/svg_text.dart';
part 'elements/svg_use.dart';

/// The base class for all SVG elements in the domain model.
@immutable
sealed class SvgElement {
  const SvgElement({this.id});

  /// The unique identifier of the element.
  final String? id;
}

/// Mixin for SVG elements that contain child elements.
mixin SvgParent {
  /// The child elements contained within this element.
  List<SvgElement> get children;
}

/// Base class for SVG graphics elements (elements that can be rendered).
@immutable
sealed class SvgGraphicsElement extends SvgElement {
  const SvgGraphicsElement({
    super.id,
    this.fill,
    this.fillOpacity,
    this.stroke,
    this.opacity,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.fontFamily,
    this.cssClass,
    this.inlineStyle,
    this.transform,
    this.pathLength,
  });

  /// The fill color of the element.
  final SvgColor? fill;

  /// The opacity of the fill.
  final SvgLengthPercentage? fillOpacity;

  /// The grouped stroke attributes of the element.
  final SvgStrokeAttributes? stroke;

  /// The transparency of the element.
  final SvgLengthPercentage? opacity;

  /// The size of the font.
  final SvgLengthPercentage? fontSize;

  /// The weight of the font.
  final String? fontWeight;

  /// The style of the font.
  final String? fontStyle;

  /// The family of the font.
  final String? fontFamily;

  /// The CSS class(es) of the element.
  final String? cssClass;

  /// Inline CSS style rules for the element.
  final String? inlineStyle;

  /// The transform applied to the element.
  final String? transform;

  /// The total length of the path in user units.
  final SvgLength? pathLength;
}

/// Base class for basic shape elements (<circle>, <rect>, etc.).
@immutable
sealed class SvgBasicShape extends SvgGraphicsElement {
  const SvgBasicShape({
    super.id,
    super.fill,
    super.fillOpacity,
    super.stroke,
    super.opacity,
    super.fontSize,
    super.fontWeight,
    super.fontStyle,
    super.fontFamily,
    super.cssClass,
    super.inlineStyle,
    super.transform,
    super.pathLength,
  });
}

/// Base class for container elements (<svg>, <g>).
@immutable
sealed class SvgContainerElement extends SvgGraphicsElement with SvgParent {
  const SvgContainerElement({
    required this.children,
    super.id,
    super.fill,
    super.fillOpacity,
    super.stroke,
    super.opacity,
    super.fontSize,
    super.fontWeight,
    super.fontStyle,
    super.fontFamily,
    super.cssClass,
    super.inlineStyle,
    super.transform,
    super.pathLength,
  });

  @override
  final List<SvgElement> children;
}

/// Base class for non-rendering definition elements (<defs>, gradients).
@immutable
sealed class SvgDefinitionElement extends SvgElement {
  const SvgDefinitionElement({super.id});
}

/// Represents a metadata element (<title>, <desc>).
@immutable
sealed class SvgMetadataElement extends SvgElement {
  const SvgMetadataElement({required this.content, super.id});

  /// The text content of the metadata element.
  final String content;
}

/// Represents a <title> element.
@immutable
final class SvgTitle extends SvgMetadataElement {
  const SvgTitle({required super.content, super.id});
}

/// Represents a <desc> element.
@immutable
final class SvgDesc extends SvgMetadataElement {
  const SvgDesc({required super.content, super.id});
}
