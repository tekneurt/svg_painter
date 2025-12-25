import 'package:meta/meta.dart';

import 'svg_value.dart';

part 'elements/svg_circle.dart';
part 'elements/svg_defs.dart';
part 'elements/svg_ellipse.dart';
part 'elements/svg_group.dart';
part 'elements/svg_line.dart';
part 'elements/svg_path.dart';
part 'elements/svg_rect.dart';
part 'elements/svg_radial_gradient.dart';
part 'elements/svg_linear_gradient.dart';
part 'elements/svg_polyline.dart';
part 'elements/svg_polygon.dart';
part 'elements/svg_svg.dart';
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
  const SvgGraphicsElement({super.id, this.fill, this.stroke, this.strokeWidth, this.transform});

  /// The fill color of the element.
  final SvgColor? fill;

  /// The stroke color of the element.
  final SvgColor? stroke;

  /// The width of the stroke.
  final SvgLengthPercentage? strokeWidth;

  /// The transform applied to the element.
  final String? transform;
}

/// Base class for basic shape elements (<circle>, <rect>, etc.).
@immutable
sealed class SvgBasicShape extends SvgGraphicsElement {
  const SvgBasicShape({super.id, super.fill, super.stroke, super.strokeWidth, super.transform});
}

/// Base class for container elements (<svg>, <g>).
@immutable
sealed class SvgContainerElement extends SvgGraphicsElement with SvgParent {
  const SvgContainerElement({
    required this.children,
    super.id,
    super.fill,
    super.stroke,
    super.strokeWidth,
    super.transform,
  });

  @override
  final List<SvgElement> children;
}

/// Base class for non-rendering definition elements (<defs>, gradients).
@immutable
sealed class SvgDefinitionElement extends SvgElement {
  const SvgDefinitionElement({super.id});
}

/// Represents a <stop> element within a gradient.
@immutable
final class SvgStop extends SvgDefinitionElement {
  const SvgStop({
    required this.offset,
    required this.stopColor,
    required this.stopOpacity,
    super.id,
  });

  /// The location of the color stop (length or percentage).
  final SvgLengthPercentage offset;

  /// The color of the stop.
  final SvgColor stopColor;

  /// The opacity of the stop (0.0 to 1.0).
  final SvgLengthPercentage stopOpacity;
}

/// Base class for gradient elements (<linearGradient>, <radialGradient>).
@immutable
sealed class SvgGradient extends SvgDefinitionElement {
  const SvgGradient({
    required this.stops,
    super.id,
    this.gradientTransform,
  });

  /// The color stops for this gradient.
  final List<SvgStop> stops;

  /// The transformation applied to the gradient.
  final String? gradientTransform;
}
