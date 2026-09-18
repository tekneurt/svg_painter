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
  final Map<String, String> resolvedRules = _resolveCssRules(
    context,
    tagName,
    coreAttributes,
  );
  final SvgPresentationAttributes cssPresentation = _parseCssPresentation(
    resolvedRules,
  );

  final SvgPresentationAttributes combined =
      (presentationAttributes ?? const SvgPresentationAttributes())
          .merge(cssPresentation);
  final SvgPresentationAttributes resolved =
      combined.inherit(context.inheritedAttributes);

  final SvgGraphicsAttributes? graphics = resolved.graphics;
  final double elementOpacity =
      (graphics?.opacity?.resolve(context, .unit) ?? 1.0).clamp(0.0, 1.0);

  final PaintingFillStyle? fillStyle = _resolveFillStyle(
    context,
    fillAttrs: resolved.fill,
    isExplicit:
        presentationAttributes?.fill?.color != null ||
        resolvedRules['fill'] != null,
    elementOpacity: elementOpacity,
    currentColor: resolved.color,
  );

  final PaintingStrokeStyle? strokeStyle = _resolveStrokeStyle(
    context,
    strokeAttrs: resolved.stroke,
    cssPathLength: resolvedRules['pathLength']?.toSvgNonNegativeNumber(),
    geometryAttributes: geometryAttributes,
    isExplicit:
        presentationAttributes?.stroke?.color != null ||
        resolvedRules['stroke'] != null,
    elementOpacity: elementOpacity,
    currentColor: resolved.color,
  );

  final PaintingTextStyle textStyle = _resolveTextStyle(context, resolved.font);

  return PaintingStyle(
    fill: fillStyle,
    stroke: strokeStyle,
    text: textStyle,
    groupOpacity: elementOpacity,
    transformAttributes: graphics?.transformAttributes,
    clipRect: clipRect,
    maskId: _extractUrlId(graphics?.mask),
    clipPathId: _extractUrlId(graphics?.clipPath),
    paintOrder: resolved.paintOrder ?? SvgPaintOrder.normal,
    vectorEffect: resolved.vectorEffect ?? SvgVectorEffect.none,
  );
}

Map<String, String> _resolveCssRules(
  SvgPaintingContext context,
  String tagName,
  SvgCoreAttributes? coreAttributes,
) {
  final resolvedRules = <String, String>{};

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
      if (trimmedDecl.isNotEmpty) {
        final int colonIndex = trimmedDecl.indexOf(':');
        if (colonIndex != -1) {
          final String name = trimmedDecl.substring(0, colonIndex).trim();
          final String value = trimmedDecl.substring(colonIndex + 1).trim();
          resolvedRules[name] = value;
        }
      }
    }
  }

  return resolvedRules;
}

SvgPresentationAttributes _parseCssPresentation(
  Map<String, String> resolvedRules,
) {
  SvgFontWeight? cssFontWeight;
  SvgFontStyle? cssFontStyle;
  SvgLengthPercentage? cssFontSize;
  SvgFontFamily? cssFontFamily;

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
        final String firstFamily = familyPart.split(',')[0].trim();
        final String cleanFamily = firstFamily.replaceAll(
          RegExp(r'''^['"]+|['"]+$'''),
          '',
        );
        cssFontFamily = cleanFamily.toSvgFontFamily();
      }
    }

    // Individual font overrides
    cssFontWeight =
        resolvedRules['font-weight']?.toSvgFontWeight() ?? cssFontWeight;
    cssFontStyle =
        resolvedRules['font-style']?.toSvgFontStyle() ?? cssFontStyle;
    cssFontSize =
        resolvedRules['font-size']?.toSvgLengthPercentage() ?? cssFontSize;
    cssFontFamily =
        resolvedRules['font-family']?.toSvgFontFamily() ?? cssFontFamily;
  }

  final SvgTextAnchor? cssTextAnchor =
      resolvedRules['text-anchor']?.toSvgTextAnchor();

  final SvgColor? cssFill = resolvedRules['fill']?.toSvgColor();
  final SvgLengthPercentage? cssFillOpacity =
      resolvedRules['fill-opacity']?.toSvgLengthPercentage();
  final SvgFillRule? cssFillRule =
      resolvedRules['fill-rule']?.toSvgFillRule();
  final SvgColor? cssStroke = resolvedRules['stroke']?.toSvgColor();
  final SvgLengthPercentage? cssStrokeOpacity =
      resolvedRules['stroke-opacity']?.toSvgLengthPercentage();
  final SvgLengthPercentage? cssStrokeWidth =
      resolvedRules['stroke-width']?.toSvgLengthPercentage();
  final SvgPointList? cssStrokeDasharray =
      resolvedRules['stroke-dasharray']?.toSvgPointList();
  final SvgLengthPercentage? cssStrokeDashoffset =
      resolvedRules['stroke-dashoffset']?.toSvgLengthPercentage();
  final SvgStrokeLinecap? cssStrokeLinecap =
      resolvedRules['stroke-linecap']?.toSvgStrokeLinecap();
  final SvgStrokeLinejoin? cssStrokeLinejoin =
      resolvedRules['stroke-linejoin']?.toSvgStrokeLinejoin();
  final SvgNumber? cssStrokeMiterlimit =
      resolvedRules['stroke-miterlimit']?.toSvgMiterLimit();
  final SvgLengthPercentage? cssOpacity =
      resolvedRules['opacity']?.toSvgLengthPercentage();
  final SvgTransformAttributes? cssTransform = SvgTransformParser.parse(
    resolvedRules['transform'],
  );
  final SvgPaintOrder? cssPaintOrder =
      resolvedRules['paint-order']?.toSvgPaintOrder();
  final SvgVectorEffect? cssVectorEffect =
      resolvedRules['vector-effect']?.toSvgVectorEffect();
  final SvgColor? cssColor = resolvedRules['color']?.toSvgColor();

  return SvgPresentationAttributes(
    color: cssColor,
    fill: SvgFillAttributes(
      color: cssFill,
      opacity: cssFillOpacity,
      rule: cssFillRule,
    ),
    stroke: SvgStrokeAttributes(
      color: cssStroke,
      opacity: cssStrokeOpacity,
      width: cssStrokeWidth,
      dashArray: cssStrokeDasharray,
      dashOffset: cssStrokeDashoffset,
      linecap: cssStrokeLinecap,
      linejoin: cssStrokeLinejoin,
      miterLimit: cssStrokeMiterlimit,
    ),
    font: SvgFontAttributes(
      size: cssFontSize,
      weight: cssFontWeight,
      style: cssFontStyle,
      family: cssFontFamily,
      anchor: cssTextAnchor,
    ),
    graphics:
        (cssOpacity != null ||
                cssTransform != null ||
                resolvedRules['mask'] != null ||
                resolvedRules['clip-path'] != null)
            ? SvgGraphicsAttributes(
              opacity: cssOpacity,
              transformAttributes: cssTransform,
              mask: resolvedRules['mask'],
              clipPath: resolvedRules['clip-path'],
            )
            : null,
    paintOrder: cssPaintOrder,
    vectorEffect: cssVectorEffect,
  );
}

PaintingFillStyle? _resolveFillStyle(
  SvgPaintingContext context, {
  required SvgFillAttributes? fillAttrs,
  required bool isExplicit,
  required double elementOpacity,
  required SvgColor? currentColor,
}) {
  final SvgColor? fillPaint = fillAttrs?.color;
  return switch (fillPaint) {
    null || SvgNoneColor() => null,
    _ => _buildFillStyle(
      context,
      fillPaint: fillPaint,
      fillAttrs: fillAttrs,
      isExplicit: isExplicit,
      elementOpacity: elementOpacity,
      currentColor: currentColor,
    ),
  };
}

PaintingFillStyle _buildFillStyle(
  SvgPaintingContext context, {
  required SvgColor fillPaint,
  required SvgFillAttributes? fillAttrs,
  required bool isExplicit,
  required double elementOpacity,
  required SvgColor? currentColor,
}) {
  int? fillColorArgb;
  String? fillShaderId;
  PaintingGradientUnits? shaderUnits;
  var isCurrentColor = false;

  if (fillPaint is SvgPaintReference) {
    fillShaderId = fillPaint.id;
    final SvgElement? def = context.definitions[fillShaderId];
    if (def is SvgGradient) {
      shaderUnits = switch (def.gradientUnits) {
        SvgGradientUnits.objectBoundingBox => .objectBoundingBox,
        SvgGradientUnits.userSpaceOnUse => .userSpaceOnUse,
      };
    }
  } else if (fillPaint is SvgCurrentColor) {
    if (currentColor != null && currentColor is! SvgCurrentColor) {
      fillColorArgb = currentColor.toFillArgb();
    } else {
      isCurrentColor = true;
    }
  } else {
    fillColorArgb = fillPaint.toFillArgb();
  }

  final double fillOpacity =
      (fillAttrs?.opacity?.resolve(context, .unit) ?? 1.0).clamp(0.0, 1.0);
  final double finalFillOpacity = (elementOpacity * fillOpacity).clamp(0.0, 1.0);

  return PaintingFillStyle(
    colorArgb: fillColorArgb,
    shaderId: fillShaderId,
    shaderUnits: shaderUnits,
    opacity: finalFillOpacity,
    isExplicit: isExplicit,
    isCurrentColor: isCurrentColor,
    fillRule: fillAttrs?.rule ?? .nonzero,
  );
}

PaintingStrokeStyle? _resolveStrokeStyle(
  SvgPaintingContext context, {
  required SvgStrokeAttributes? strokeAttrs,
  required SvgNumber? cssPathLength,
  required SvgGeometryAttributes? geometryAttributes,
  required bool isExplicit,
  required double elementOpacity,
  required SvgColor? currentColor,
}) {
  final SvgColor? strokePaint = strokeAttrs?.color;
  return switch (strokePaint) {
    null || SvgNoneColor() => null,
    _ => _buildStrokeStyle(
      context,
      strokePaint: strokePaint,
      strokeAttrs: strokeAttrs,
      cssPathLength: cssPathLength,
      geometryAttributes: geometryAttributes,
      isExplicit: isExplicit,
      elementOpacity: elementOpacity,
      currentColor: currentColor,
    ),
  };
}

PaintingStrokeStyle _buildStrokeStyle(
  SvgPaintingContext context, {
  required SvgColor strokePaint,
  required SvgStrokeAttributes? strokeAttrs,
  required SvgNumber? cssPathLength,
  required SvgGeometryAttributes? geometryAttributes,
  required bool isExplicit,
  required double elementOpacity,
  required SvgColor? currentColor,
}) {
  int? strokeColorArgb;
  String? strokeShaderId;
  PaintingGradientUnits? shaderUnits;
  var isCurrentColor = false;

  if (strokePaint is SvgPaintReference) {
    strokeShaderId = strokePaint.id;
    final SvgElement? def = context.definitions[strokeShaderId];
    if (def is SvgGradient) {
      shaderUnits = switch (def.gradientUnits) {
        SvgGradientUnits.objectBoundingBox => .objectBoundingBox,
        SvgGradientUnits.userSpaceOnUse => .userSpaceOnUse,
      };
    }
  } else if (strokePaint is SvgCurrentColor) {
    if (currentColor != null && currentColor is! SvgCurrentColor) {
      strokeColorArgb = currentColor.toStrokeArgb();
    } else {
      isCurrentColor = true;
    }
  } else {
    strokeColorArgb = strokePaint.toStrokeArgb();
  }

  final double finalStrokeWidth =
      strokeAttrs?.width?.resolve(context, .normalized) ?? 1.0;

  final SvgPointList? sda = strokeAttrs?.dashArray;
  List<double>? finalDashArray;
  if (sda != null && sda.points.isNotEmpty) {
    if (sda.points.length.isOdd) {
      finalDashArray = <double>[...sda.points, ...sda.points];
    } else {
      finalDashArray = sda.points;
    }
  }

  final double? finalPathLength =
      (cssPathLength ?? geometryAttributes?.pathLength)?.value;

  final double? finalDashOffset =
      strokeAttrs?.dashOffset?.resolve(context, .normalized);

  final double strokeOpacity =
      (strokeAttrs?.opacity?.resolve(context, .unit) ?? 1.0).clamp(0.0, 1.0);
  final double finalStrokeOpacity = (elementOpacity * strokeOpacity).clamp(0.0, 1.0);

  return PaintingStrokeStyle(
    colorArgb: strokeColorArgb,
    shaderId: strokeShaderId,
    shaderUnits: shaderUnits,
    width: finalStrokeWidth,
    pathLength: finalPathLength,
    opacity: finalStrokeOpacity,
    cap: (strokeAttrs?.linecap ?? .butt).toStrokeCap(),
    join: (strokeAttrs?.linejoin ?? .miter).toStrokeJoin(),
    miterLimit: (strokeAttrs?.miterLimit ?? const SvgGenericNumber(4.0)).value,
    dashArray: finalDashArray,
    dashOffset: finalDashOffset,
    isExplicit: isExplicit,
    isCurrentColor: isCurrentColor,
  );
}

PaintingTextStyle _resolveTextStyle(
  SvgPaintingContext context,
  SvgFontAttributes? fontAttrs,
) {
  final double finalFontSize = (fontAttrs?.size ?? const SvgLength(12.0))
      .resolve(context, .vertical);

  final PaintingFontWeight finalFontWeight = _toPaintingFontWeight(
    fontAttrs?.weight,
  );
  final PaintingFontStyle finalFontStyle =
      (fontAttrs?.style?.value == 'italic') ? .italic : .normal;

  final String rawFontFamily = fontAttrs?.family?.value ?? 'sans-serif';
  final (String finalFontFamily, String? fontPackage) = switch (rawFontFamily) {
    'sans-serif' || 'Roboto' => ('Roboto', 'svg_painter'),
    'serif' || 'Noto Serif' => ('Noto Serif', 'svg_painter'),
    'monospace' || 'Roboto Mono' => ('Roboto Mono', 'svg_painter'),
    _ => (rawFontFamily, null),
  };

  final PaintingTextAnchor finalAnchor = switch (fontAttrs?.anchor) {
    SvgTextAnchor.start || null => .start,
    SvgTextAnchor.middle => .middle,
    SvgTextAnchor.end => .end,
  };

  return PaintingTextStyle(
    fontSize: finalFontSize,
    fontWeight: finalFontWeight,
    fontStyle: finalFontStyle,
    fontFamily: finalFontFamily,
    textAnchor: finalAnchor,
    fontPackage: fontPackage,
  );
}

String? _extractUrlId(String? attributeValue) {
  if (attributeValue != null &&
      attributeValue.startsWith('url(#') &&
      attributeValue.endsWith(')')) {
    return attributeValue.substring(5, attributeValue.length - 1);
  } else {
    return null;
  }
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
      SvgStrokeLinejoin.miter ||
      SvgStrokeLinejoin.miterClip ||
      SvgStrokeLinejoin.arcs => PaintingStrokeJoin.miter,
      SvgStrokeLinejoin.round => PaintingStrokeJoin.round,
      SvgStrokeLinejoin.bevel => PaintingStrokeJoin.bevel,
    };
  }
}
