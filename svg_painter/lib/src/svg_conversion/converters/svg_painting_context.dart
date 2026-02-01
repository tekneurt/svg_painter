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
    this.parentTx = 0.0,
    this.parentTy = 0.0,
    this.parentSx = 1.0,
    this.parentSy = 1.0,
    this.inheritedFill,
    this.inheritedFillOpacity,
    this.inheritedStroke,
    this.inheritedStrokeOpacity,
    this.inheritedStrokeWidth,
    this.inheritedStrokeDasharray,
    this.inheritedStrokeLinecap,
    this.inheritedStrokeLinejoin,
    this.parentOpacity = 1.0,
    this.inheritedFontSize,
    this.inheritedFontWeight,
    this.inheritedFontStyle,
    this.inheritedFontFamily,
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

  /// Translation X from parent context.
  final double parentTx;

  /// Translation Y from parent context.
  final double parentTy;

  /// Scale X from parent context.
  final double parentSx;

  /// Scale Y from parent context.
  final double parentSy;

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

  /// The combined scale factor from parents.
  double get parentScale {
    return math.sqrt(parentSx * parentSx + parentSy * parentSy) / math.sqrt(2.0);
  }

  /// Creates a new context derived from this one, optionally overriding properties.
  SvgPaintingContext derive({
    double? viewBoxWidth,
    double? viewBoxHeight,
    double? viewBoxMinX,
    double? viewBoxMinY,
    double? parentTx,
    double? parentTy,
    double? parentSx,
    double? parentSy,
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
      parentTx: parentTx ?? this.parentTx,
      parentTy: parentTy ?? this.parentTy,
      parentSx: parentSx ?? this.parentSx,
      parentSy: parentSy ?? this.parentSy,
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

  /// Transforms an x-coordinate from current user space to root coordinate space.
  double transformX(double x) => (x * parentSx) + parentTx;

  /// Transforms a y-coordinate from current user space to root coordinate space.
  double transformY(double y) => (y * parentSy) + parentTy;

  /// Scales a horizontal length from current user space to root coordinate space.
  double scaleHorizontal(double w) => w * parentSx;

  /// Scales a vertical length from current user space to root coordinate space.
  double scaleVertical(double h) => h * parentSy;

  /// Scales a normalized length (like radius) from current user space to root coordinate space.
  double scaleNormalized(double l) => l * parentScale;
}
