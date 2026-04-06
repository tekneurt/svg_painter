import 'dart:math' as math;

import '../../svg_model/_svg_model.dart';

/// Context for converting SVG models to painting models.
/// Holds information needed for resolving relative values like percentages.
final class SvgPaintingContext {
  const SvgPaintingContext({
    required this.viewBoxWidth,
    required this.viewBoxHeight,
    this.viewBoxMinX = 0.0,
    this.viewBoxMinY = 0.0,
    this.inheritedAttributes = const SvgPresentationAttributes(
      fill: SvgFillAttributes(color: SvgNamedColor(SvgColorName.black), opacity: SvgLength(1.0)),
      stroke: SvgStrokeAttributes(color: SvgNoneColor(), opacity: SvgLength(1.0), width: SvgLength(1.0)),
      font: SvgFontAttributes(
        size: SvgLength(12.0),
        weight: SvgFontWeightNormal(),
        style: SvgFontStyle.normal,
        family: SvgFontFamily('sans-serif'),
      ),
    ),
    this.styleSheet = const SvgStyleSheet(<String, Map<String, String>>{}),
    this.definitions = const <String, SvgElement>{},
    this.imageCache = const <String, List<int>>{},
    this.svgCache = const <String, SvgRoot>{},
  });

  /// The width of the viewport/viewBox.
  final double viewBoxWidth;

  /// The height of the viewport/viewBox.
  final double viewBoxHeight;

  /// The min-x coordinate of the viewBox.
  final double viewBoxMinX;

  /// The min-y coordinate of the viewBox.
  final double viewBoxMinY;

  /// Grouped presentation attributes inherited from ancestors.
  final SvgPresentationAttributes inheritedAttributes;

  /// Inherited fill color.
  SvgColor? get inheritedFill => inheritedAttributes.fill?.color;

  /// Inherited fill opacity.
  SvgLengthPercentage? get inheritedFillOpacity => inheritedAttributes.fill?.opacity;

  /// Inherited stroke color.
  SvgColor? get inheritedStroke => inheritedAttributes.stroke?.color;

  /// Inherited stroke opacity.
  SvgLengthPercentage? get inheritedStrokeOpacity => inheritedAttributes.stroke?.opacity;

  /// Inherited stroke width.
  SvgLengthPercentage? get inheritedStrokeWidth => inheritedAttributes.stroke?.width;

  /// Inherited stroke dasharray.
  SvgPointList? get inheritedStrokeDasharray => inheritedAttributes.stroke?.dashArray;

  /// Inherited stroke linecap.
  SvgStrokeLinecap? get inheritedStrokeLinecap => inheritedAttributes.stroke?.linecap;

  /// Inherited stroke linejoin.
  SvgStrokeLinejoin? get inheritedStrokeLinejoin => inheritedAttributes.stroke?.linejoin;

  /// Inherited font size.
  SvgLengthPercentage? get inheritedFontSize => inheritedAttributes.font?.size;

  /// Inherited font weight.
  SvgFontWeight? get inheritedFontWeight => inheritedAttributes.font?.weight;

  /// Inherited font style.
  SvgFontStyle? get inheritedFontStyle => inheritedAttributes.font?.style;

  /// Inherited font family.
  SvgFontFamily? get inheritedFontFamily => inheritedAttributes.font?.family;

  /// The CSS rules defined for the document.
  final SvgStyleSheet styleSheet;

  /// Map of element IDs to SvgElements.
  final Map<String, SvgElement> definitions;

  /// Map of hrefs to image bytes.
  final Map<String, List<int>> imageCache;

  /// Map of hrefs to pre-parsed SvgRoot objects.
  final Map<String, SvgRoot> svgCache;

  /// Returns the normalized diagonal length of the viewBox for resolving radii.
  /// Formula: sqrt(w*w + h*h) / sqrt(2)
  double get viewBoxNormalizedDiagonal {
    return math.sqrt(viewBoxWidth * viewBoxWidth + viewBoxHeight * viewBoxHeight) / math.sqrt(2.0);
  }

  /// Creates a new context derived from this one, optionally overriding properties.
  SvgPaintingContext derive({
    double? viewBoxWidth,
    double? viewBoxHeight,
    double? viewBoxMinX,
    double? viewBoxMinY,
    SvgPresentationAttributes? inheritedAttributes,
    Map<String, SvgRoot>? svgCache,
  }) {
    return SvgPaintingContext(
      viewBoxWidth: viewBoxWidth ?? this.viewBoxWidth,
      viewBoxHeight: viewBoxHeight ?? this.viewBoxHeight,
      viewBoxMinX: viewBoxMinX ?? this.viewBoxMinX,
      viewBoxMinY: viewBoxMinY ?? this.viewBoxMinY,
      inheritedAttributes: inheritedAttributes ?? this.inheritedAttributes,
      styleSheet: styleSheet,
      definitions: definitions,
      imageCache: imageCache,
      svgCache: svgCache ?? this.svgCache,
    );
  }

  /// Creates a new context by applying the styles of the given [element].
  SvgPaintingContext deriveWith(SvgElement element) {
    if (element is SvgPresentable) {
      final SvgPresentationAttributes? elementAttrs = element.presentationAttributes;
      if (elementAttrs == null) {
        return this;
      }

      // Handle spec inheritance rules via DTO
      final SvgPresentationAttributes newInherited = elementAttrs.inherit(inheritedAttributes);

      return derive(inheritedAttributes: newInherited);
    }

    return this;
  }
}
