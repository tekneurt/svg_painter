import '../../painting_model/_painting_model.dart';
import '../../svg_model/_svg_model.dart';
import '../../xml_conversion/_xml_conversion.dart';
import '../svg_value_extensions/_svg_value_extensions.dart';
import 'svg_painting_context.dart';

/// Resolves the fill, stroke, and stroke-width for an element, handling CSS classes, inline styles, inheritance and scaling.
PaintingStyle resolvePaint(
  SvgPaintingContext context, {
  SvgColor? fill,
  SvgColor? stroke,
  SvgLengthPercentage? strokeWidth,
  SvgStrokeLinecap? strokeLinecap,
  SvgStrokeLinejoin? strokeLinejoin,
  SvgLengthPercentage? opacity,
  SvgLengthPercentage? fontSize,
  String? fontWeight,
  String? fontStyle,
  String? fontFamily,
  String? cssClass,
  String? inlineStyle,
}) {
  // 1. Resolve CSS properties from classes
  final Map<String, String> resolvedRules = <String, String>{};

  if (cssClass != null) {
    final List<String> classes = cssClass.split(RegExp(r'\s+'));
    for (final String className in classes) {
      final Map<String, String>? rules = context.styleSheet.rules[className];
      if (rules != null) {
        resolvedRules.addAll(rules);
      }
    }
  }

  // 2. Resolve properties from inline style (overrides classes)
  if (inlineStyle != null) {
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
  SvgColor? cssStroke;
  SvgLengthPercentage? cssStrokeWidth;
  SvgStrokeLinecap? cssStrokeLinecap;
  SvgStrokeLinejoin? cssStrokeLinejoin;
  SvgLengthPercentage? cssOpacity;
  String? cssFontWeight;
  String? cssFontStyle;
  SvgLengthPercentage? cssFontSize;
  String? cssFontFamily;

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
  if (resolvedRules.containsKey('stroke')) {
    cssStroke = resolvedRules['stroke']!.toSvgColor();
  }
  if (resolvedRules.containsKey('stroke-width')) {
    cssStrokeWidth = resolvedRules['stroke-width']!.toSvgLengthPercentage();
  }
  if (resolvedRules.containsKey('stroke-linecap')) {
    cssStrokeLinecap = SvgStrokeLinecap.from(resolvedRules['stroke-linecap']!);
  }
  if (resolvedRules.containsKey('stroke-linejoin')) {
    cssStrokeLinejoin = SvgStrokeLinejoin.from(resolvedRules['stroke-linejoin']!);
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

  // 4. Resolve final values using priority: Inline Style/CSS > Presentation Attribute > Inherited
  final SvgColor? fillPaint = cssFill ?? fill ?? context.inheritedFill;
  int? fillColorArgb;
  String? fillShaderId;
  if (fillPaint is SvgPaintReference) {
    fillShaderId = fillPaint.id;
  } else {
    fillColorArgb = fillPaint.toFillArgb();
  }

  final SvgColor? strokePaint = cssStroke ?? stroke ?? context.inheritedStroke;
  int? strokeColorArgb;
  String? strokeShaderId;
  if (strokePaint is SvgPaintReference) {
    strokeShaderId = strokePaint.id;
  } else {
    strokeColorArgb = strokePaint.toStrokeArgb();
  }

  final SvgLengthPercentage? sw = cssStrokeWidth ?? strokeWidth ?? context.inheritedStrokeWidth;
  final double finalStrokeWidth = context.scaleNormalized(
    sw?.toDouble(context, SvgOrientation.normalized) ?? 1.0,
  );

  final SvgStrokeLinecap resolvedCap =
      cssStrokeLinecap ?? strokeLinecap ?? context.inheritedStrokeLinecap ?? SvgStrokeLinecap.butt;

  final SvgStrokeLinejoin resolvedJoin =
      cssStrokeLinejoin ??
      strokeLinejoin ??
      context.inheritedStrokeLinejoin ??
      SvgStrokeLinejoin.miter;

  final double elementOpacity =
      (cssOpacity ?? opacity)?.toDouble(context, SvgOrientation.normalized) ??
      context.inheritedOpacity?.toDouble(context, SvgOrientation.normalized) ??
      1.0;

  final double? rawFontSize = (cssFontSize ?? fontSize ?? context.inheritedFontSize)?.toDouble(
    context,
    SvgOrientation.vertical,
  );
  final double? finalFontSize = rawFontSize != null ? context.scaleVertical(rawFontSize) : null;

  final String? finalFontWeight = cssFontWeight ?? fontWeight ?? context.inheritedFontWeight;
  final String? finalFontStyle = cssFontStyle ?? fontStyle ?? context.inheritedFontStyle;
  final String? rawFontFamily = cssFontFamily ?? fontFamily ?? context.inheritedFontFamily;

  // Map generic font families to bundled font files for Flutter rendering.
  final String? finalFontFamily = switch (rawFontFamily) {
    'sans-serif' => 'Roboto',
    'serif' => 'Noto Serif',
    'monospace' => 'Roboto Mono',
    _ => rawFontFamily,
  };

  return PaintingStyle(
    fillColorArgb: fillColorArgb,
    fillShaderId: fillShaderId,
    strokeColorArgb: strokeColorArgb,
    strokeShaderId: strokeShaderId,
    strokeWidth: finalStrokeWidth,
    strokeCap: resolvedCap.toStrokeCap(),
    strokeJoin: resolvedJoin.toStrokeJoin(),
    opacity: elementOpacity,
    fontSize: finalFontSize,
    fontWeight: finalFontWeight,
    fontStyle: finalFontStyle,
    fontFamily: finalFontFamily,
  );
}

extension on SvgStrokeLinecap {
  StrokeCap toStrokeCap() {
    return switch (this) {
      SvgStrokeLinecap.butt => StrokeCap.butt,
      SvgStrokeLinecap.round => StrokeCap.round,
      SvgStrokeLinecap.square => StrokeCap.square,
    };
  }
}

extension on SvgStrokeLinejoin {
  StrokeJoin toStrokeJoin() {
    return switch (this) {
      SvgStrokeLinejoin.miter => StrokeJoin.miter,
      SvgStrokeLinejoin.round => StrokeJoin.round,
      SvgStrokeLinejoin.bevel => StrokeJoin.bevel,
      SvgStrokeLinejoin.miterClip => StrokeJoin.miter,
      SvgStrokeLinejoin.arcs => StrokeJoin.miter,
    };
  }
}
