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
  SvgTransformAttributes? transformAttributes,
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
      final Map<String, String>? rules = context.styleSheet.rules[className];
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
  SvgFontWeight? cssFontWeight;
  SvgFontStyle? cssFontStyle;
  SvgLengthPercentage? cssFontSize;
  SvgFontFamily? cssFontFamily;
  SvgNumber? cssPathLength;

  final String? fontValue = resolvedRules['font'];
  if (fontValue == null) {
    cssFontWeight = resolvedRules['font-weight']?.toSvgFontWeight();
    cssFontStyle = resolvedRules['font-style']?.toSvgFontStyle();
    cssFontSize = resolvedRules['font-size']?.toSvgLengthPercentage();
    cssFontFamily = resolvedRules['font-family']?.toSvgFontFamily();
  } else {
    // 1. Handle font-family (everything after the last size-like token)
    // Find the index of the first token that looks like a size (contains a digit)
    final List<String> allParts = fontValue.split(RegExp(r'\s+'));
    int sizeIndex = -1;
    for (int i = 0; i < allParts.length; i++) {
      if (allParts[i].contains(RegExp(r'\d'))) {
        sizeIndex = i;
        break;
      }
    }

    if (sizeIndex != -1) {
      // Parts before size are style/weight
      for (int i = 0; i < sizeIndex; i++) {
        final String part = allParts[i];
        if (part == 'italic') {
          cssFontStyle = SvgFontStyle.italic;
        } else if (part == 'bold' || part == 'heavy') {
          cssFontWeight = const SvgFontWeightBold();
        }
      }

      // The size part (may contain /line-height)
      final String sizePart = allParts[sizeIndex].split('/')[0];
      cssFontSize = sizePart.toSvgLengthPercentage();

      // Everything after size is font-family
      if (sizeIndex + 1 < allParts.length) {
        final String familyPart = allParts.sublist(sizeIndex + 1).join(' ');
        // Clean up quotes and take the first family if multiple are provided
        final String firstFamily = familyPart
            .split(',')[0]
            .trim()
            .replaceAll(
              RegExp(
                r'["'
                ']',
              ),
              '',
            );
        cssFontFamily = firstFamily.toSvgFontFamily();
      }
    }

    // Individual font overrides (shorthand has lower priority than individual props in same scope)
    cssFontWeight = resolvedRules['font-weight']?.toSvgFontWeight() ?? cssFontWeight;
    cssFontStyle = resolvedRules['font-style']?.toSvgFontStyle() ?? cssFontStyle;
    cssFontSize = resolvedRules['font-size']?.toSvgLengthPercentage() ?? cssFontSize;
    cssFontFamily = resolvedRules['font-family']?.toSvgFontFamily() ?? cssFontFamily;
  }

  cssFill = resolvedRules['fill']?.toSvgColor();
  cssFillOpacity = resolvedRules['fill-opacity']?.toSvgLengthPercentage();
  cssStroke = resolvedRules['stroke']?.toSvgColor();
  cssStrokeOpacity = resolvedRules['stroke-opacity']?.toSvgLengthPercentage();
  cssStrokeWidth = resolvedRules['stroke-width']?.toSvgLengthPercentage();
  cssStrokeDasharray = resolvedRules['stroke-dasharray']?.toSvgPointList();
  cssStrokeLinecap = resolvedRules['stroke-linecap']?.toSvgStrokeLinecap();
  cssStrokeLinejoin = resolvedRules['stroke-linejoin']?.toSvgStrokeLinejoin();
  cssOpacity = resolvedRules['opacity']?.toSvgLengthPercentage();
  cssPathLength = resolvedRules['pathLength']?.toSvgNonNegativeNumber();

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

  // 4. Resolve element opacity (object opacity)
  // NOTE: We no longer multiply by context.parentOpacity here.
  // Group opacity is handled via saveLayer in the generator.
  final double elementOpacity = (cssOpacity ?? opacity)?.resolve(context, SvgOrientation.unit) ?? 1.0;

  // 5. Resolve final values using priority: Inline Style/CSS > Presentation Attribute > Inherited
  final SvgColor? fillPaint = cssFill ?? fillAttributes?.color ?? context.inheritedFill;

  final bool hasFill = switch (fillPaint) {
    null || SvgNoneColor() => false,
    _ => true,
  };

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
  final bool hasStroke = switch (strokePaint) {
    null || SvgNoneColor() => false,
    _ => true,
  };

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
    // Resolve width in user space (don't scale by parentSx/Sy, the canvas transform handles that)
    final double finalStrokeWidth = sw?.resolve(context, SvgOrientation.normalized) ?? 1.0;

    final SvgPointList? sda =
        cssStrokeDasharray ?? strokeAttributes?.dashArray ?? context.inheritedStrokeDasharray;
    List<double>? finalDashArray;
    if (sda == null || sda.points.isEmpty) {
      // No dash array
    } else {
      // SVG Spec: If an odd number of values is provided, the list is duplicated to create an even number.
      if (sda.points.length.isOdd) {
        finalDashArray = <double>[...sda.points, ...sda.points];
      } else {
        finalDashArray = sda.points;
      }
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

  final double finalFontSize =
      (cssFontSize ?? fontAttributes?.size ?? context.inheritedFontSize ?? const SvgLength(12.0))
          .resolve(context, SvgOrientation.vertical);

  final SvgFontWeight weight =
      cssFontWeight ??
      fontAttributes?.weight ??
      context.inheritedFontWeight ??
      const SvgFontWeightNormal();
  final PaintingFontWeight finalFontWeight = switch (weight) {
    SvgFontWeightNormal() => PaintingFontWeight.normal,
    SvgFontWeightBold() => PaintingFontWeight.bold,
    SvgFontWeightBolder() => PaintingFontWeight.bold, // Best effort
    SvgFontWeightLighter() => PaintingFontWeight.normal, // Best effort
    SvgFontWeightNumeric(value: final double v) => switch (v) {
      <= 100 => PaintingFontWeight.w100,
      <= 200 => PaintingFontWeight.w200,
      <= 300 => PaintingFontWeight.w300,
      <= 400 => PaintingFontWeight.w400,
      <= 500 => PaintingFontWeight.w500,
      <= 600 => PaintingFontWeight.w600,
      <= 700 => PaintingFontWeight.w700,
      <= 800 => PaintingFontWeight.w800,
      _ => PaintingFontWeight.w900,
    },
  };

  final SvgFontStyle style =
      cssFontStyle ?? fontAttributes?.style ?? context.inheritedFontStyle ?? SvgFontStyle.normal;
  final PaintingFontStyle finalFontStyle = switch (style.value) {
    'italic' => PaintingFontStyle.italic,
    _ => PaintingFontStyle.normal,
  };

  final SvgFontFamily family =
      cssFontFamily ??
      fontAttributes?.family ??
      context.inheritedFontFamily ??
      const SvgFontFamily('sans-serif');
  final String rawFontFamily = family.value;

  // Map generic font families to bundled font files for Flutter rendering.
  final String finalFontFamily = switch (rawFontFamily) {
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
    transformAttributes: transformAttributes,
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
