import '../../base/_base.dart';
import '../../painting_model/_painting_model.dart';
import '../../svg_model/_svg_model.dart';
import '../../xml_conversion/_xml_conversion.dart';
import '../svg_value_extensions/_svg_value_extensions.dart';
import 'svg_painting_context.dart';

/// Resolves the fill, stroke, and stroke-width for an element, handling CSS classes, inline styles, inheritance and scaling.
PaintingStyle resolvePaint(
  SvgPaintingContext context, {
  String? tagName,
  String? id,
  SvgNumber? pathLength,
  SvgFillAttributes? fillAttributes,
  SvgStrokeAttributes? strokeAttributes,
  SvgFontAttributes? fontAttributes,
  SvgLengthPercentage? opacity,
  String? cssClass,
  String? inlineStyle,
}) {
  // 1. Resolve CSS properties
  final Map<String, String> resolvedRules = <String, String>{};

  // Priority: Tag selector < Class selector < ID selector < Inline style

  // a. Tag selector rules
  if (tagName == null) {
    // No tag name
  } else {
    final Map<String, String>? rules = context.styleSheet.rules[tagName];
    if (rules == null) {
      // No rules for this tag
    } else {
      resolvedRules.addAll(rules);
    }
  }

  // b. Class selector rules
  if (cssClass == null) {
    // No class
  } else {
    final List<String> classes = cssClass.split(RegExp(r'\s+'));
    for (final String className in classes) {
      final Map<String, String>? rules = context.styleSheet.rules['.$className'];
      if (rules == null) {
        // No rules for this class
      } else {
        resolvedRules.addAll(rules);
      }
    }
  }

  // c. ID selector rules
  if (id == null) {
    // No ID
  } else {
    final Map<String, String>? rules = context.styleSheet.rules['#$id'];
    if (rules == null) {
      // No rules for this ID
    } else {
      resolvedRules.addAll(rules);
    }
  }

  // d. Inline style (overrides everything else)
  if (inlineStyle == null) {
    // No inline style
  } else {
    final List<String> declarations = inlineStyle.split(';');
    for (final String decl in declarations) {
      final String trimmedDecl = decl.trim();
      if (trimmedDecl.isEmpty) {
        continue;
      }
      final List<String> parts = trimmedDecl.split(':');
      if (parts.length == 2) {
        resolvedRules[parts[0].trim()] = parts[1].trim();
      }
    }
  }

  // 3. Extract values from resolved rules
  SvgColor? cssFill;
  SvgLengthPercentage? cssFillOpacity;
  SvgColor? cssStroke;
  SvgLengthPercentage? cssStrokeOpacity;
  SvgLengthPercentage? cssStrokeWidth;
  SvgPointList? cssStrokeDasharray;
  SvgStrokeLinecap? cssStrokeLinecap;
  SvgStrokeLinejoin? cssStrokeLinejoin;
  SvgLengthPercentage? cssOpacity;
  String? cssFontWeight;
  String? cssFontStyle;
  SvgLengthPercentage? cssFontSize;
  String? cssFontFamily;
  SvgNumber? cssPathLength;

  if (resolvedRules.containsKey('font')) {
    // Basic font shorthand support: [style] [weight] size [family]
    final List<String> parts = resolvedRules['font']!.split(RegExp(r'\s+'));
    for (final String part in parts) {
      if (part == 'italic') {
        cssFontStyle = 'italic';
      } else if (part == 'bold' || part == 'heavy') {
        cssFontWeight = 'bold';
      } else if (part.contains(RegExp(r'\d'))) {
        cssFontSize = part.toSvgLengthPercentage();
      } else if (part != 'normal') {
        cssFontFamily ??= part;
      }
    }
  }

  if (resolvedRules.containsKey('fill')) {
    cssFill = resolvedRules['fill']!.toSvgColor();
  }
  if (resolvedRules.containsKey('fill-opacity')) {
    cssFillOpacity = resolvedRules['fill-opacity']!.toSvgLengthPercentage();
  }
  if (resolvedRules.containsKey('stroke')) {
    cssStroke = resolvedRules['stroke']!.toSvgColor();
  }
  if (resolvedRules.containsKey('stroke-opacity')) {
    cssStrokeOpacity = resolvedRules['stroke-opacity']!.toSvgLengthPercentage();
  }
  if (resolvedRules.containsKey('stroke-width')) {
    cssStrokeWidth = resolvedRules['stroke-width']!.toSvgLengthPercentage();
  }
  if (resolvedRules.containsKey('stroke-dasharray')) {
    cssStrokeDasharray = resolvedRules['stroke-dasharray']!.toSvgPointList();
  }
  if (resolvedRules.containsKey('stroke-linecap')) {
    cssStrokeLinecap = resolvedRules['stroke-linecap']!.toSvgStrokeLinecap();
  }
  if (resolvedRules.containsKey('stroke-linejoin')) {
    cssStrokeLinejoin = resolvedRules['stroke-linejoin']!.toSvgStrokeLinejoin();
  }
  if (resolvedRules.containsKey('opacity')) {
    cssOpacity = resolvedRules['opacity']!.toSvgLengthPercentage();
  }
  if (resolvedRules.containsKey('font-weight')) {
    cssFontWeight = resolvedRules['font-weight'];
  }
  if (resolvedRules.containsKey('font-style')) {
    cssFontStyle = resolvedRules['font-style'];
  }
  if (resolvedRules.containsKey('font-size')) {
    cssFontSize = resolvedRules['font-size']!.toSvgLengthPercentage();
  }
  if (resolvedRules.containsKey('font-family')) {
    cssFontFamily = resolvedRules['font-family'];
  }
  if (resolvedRules.containsKey('pathLength')) {
    cssPathLength = resolvedRules['pathLength']!.toSvgNonNegativeNumber();
  }

  // Determine if fill/stroke are explicit (not just inherited)
  final bool isFillExplicit =
      fillAttributes?.color != null ||
      cssFill != null ||
      resolvedRules.containsKey('fill') ||
      (inlineStyle?.contains('fill:') ?? false);

  final bool isStrokeExplicit =
      strokeAttributes?.color != null ||
      cssStroke != null ||
      resolvedRules.containsKey('stroke') ||
      (inlineStyle?.contains('stroke:') ?? false);

  // 4. Resolve element opacity (group opacity)
  final double selfOpacity = (cssOpacity ?? opacity)?.resolve(context, SvgOrientation.unit) ?? 1.0;
  final double elementOpacity = selfOpacity * context.parentOpacity;

  // 5. Resolve final values using priority: Inline Style/CSS > Presentation Attribute > Inherited
  final SvgColor? fillPaint = cssFill ?? fillAttributes?.color ?? context.inheritedFill;
  final bool hasFill = fillPaint is! SvgNoneColor;
  PaintingFillStyle? fillStyle;
  if (hasFill) {
    int? fillColorArgb;
    String? fillShaderId;
    final bool isCurrentColor = fillPaint is SvgCurrentColor;

    if (fillPaint is SvgPaintReference) {
      fillShaderId = fillPaint.id;
    } else if (isCurrentColor) {
      // CurrentColor doesn't have a static ARGB value
    } else {
      fillColorArgb = fillPaint.toFillArgb();
    }

    final double finalFillOpacity =
        elementOpacity *
        ((cssFillOpacity ?? fillAttributes?.opacity ?? context.inheritedFillOpacity)?.resolve(
              context,
              SvgOrientation.unit,
            ) ??
            1.0);

    fillStyle = PaintingFillStyle(
      colorArgb: fillColorArgb,
      shaderId: fillShaderId,
      opacity: finalFillOpacity,
      isExplicit: isFillExplicit,
      isCurrentColor: isCurrentColor,
    );
  }

  final SvgColor? strokePaint = cssStroke ?? strokeAttributes?.color ?? context.inheritedStroke;
  final bool hasStroke = strokePaint != null && strokePaint is! SvgNoneColor;
  PaintingStrokeStyle? strokeStyle;
  if (hasStroke) {
    int? strokeColorArgb;
    String? strokeShaderId;
    final bool isCurrentColor = strokePaint is SvgCurrentColor;

    if (strokePaint is SvgPaintReference) {
      strokeShaderId = strokePaint.id;
    } else if (isCurrentColor) {
      // CurrentColor doesn't have a static ARGB value
    } else {
      strokeColorArgb = strokePaint.toStrokeArgb();
    }

    final SvgLengthPercentage? sw =
        cssStrokeWidth ?? strokeAttributes?.width ?? context.inheritedStrokeWidth;
    final double finalStrokeWidth = context.scaleNormalized(
      sw?.resolve(context, SvgOrientation.normalized) ?? 1.0,
    );

    final SvgPointList? sda =
        cssStrokeDasharray ?? strokeAttributes?.dashArray ?? context.inheritedStrokeDasharray;
    List<double>? finalDashArray;
    if (sda == null || sda.points.isEmpty) {
      // No dash array
    } else {
      finalDashArray = sda.points.map((double d) => context.scaleNormalized(d)).toList();
    }

    final double? finalPathLength = (cssPathLength ?? pathLength)?.value;

    final SvgStrokeLinecap resolvedCap =
        cssStrokeLinecap ??
        strokeAttributes?.linecap ??
        context.inheritedStrokeLinecap ??
        SvgStrokeLinecap.butt;

    final SvgStrokeLinejoin resolvedJoin =
        cssStrokeLinejoin ??
        strokeAttributes?.linejoin ??
        context.inheritedStrokeLinejoin ??
        SvgStrokeLinejoin.miter;

    final double finalStrokeOpacity =
        elementOpacity *
        ((cssStrokeOpacity ?? strokeAttributes?.opacity ?? context.inheritedStrokeOpacity)?.resolve(
              context,
              SvgOrientation.unit,
            ) ??
            1.0);

    strokeStyle = PaintingStrokeStyle(
      colorArgb: strokeColorArgb,
      shaderId: strokeShaderId,
      width: finalStrokeWidth,
      pathLength: finalPathLength,
      opacity: finalStrokeOpacity,
      cap: resolvedCap.toStrokeCap(),
      join: resolvedJoin.toStrokeJoin(),
      dashArray: finalDashArray,
      isExplicit: isStrokeExplicit,
      isCurrentColor: isCurrentColor,
    );
  }

  final double? rawFontSize = (cssFontSize ?? fontAttributes?.size ?? context.inheritedFontSize)
      ?.resolve(context, SvgOrientation.vertical);
  final double? finalFontSize = rawFontSize == null ? null : context.scaleVertical(rawFontSize);

  final String? finalFontWeight =
      cssFontWeight ?? fontAttributes?.weight ?? context.inheritedFontWeight;
  final String? finalFontStyle =
      cssFontStyle ?? fontAttributes?.style ?? context.inheritedFontStyle;
  final String? rawFontFamily =
      cssFontFamily ?? fontAttributes?.family ?? context.inheritedFontFamily;

  // Map generic font families to bundled font files for Flutter rendering.
  final String? finalFontFamily = switch (rawFontFamily) {
    'sans-serif' => 'Roboto',
    'serif' => 'Noto Serif',
    'monospace' => 'Roboto Mono',
    _ => rawFontFamily,
  };

  final PaintingTextStyle textStyle = PaintingTextStyle(
    fontSize: finalFontSize,
    fontWeight: finalFontWeight,
    fontStyle: finalFontStyle,
    fontFamily: finalFontFamily,
  );

  return PaintingStyle(
    fill: fillStyle,
    stroke: strokeStyle,
    text: textStyle,
    groupOpacity: elementOpacity,
  );
}

extension on SvgStrokeLinecap {
  PaintingStrokeCap toStrokeCap() {
    return switch (this) {
      SvgStrokeLinecap.butt => PaintingStrokeCap.butt,
      SvgStrokeLinecap.round => PaintingStrokeCap.round,
      SvgStrokeLinecap.square => PaintingStrokeCap.square,
    };
  }
}

extension on SvgStrokeLinejoin {
  PaintingStrokeJoin toStrokeJoin() {
    return switch (this) {
      SvgStrokeLinejoin.miter => PaintingStrokeJoin.miter,
      SvgStrokeLinejoin.round => PaintingStrokeJoin.round,
      SvgStrokeLinejoin.bevel => PaintingStrokeJoin.bevel,
      SvgStrokeLinejoin.miterClip => PaintingStrokeJoin.miter,
      SvgStrokeLinejoin.arcs => PaintingStrokeJoin.miter,
    };
  }
}
