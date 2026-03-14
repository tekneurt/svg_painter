import 'dart:math' as math;

import '../../base/_base.dart';
import '../../svg_model/_svg_model.dart';
import '../svg_value_extensions/svg_length_extensions.dart';

/// Context for converting SVG models to painting models.
/// Holds information needed for resolving relative values like percentages.
final class SvgPaintingContext {
  const SvgPaintingContext({
    required this.viewBoxWidth,
    required this.viewBoxHeight,
    this.viewBoxMinX = 0.0,
    this.viewBoxMinY = 0.0,
    this.inheritedFill = const SvgNamedColor(SvgColorName.black),
    this.inheritedFillOpacity = const SvgLength(1.0),
    this.inheritedStroke = const SvgNoneColor(),
    this.inheritedStrokeOpacity = const SvgLength(1.0),
    this.inheritedStrokeWidth = const SvgLength(1.0),
    this.inheritedStrokeDasharray,
    this.inheritedStrokeLinecap = SvgStrokeLinecap.butt,
    this.inheritedStrokeLinejoin = SvgStrokeLinejoin.miter,
    this.parentOpacity = 1.0,
    this.inheritedFontSize = const SvgLength(12.0),
    this.inheritedFontWeight = const SvgFontWeightNormal(),
    this.inheritedFontStyle = SvgFontStyle.normal,
    this.inheritedFontFamily = const SvgFontFamily('sans-serif'),
    this.styleSheet = const SvgStyleSheet(<String, Map<String, String>>{}),
    this.definitions = const <String, SvgElement>{},
  });

  /// The width of the viewport/viewBox.
  final double viewBoxWidth;

  /// The height of the viewport/viewBox.
  final double viewBoxHeight;

  /// The min-x coordinate of the viewBox.
  final double viewBoxMinX;

  /// The min-y coordinate of the viewBox.
  final double viewBoxMinY;

  /// Inherited fill color.
  final SvgColor? inheritedFill;

  /// Inherited fill opacity.
  final SvgLengthPercentage? inheritedFillOpacity;

  /// Inherited stroke color.
  final SvgColor? inheritedStroke;

  /// Inherited stroke opacity.
  final SvgLengthPercentage? inheritedStrokeOpacity;

  /// Inherited stroke width.
  final SvgLengthPercentage? inheritedStrokeWidth;

  /// Inherited stroke dasharray.
  final SvgPointList? inheritedStrokeDasharray;

  /// Inherited stroke linecap.
  final SvgStrokeLinecap? inheritedStrokeLinecap;

  /// Inherited stroke linejoin.
  final SvgStrokeLinejoin? inheritedStrokeLinejoin;

  /// Accumulated opacity from parents.
  final double parentOpacity;

  /// Inherited font size.
  final SvgLengthPercentage? inheritedFontSize;

  /// Inherited font weight.
  final SvgFontWeight? inheritedFontWeight;

  /// Inherited font style.
  final SvgFontStyle? inheritedFontStyle;

  /// Inherited font family.
  final SvgFontFamily? inheritedFontFamily;

  /// The CSS rules defined for the document.
  final SvgStyleSheet styleSheet;

  /// Map of element IDs to SvgElements.
  final Map<String, SvgElement> definitions;

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
    SvgColor? inheritedFill,
    SvgLengthPercentage? inheritedFillOpacity,
    SvgColor? inheritedStroke,
    SvgLengthPercentage? inheritedStrokeOpacity,
    SvgLengthPercentage? inheritedStrokeWidth,
    SvgPointList? inheritedStrokeDasharray,
    SvgStrokeLinecap? inheritedStrokeLinecap,
    SvgStrokeLinejoin? inheritedStrokeLinejoin,
    double? parentOpacity,
    SvgLengthPercentage? inheritedFontSize,
    SvgFontWeight? inheritedFontWeight,
    SvgFontStyle? inheritedFontStyle,
    SvgFontFamily? inheritedFontFamily,
  }) {
    return SvgPaintingContext(
      viewBoxWidth: viewBoxWidth ?? this.viewBoxWidth,
      viewBoxHeight: viewBoxHeight ?? this.viewBoxHeight,
      viewBoxMinX: viewBoxMinX ?? this.viewBoxMinX,
      viewBoxMinY: viewBoxMinY ?? this.viewBoxMinY,
      inheritedFill: inheritedFill ?? this.inheritedFill,
      inheritedFillOpacity: inheritedFillOpacity ?? this.inheritedFillOpacity,
      inheritedStroke: inheritedStroke ?? this.inheritedStroke,
      inheritedStrokeOpacity: inheritedStrokeOpacity ?? this.inheritedStrokeOpacity,
      inheritedStrokeWidth: inheritedStrokeWidth ?? this.inheritedStrokeWidth,
      inheritedStrokeDasharray: inheritedStrokeDasharray ?? this.inheritedStrokeDasharray,
      inheritedStrokeLinecap: inheritedStrokeLinecap ?? this.inheritedStrokeLinecap,
      inheritedStrokeLinejoin: inheritedStrokeLinejoin ?? this.inheritedStrokeLinejoin,
      parentOpacity: parentOpacity ?? this.parentOpacity,
      inheritedFontSize: inheritedFontSize ?? this.inheritedFontSize,
      inheritedFontWeight: inheritedFontWeight ?? this.inheritedFontWeight,
      inheritedFontStyle: inheritedFontStyle ?? this.inheritedFontStyle,
      inheritedFontFamily: inheritedFontFamily ?? this.inheritedFontFamily,
      styleSheet: styleSheet,
      definitions: definitions,
    );
  }

  /// Creates a new context by applying the styles of the given [element].
  SvgPaintingContext deriveWith(SvgElement element) {
    if (element is SvgGraphicsElement) {
      final SvgFontAttributes? font = element is SvgFontAttributable
          ? (element as SvgFontAttributable).fontAttributes
          : null;

      return derive(
        inheritedFill: element.fillAttributes?.color ?? inheritedFill,
        inheritedFillOpacity: element.fillAttributes?.opacity ?? inheritedFillOpacity,
        inheritedStroke: element.strokeAttributes?.color ?? inheritedStroke,
        inheritedStrokeOpacity: element.strokeAttributes?.opacity ?? inheritedStrokeOpacity,
        inheritedStrokeWidth: element.strokeAttributes?.width ?? inheritedStrokeWidth,
        inheritedStrokeDasharray: element.strokeAttributes?.dashArray ?? inheritedStrokeDasharray,
        inheritedStrokeLinecap: element.strokeAttributes?.linecap ?? inheritedStrokeLinecap,
        inheritedStrokeLinejoin: element.strokeAttributes?.linejoin ?? inheritedStrokeLinejoin,
        parentOpacity: 1.0,
        inheritedFontSize: font?.size ?? inheritedFontSize,
        inheritedFontWeight: font?.weight ?? inheritedFontWeight,
        inheritedFontStyle: font?.style ?? inheritedFontStyle,
        inheritedFontFamily: font?.family ?? inheritedFontFamily,
      );
    }

    return this;
  }
}
