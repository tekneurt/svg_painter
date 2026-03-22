import '../../base/_base.dart';
import '../../painting_model/_painting_model.dart';
import '../../svg_model/_svg_model.dart';
import '../../xml_conversion/_xml_conversion.dart';
import '../../xml_conversion/parsers/svg_transform_parser.dart';
import '../svg_value_extensions/_svg_value_extensions.dart';
import 'svg_painting_context.dart';

/// Resolves the final [PaintingStyle] for an element, handling CSS classes,
/// inline styles, inheritance, and scaling.
PaintingStyle resolvePaint(
  SvgPaintingContext context, {
  required String tagName,
  SvgCoreAttributes? coreAttributes,
  SvgPresentationAttributes? presentationAttributes,
  SvgGeometryAttributes? geometryAttributes,
  PaintingRect? clipRect,
}) {
  // 1. Resolve CSS properties
  final resolvedRules = <String, String>{};

  // Priority: Tag selector < Class selector < ID selector < Inline style

  // a. Tag selector rules
  final Map<String, String>? tagRules = context.styleSheet.rules[tagName];
  if (tagRules != null) {
    resolvedRules.addAll(tagRules);
  }

  // b. Class selector rules
  final String? cssClass = coreAttributes?.cssClass;
  if (cssClass != null) {
    final List<String> classes = cssClass.split(RegExp(r'\s+'));
    for (final className in classes) {
      final Map<String, String>? rules = context.styleSheet.rules[className];
      if (rules != null) {
        resolvedRules.addAll(rules);
      }
    }
  }

  // c. ID selector rules
  final String? id = coreAttributes?.id;
  if (id != null) {
    final Map<String, String>? rules = context.styleSheet.rules['#$id'];
    if (rules != null) {
      resolvedRules.addAll(rules);
    }
  }

  // d. Inline style (overrides everything else)
  final String? inlineStyle = coreAttributes?.inlineStyle;
  if (inlineStyle != null) {
    final List<String> declarations = inlineStyle.split(';');
    for (final decl in declarations) {
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
    // Handle font shorthand
    final List<String> allParts = fontValue.split(RegExp(r'\s+'));
    var sizeIndex = -1;
    for (var i = 0; i < allParts.length; i++) {
      if (allParts[i].contains(RegExp(r'\d'))) {
        sizeIndex = i;
        break;
      }
    }

    if (sizeIndex != -1) {
      for (var i = 0; i < sizeIndex; i++) {
        final String part = allParts[i];
        if (part == 'italic') {
          cssFontStyle = SvgFontStyle.italic;
        } else if (part == 'bold' || part == 'heavy') {
          cssFontWeight = const SvgFontWeightBold();
        }
      }

      final String sizePart = allParts[sizeIndex].split('/')[0];
      cssFontSize = sizePart.toSvgLengthPercentage();

      if (sizeIndex + 1 < allParts.length) {
        final String familyPart = allParts.sublist(sizeIndex + 1).join(' ');
        final String firstFamily = familyPart
            .split(',')[0]
            .trim()
            .replaceAll(RegExp(r'["' ']'), '');
        cssFontFamily = firstFamily.toSvgFontFamily();
      }
    }

    // Individual font overrides
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

  final SvgTransformAttributes? cssTransform = SvgTransformParser.parse(resolvedRules['transform']);

  // 4. Create CSS presentation attributes set
  final cssPresentation = SvgPresentationAttributes(
    fill: SvgFillAttributes(color: cssFill, opacity: cssFillOpacity),
    stroke: SvgStrokeAttributes(
      color: cssStroke,
      opacity: cssStrokeOpacity,
      width: cssStrokeWidth,
      dashArray: cssStrokeDasharray,
      linecap: cssStrokeLinecap,
      linejoin: cssStrokeLinejoin,
    ),
    font: SvgFontAttributes(
      size: cssFontSize,
      weight: cssFontWeight,
      style: cssFontStyle,
      family: cssFontFamily,
    ),
    graphics: (cssOpacity != null || cssTransform != null)
        ? SvgGraphicsAttributes(opacity: cssOpacity, transformAttributes: cssTransform)
        : null,
  );

  // 5. Merge attributes: Attribute < CSS < Inline Style
  // Note: For now we handle Inline Style via resolvedRules above, so we merge element attrs with CSS rules.
  // Actually, resolveRules already includes Inline Style at the highest priority.
  // So we merge: Element Attributes -> CSS rules (which already include Inline Style).
  final SvgPresentationAttributes combined = (presentationAttributes ?? const SvgPresentationAttributes()).merge(cssPresentation);

  // 6. Handle inheritance
  final SvgPresentationAttributes resolved = combined.inherit(context.inheritedAttributes);

  // 7. Extract final values for PaintingStyle
  final SvgGraphicsAttributes? graphics = resolved.graphics;
  final double elementOpacity = graphics?.opacity?.resolve(context, SvgOrientation.unit) ?? 1.0;

  final SvgFillAttributes? fillAttrs = resolved.fill;
  final SvgColor? fillPaint = fillAttrs?.color;
  final bool hasFill = switch (fillPaint) {
    null || SvgNoneColor() => false,
    _ => true,
  };

  PaintingFillStyle? fillStyle;
  if (hasFill) {
    int? fillColorArgb;
    String? fillShaderId;
    PaintingGradientUnits? shaderUnits;
    final isCurrentColor = fillPaint is SvgCurrentColor;

    if (fillPaint is SvgPaintReference) {
      fillShaderId = fillPaint.id;
      final SvgElement? def = context.definitions[fillShaderId];
      if (def is SvgGradient) {
        shaderUnits = switch (def.gradientUnits) {
          SvgGradientUnits.objectBoundingBox => PaintingGradientUnits.objectBoundingBox,
          SvgGradientUnits.userSpaceOnUse => PaintingGradientUnits.userSpaceOnUse,
        };
      }
    } else if (!isCurrentColor) {
      fillColorArgb = fillPaint.toFillArgb();
    }

    final double finalFillOpacity =
        elementOpacity * (fillAttrs?.opacity?.resolve(context, SvgOrientation.unit) ?? 1.0);

    fillStyle = PaintingFillStyle(
      colorArgb: fillColorArgb,
      shaderId: fillShaderId,
      shaderUnits: shaderUnits,
      opacity: finalFillOpacity,
      isExplicit: presentationAttributes?.fill?.color != null || cssFill != null,
      isCurrentColor: isCurrentColor,
    );
  }

  final SvgStrokeAttributes? strokeAttrs = resolved.stroke;
  final SvgColor? strokePaint = strokeAttrs?.color;
  final bool hasStroke = switch (strokePaint) {
    null || SvgNoneColor() => false,
    _ => true,
  };

  PaintingStrokeStyle? strokeStyle;
  if (hasStroke) {
    int? strokeColorArgb;
    String? strokeShaderId;
    PaintingGradientUnits? shaderUnits;
    final isCurrentColor = strokePaint is SvgCurrentColor;

    if (strokePaint is SvgPaintReference) {
      strokeShaderId = strokePaint.id;
      final SvgElement? def = context.definitions[strokeShaderId];
      if (def is SvgGradient) {
        shaderUnits = switch (def.gradientUnits) {
          SvgGradientUnits.objectBoundingBox => PaintingGradientUnits.objectBoundingBox,
          SvgGradientUnits.userSpaceOnUse => PaintingGradientUnits.userSpaceOnUse,
        };
      }
    } else if (!isCurrentColor) {
      strokeColorArgb = strokePaint.toStrokeArgb();
    }

    final double finalStrokeWidth = strokeAttrs?.width?.resolve(context, SvgOrientation.normalized) ?? 1.0;

    final SvgPointList? sda = strokeAttrs?.dashArray;
    List<double>? finalDashArray;
    if (sda != null && sda.points.isNotEmpty) {
      if (sda.points.length.isOdd) {
        finalDashArray = <double>[...sda.points, ...sda.points];
      } else {
        finalDashArray = sda.points;
      }
    }

    final double? finalPathLength = (cssPathLength ?? geometryAttributes?.pathLength)?.value;

    final double finalStrokeOpacity =
        elementOpacity * (strokeAttrs?.opacity?.resolve(context, SvgOrientation.unit) ?? 1.0);

    strokeStyle = PaintingStrokeStyle(
      colorArgb: strokeColorArgb,
      shaderId: strokeShaderId,
      shaderUnits: shaderUnits,
      width: finalStrokeWidth,
      pathLength: finalPathLength,
      opacity: finalStrokeOpacity,
      cap: (strokeAttrs?.linecap ?? SvgStrokeLinecap.butt).toStrokeCap(),
      join: (strokeAttrs?.linejoin ?? SvgStrokeLinejoin.miter).toStrokeJoin(),
      dashArray: finalDashArray,
      isExplicit: presentationAttributes?.stroke?.color != null || cssStroke != null,
      isCurrentColor: isCurrentColor,
    );
  }

  final SvgFontAttributes? fontAttrs = resolved.font;
  final double finalFontSize = (fontAttrs?.size ?? const SvgLength(12.0)).resolve(context, SvgOrientation.vertical);

  final PaintingFontWeight finalFontWeight = _toPaintingFontWeight(fontAttrs?.weight);
  final PaintingFontStyle finalFontStyle = (fontAttrs?.style?.value == 'italic') ? PaintingFontStyle.italic : PaintingFontStyle.normal;

  final String rawFontFamily = fontAttrs?.family?.value ?? 'sans-serif';
  final String finalFontFamily = switch (rawFontFamily) {
    'sans-serif' => 'Roboto',
    'serif' => 'Noto Serif',
    'monospace' => 'Roboto Mono',
    _ => rawFontFamily,
  };

  return PaintingStyle(
    fill: fillStyle,
    stroke: strokeStyle,
    text: PaintingTextStyle(
      fontSize: finalFontSize,
      fontWeight: finalFontWeight,
      fontStyle: finalFontStyle,
      fontFamily: finalFontFamily,
    ),
    groupOpacity: elementOpacity,
    transformAttributes: graphics?.transformAttributes,
    clipRect: clipRect,
  );
}

PaintingFontWeight _toPaintingFontWeight(SvgFontWeight? weight) {
  return switch (weight) {
    null || SvgFontWeightNormal() => PaintingFontWeight.normal,
    SvgFontWeightBold() || SvgFontWeightBolder() => PaintingFontWeight.bold,
    SvgFontWeightLighter() => PaintingFontWeight.normal,
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
      SvgStrokeLinejoin.miter || SvgStrokeLinejoin.miterClip || SvgStrokeLinejoin.arcs => PaintingStrokeJoin.miter,
      SvgStrokeLinejoin.round => PaintingStrokeJoin.round,
      SvgStrokeLinejoin.bevel => PaintingStrokeJoin.bevel,
    };
  }
}
