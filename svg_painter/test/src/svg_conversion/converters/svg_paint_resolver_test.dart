import 'package:svg_painter/src/painting_model/_painting_model.dart';
import 'package:svg_painter/src/svg_conversion/converters/svg_paint_resolver.dart';
import 'package:svg_painter/src/svg_conversion/converters/svg_painting_context.dart';
import 'package:svg_painter/src/svg_model/_svg_model.dart';
import 'package:test/test.dart';

void main() {
  group('resolvePaint', () {
    const SvgPaintingContext emptyContext = SvgPaintingContext(
      viewBoxWidth: 100,
      viewBoxHeight: 100,
    );

    test('should resolve inline style with highest priority', () {
      final PaintingStyle style = resolvePaint(
        emptyContext,
        fillAttributes: const SvgFillAttributes(color: SvgRgbColor(255, 0, 0, 0)),
        inlineStyle: 'fill: #FF0000',
      );

      expect(style.fill?.colorArgb, 0xFFFF0000);
      expect(style.fill?.isExplicit, isTrue);
    });

    test('should identify currentColor', () {
      final PaintingStyle style = resolvePaint(
        emptyContext,
        fillAttributes: const SvgFillAttributes(color: SvgCurrentColor()),
      );

      expect(style.fill?.isCurrentColor, isTrue);
      expect(style.fill?.colorArgb, isNull);
    });

    test('should parse font shorthand', () {
      final PaintingStyle style = resolvePaint(emptyContext, inlineStyle: 'font: bold 16px serif');

      expect(style.text?.fontWeight, 'bold');
      // 16px relative to 100 viewbox height -> depends on logic, but parsing should happen
      expect(style.text?.fontSize, isNotNull);
      expect(style.text?.fontFamily, 'Noto Serif'); // Mapped from 'serif'
    });

    test('should handle robust font shorthand parsing', () {
      final PaintingStyle style = resolvePaint(
        emptyContext,
        inlineStyle: 'font: italic bold 14px/1.2 "Open Sans", sans-serif',
      );

      expect(style.text?.fontStyle, 'italic');
      expect(style.text?.fontWeight, 'bold');
      expect(style.text?.fontSize, 14.0);
      expect(style.text?.fontFamily, 'Open Sans');
    });

    test('should respect CSS specificity (ID > Class > Tag)', () {
      // Need a context with a stylesheet
      const SvgStyleSheet sheet = SvgStyleSheet(<String, Map<String, String>>{
        'rect': <String, String>{'fill': 'blue'}, // Tag
        '.myClass': <String, String>{'fill': 'green'}, // Class
        '#myId': <String, String>{'fill': 'red'}, // ID
      });

      const SvgPaintingContext context = SvgPaintingContext(
        viewBoxWidth: 100,
        viewBoxHeight: 100,
        styleSheet: sheet,
      );

      // 1. Tag only
      PaintingStyle style = resolvePaint(context, tagName: 'rect');
      expect(style.fill?.colorArgb, 0xFF0000FF); // Blue

      // 2. Tag + Class
      style = resolvePaint(context, tagName: 'rect', cssClass: 'myClass');
      expect(style.fill?.colorArgb, 0xFF008000); // Green

      // 3. Tag + Class + ID
      style = resolvePaint(context, tagName: 'rect', cssClass: 'myClass', id: 'myId');
      expect(style.fill?.colorArgb, 0xFFFF0000); // Red
    });

    test('should mark fill/stroke as explicit if from CSS', () {
      const SvgStyleSheet sheet = SvgStyleSheet(<String, Map<String, String>>{
        '.myClass': <String, String>{'fill': 'green'},
      });
      const SvgPaintingContext context = SvgPaintingContext(
        viewBoxWidth: 100,
        viewBoxHeight: 100,
        styleSheet: sheet,
      );

      final PaintingStyle style = resolvePaint(context, cssClass: 'myClass');
      expect(style.fill?.isExplicit, isTrue);
    });

    test('should resolve SvgPaintReference (url(#id)) correctly', () {
      final PaintingStyle style = resolvePaint(
        emptyContext,
        fillAttributes: const SvgFillAttributes(color: SvgPaintReference('gradient1')),
      );

      expect(style.fill?.shaderId, 'gradient1');
      expect(style.fill?.colorArgb, isNull);
    });

    test('should resolve inherited styles correctly', () {
      const SvgPaintingContext context = SvgPaintingContext(
        viewBoxWidth: 100,
        viewBoxHeight: 100,
        inheritedFill: SvgRgbColor(255, 0, 0, 255), // Blue
        inheritedFillOpacity: SvgPercentage(100),
        inheritedStroke: SvgRgbColor(255, 255, 0, 0), // Red
        inheritedStrokeWidth: SvgLength(5.0),
      );

      final PaintingStyle style = resolvePaint(context);

      expect(style.fill?.colorArgb, 0xFF0000FF);
      expect(style.stroke?.colorArgb, 0xFFFF0000);
      expect(style.stroke?.width, 5.0);
    });

    test('should handle missing or empty inline styles gracefully', () {
      final PaintingStyle style = resolvePaint(emptyContext, inlineStyle: '  ; fill: red ; ; ');
      expect(style.fill?.colorArgb, 0xFFFF0000);
    });

    test('should resolve complex CSS properties', () {
      final PaintingStyle style = resolvePaint(
        emptyContext,
        inlineStyle: '''
          fill-opacity: 0.5;
          stroke: blue;
          stroke-opacity: 0.8;
          stroke-width: 2px;
          stroke-linecap: round;
          stroke-linejoin: bevel;
          opacity: 0.9;
          font-style: italic;
          font-family: monospace;
          pathLength: 100;
        ''',
      );

      expect(style.fill?.opacity, closeTo(0.45, 0.001)); // fill-opacity(0.5) * opacity(0.9) = 0.45
      expect(style.stroke?.colorArgb, 0xFF0000FF);
      expect(style.stroke?.opacity, closeTo(0.8 * 0.9, 0.001)); // stroke-opacity * opacity(0.9)
      expect(style.stroke?.width, 2.0);
      expect(style.stroke?.cap, PaintingStrokeCap.round);
      expect(style.stroke?.join, PaintingStrokeJoin.bevel);
      expect(style.groupOpacity, closeTo(0.9, 0.001));
      expect(style.text?.fontStyle, 'italic');
      expect(style.text?.fontFamily, 'Roboto Mono');
      expect(style.stroke?.pathLength, 100.0);
    });

    test('should resolve stroke dasharray from CSS', () {
      final PaintingStyle style = resolvePaint(
        emptyContext,
        inlineStyle: 'stroke: black; stroke-dasharray: 5, 5',
      );

      expect(style.stroke?.dashArray, equals(<double>[5.0, 5.0]));
    });

    test('should combine parent opacity with element opacity', () {
      const SvgPaintingContext context = SvgPaintingContext(
        viewBoxWidth: 100,
        viewBoxHeight: 100,
        parentOpacity: 0.5,
      );

      final PaintingStyle style = resolvePaint(
        context,
        opacity: const SvgPercentage(50), // 0.5 * 0.5 = 0.25
      );

      expect(style.groupOpacity, closeTo(0.25, 0.001));
    });

    test('should resolve square linecap and miterClip/arcs linejoin', () {
      final PaintingStyle style = resolvePaint(
        emptyContext,
        inlineStyle: 'stroke: black; stroke-linecap: square; stroke-linejoin: miter-clip',
      );
      expect(style.stroke?.cap, PaintingStrokeCap.square);
      expect(style.stroke?.join, PaintingStrokeJoin.miter);

      final PaintingStyle style2 = resolvePaint(
        emptyContext,
        inlineStyle: 'stroke: black; stroke-linejoin: arcs',
      );
      expect(style2.stroke?.join, PaintingStrokeJoin.miter);
    });

    test('should resolve various font weights', () {
      expect(
        resolvePaint(emptyContext, inlineStyle: 'font-weight: bolder').text?.fontWeight,
        'bold',
      );
      expect(
        resolvePaint(emptyContext, inlineStyle: 'font-weight: lighter').text?.fontWeight,
        'lighter',
      );
      expect(
        resolvePaint(emptyContext, inlineStyle: 'font-weight: 500').text?.fontWeight,
        '500.0',
      );
    });

    test('should resolve stroke shader ID', () {
      final PaintingStyle style = resolvePaint(
        emptyContext,
        strokeAttributes: const SvgStrokeAttributes(color: SvgPaintReference('stroke-grad')),
      );
      expect(style.stroke?.shaderId, 'stroke-grad');
    });
  });
}
