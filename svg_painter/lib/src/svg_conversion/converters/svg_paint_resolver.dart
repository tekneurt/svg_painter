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

  final SvgStrokeLinecap resolvedCap = cssStrokeLinecap ??
      strokeLinecap ??
      context.inheritedStrokeLinecap ??
      SvgStrokeLinecap.butt;

  final SvgStrokeLinejoin resolvedJoin = cssStrokeLinejoin ??
      strokeLinejoin ??
      context.inheritedStrokeLinejoin ??
      SvgStrokeLinejoin.miter;

  final double elementOpacity =
      (cssOpacity ?? opacity)?.toDouble(context, SvgOrientation.normalized) ??
      context.inheritedOpacity?.toDouble(context, SvgOrientation.normalized) ??
      1.0;

  return PaintingStyle(
    fillColorArgb: fillColorArgb,
    fillShaderId: fillShaderId,
    strokeColorArgb: strokeColorArgb,
    strokeShaderId: strokeShaderId,
    strokeWidth: finalStrokeWidth,
    strokeCap: resolvedCap.toStrokeCap(),
    strokeJoin: resolvedJoin.toStrokeJoin(),
    opacity: elementOpacity,
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
