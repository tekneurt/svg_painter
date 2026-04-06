import 'package:svg_painter/src/painting_model/_painting_model.dart';
import 'package:svg_painter/src/svg_conversion/converters/svg_paint_resolver.dart';
import 'package:svg_painter/src/svg_conversion/converters/svg_painting_context.dart';
import 'package:svg_painter/src/svg_model/_svg_model.dart';
import 'package:test/test.dart';

void main() {
  group('resolvePaint', () {
    const emptyContext = SvgPaintingContext(
      viewBoxWidth: 100,
      viewBoxHeight: 100,
    );

    test('should resolve inline style with highest priority', () {
      final PaintingStyle style = resolvePaint(
        emptyContext,
        tagName: 'g',
        presentationAttributes: const SvgPresentationAttributes(
          fill: SvgFillAttributes(color: SvgRgbColor(255, 0, 0, 0)),
        ),
        coreAttributes: const SvgCoreAttributes(inlineStyle: 'fill: #FF0000'),
      );

      expect(style.fill?.colorArgb, 0xFFFF0000);
      expect(style.fill?.isExplicit, isTrue);
    });

    test('should identify currentColor', () {
      final PaintingStyle style = resolvePaint(
        emptyContext,
        tagName: 'g',
        presentationAttributes: const SvgPresentationAttributes(
          fill: SvgFillAttributes(color: SvgCurrentColor()),
        ),
      );

      expect(style.fill?.isCurrentColor, isTrue);
      expect(style.fill?.colorArgb, isNull);
    });

    test('should parse font shorthand', () {
      final PaintingStyle style = resolvePaint(
        emptyContext,
        tagName: 'g',
        coreAttributes: const SvgCoreAttributes(inlineStyle: 'font: bold 16px serif'),
      );

      expect(style.text?.fontWeight, PaintingFontWeight.bold);
      // 16px relative to 100 viewbox height -> depends on logic, but parsing should happen
      expect(style.text?.fontSize, isNotNull);
      expect(style.text?.fontFamily, 'Noto Serif'); // Mapped from 'serif'
    });

    test('should handle robust font shorthand parsing', () {
      final PaintingStyle style = resolvePaint(
        emptyContext,
        tagName: 'g',
        coreAttributes: const SvgCoreAttributes(
          inlineStyle: 'font: italic bold 14px/1.2 "Open Sans", sans-serif',
        ),
      );

      expect(style.text?.fontStyle, PaintingFontStyle.italic);
      expect(style.text?.fontWeight, PaintingFontWeight.bold);
      expect(style.text?.fontSize, 14.0);
      expect(style.text?.fontFamily, 'Open Sans');
    });

    test('should respect CSS specificity (ID > Class > Tag)', () {
      // Need a context with a stylesheet
      const sheet = SvgStyleSheet(<String, Map<String, String>>{
        'rect': <String, String>{'fill': 'blue'}, // Tag
        'myClass': <String, String>{'fill': 'green'}, // Class
        '#myId': <String, String>{'fill': 'red'}, // ID
      });

      const context = SvgPaintingContext(
        viewBoxWidth: 100,
        viewBoxHeight: 100,
        styleSheet: sheet,
      );

      // 1. Tag only
      PaintingStyle style = resolvePaint(context, tagName: 'rect');
      expect(style.fill?.colorArgb, 0xFF0000FF); // Blue

      // 2. Tag + Class
      style = resolvePaint(
        context,
        tagName: 'rect',
        coreAttributes: const SvgCoreAttributes(cssClass: 'myClass'),
      );
      expect(style.fill?.colorArgb, 0xFF008000); // Green

      // 3. Tag + Class + ID
      style = resolvePaint(
        context,
        tagName: 'rect',
        coreAttributes: const SvgCoreAttributes(cssClass: 'myClass', id: 'myId'),
      );
      expect(style.fill?.colorArgb, 0xFFFF0000); // Red
    });

    test('should mark fill/stroke as explicit if from CSS', () {
      const sheet = SvgStyleSheet(<String, Map<String, String>>{
        'myClass': <String, String>{'fill': 'green'},
      });
      const context = SvgPaintingContext(
        viewBoxWidth: 100,
        viewBoxHeight: 100,
        styleSheet: sheet,
      );

      final PaintingStyle style = resolvePaint(
        context,
        tagName: 'g',
        coreAttributes: const SvgCoreAttributes(cssClass: 'myClass'),
      );
      expect(style.fill?.isExplicit, isTrue);
    });

    test('should resolve SvgPaintReference (url(#id)) correctly', () {
      final PaintingStyle style = resolvePaint(
        emptyContext,
        tagName: 'g',
        presentationAttributes: const SvgPresentationAttributes(
          fill: SvgFillAttributes(color: SvgPaintReference('gradient1')),
        ),
      );

      expect(style.fill?.shaderId, 'gradient1');
      expect(style.fill?.colorArgb, isNull);
    });

    test('should resolve inherited styles correctly', () {
      const context = SvgPaintingContext(
        viewBoxWidth: 100,
        viewBoxHeight: 100,
        inheritedAttributes: SvgPresentationAttributes(
          fill: SvgFillAttributes(
            color: SvgRgbColor(255, 0, 0, 255), // Blue
            opacity: SvgPercentage(100),
          ),
          stroke: SvgStrokeAttributes(
            color: SvgRgbColor(255, 255, 0, 0), // Red
            width: SvgLength(5.0),
          ),
        ),
      );

      final PaintingStyle style = resolvePaint(context, tagName: 'g');

      expect(style.fill?.colorArgb, 0xFF0000FF);
      expect(style.stroke?.colorArgb, 0xFFFF0000);
      expect(style.stroke?.width, 5.0);
    });

    test('should handle missing or empty inline styles gracefully', () {
      final PaintingStyle style = resolvePaint(
        emptyContext,
        tagName: 'g',
        coreAttributes: const SvgCoreAttributes(inlineStyle: '  ; fill: red ; ; '),
      );
      expect(style.fill?.colorArgb, 0xFFFF0000);
    });

    test('should handle malformed inline declarations (missing colon)', () {
      final PaintingStyle style = resolvePaint(
        emptyContext,
        tagName: 'g',
        coreAttributes: const SvgCoreAttributes(inlineStyle: 'fill: red; malformed; stroke: blue'),
      );
      expect(style.fill?.colorArgb, 0xFFFF0000);
      expect(style.stroke?.colorArgb, 0xFF0000FF);
    });

    test('should handle empty inline style segments', () {
      final PaintingStyle style = resolvePaint(
        emptyContext,
        tagName: 'g',
        coreAttributes: const SvgCoreAttributes(inlineStyle: '; ; fill: green; ;'),
      );
      expect(style.fill?.colorArgb, 0xFF008000);
    });

    test('should map monospace font family', () {
      final PaintingStyle style = resolvePaint(
        emptyContext,
        tagName: 'text',
        coreAttributes: const SvgCoreAttributes(inlineStyle: 'font-family: monospace'),
      );
      expect(style.text?.fontFamily, 'Roboto Mono');
    });

    test('should map intermediate SvgFontWeightNumeric values', () {
      final Map<SvgFontWeightNumeric, PaintingFontWeight> weights = {
        const SvgFontWeightNumeric(150): PaintingFontWeight.w200,
        const SvgFontWeightNumeric(450): PaintingFontWeight.w500,
        const SvgFontWeightNumeric(850): PaintingFontWeight.w900,
      };

      for (final MapEntry<SvgFontWeightNumeric, PaintingFontWeight> entry in weights.entries) {
        final PaintingStyle style = resolvePaint(
          emptyContext,
          tagName: 'text',
          presentationAttributes: SvgPresentationAttributes(
            font: SvgFontAttributes(weight: entry.key),
          ),
        );
        expect(style.text?.fontWeight, entry.value);
      }
    });

    test('should resolve complex CSS properties', () {
      final PaintingStyle style = resolvePaint(
        emptyContext,
        tagName: 'g',
        coreAttributes: const SvgCoreAttributes(
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
        ),
      );

      expect(style.fill?.opacity, closeTo(0.45, 0.001)); // fill-opacity(0.5) * opacity(0.9) = 0.45
      expect(style.stroke?.colorArgb, 0xFF0000FF);
      expect(style.stroke?.opacity, closeTo(0.8 * 0.9, 0.001)); // stroke-opacity * opacity(0.9)
      expect(style.stroke?.width, 2.0);
      expect(style.stroke?.cap, PaintingStrokeCap.round);
      expect(style.stroke?.join, PaintingStrokeJoin.bevel);
      expect(style.groupOpacity, closeTo(0.9, 0.001));
      expect(style.text?.fontStyle, PaintingFontStyle.italic);
      expect(style.text?.fontFamily, 'Roboto Mono');
      expect(style.stroke?.pathLength, 100.0);
    });

    test('should resolve stroke dasharray from CSS', () {
      final PaintingStyle style = resolvePaint(
        emptyContext,
        tagName: 'g',
        coreAttributes: const SvgCoreAttributes(inlineStyle: 'stroke: black; stroke-dasharray: 5, 5'),
      );

      expect(style.stroke?.dashArray, equals(<double>[5.0, 5.0]));
    });

    test('should resolve element opacity', () {
      const context = SvgPaintingContext(
        viewBoxWidth: 100,
        viewBoxHeight: 100,
      );

      final PaintingStyle style = resolvePaint(
        context,
        tagName: 'g',
        presentationAttributes: const SvgPresentationAttributes(
          graphics: SvgGraphicsAttributes(opacity: SvgPercentage(50)),
        ),
      );

      expect(style.groupOpacity, closeTo(0.5, 0.001));
    });

    test('should resolve square linecap and miterClip/arcs linejoin', () {
      final PaintingStyle style = resolvePaint(
        emptyContext,
        tagName: 'g',
        coreAttributes: const SvgCoreAttributes(
          inlineStyle: 'stroke: black; stroke-linecap: square; stroke-linejoin: miter-clip',
        ),
      );
      expect(style.stroke?.cap, PaintingStrokeCap.square);
      expect(style.stroke?.join, PaintingStrokeJoin.miter);

      final PaintingStyle style2 = resolvePaint(
        emptyContext,
        tagName: 'g',
        coreAttributes: const SvgCoreAttributes(inlineStyle: 'stroke: black; stroke-linejoin: arcs'),
      );
      expect(style2.stroke?.join, PaintingStrokeJoin.miter);
    });

    test('should resolve various font weights', () {
      expect(
        resolvePaint(
          emptyContext,
          tagName: 'g',
          coreAttributes: const SvgCoreAttributes(inlineStyle: 'font-weight: bolder'),
        ).text?.fontWeight,
        PaintingFontWeight.bold,
      );
      expect(
        resolvePaint(
          emptyContext,
          tagName: 'g',
          coreAttributes: const SvgCoreAttributes(inlineStyle: 'font-weight: lighter'),
        ).text?.fontWeight,
        PaintingFontWeight.normal,
      );
      expect(
        resolvePaint(
          emptyContext,
          tagName: 'g',
          coreAttributes: const SvgCoreAttributes(inlineStyle: 'font-weight: 100'),
        ).text?.fontWeight,
        PaintingFontWeight.w100,
      );
      expect(
        resolvePaint(
          emptyContext,
          tagName: 'g',
          coreAttributes: const SvgCoreAttributes(inlineStyle: 'font-weight: 200'),
        ).text?.fontWeight,
        PaintingFontWeight.w200,
      );
      expect(
        resolvePaint(
          emptyContext,
          tagName: 'g',
          coreAttributes: const SvgCoreAttributes(inlineStyle: 'font-weight: 300'),
        ).text?.fontWeight,
        PaintingFontWeight.w300,
      );
      expect(
        resolvePaint(
          emptyContext,
          tagName: 'g',
          coreAttributes: const SvgCoreAttributes(inlineStyle: 'font-weight: 400'),
        ).text?.fontWeight,
        PaintingFontWeight.w400,
      );
      expect(
        resolvePaint(
          emptyContext,
          tagName: 'g',
          coreAttributes: const SvgCoreAttributes(inlineStyle: 'font-weight: 500'),
        ).text?.fontWeight,
        PaintingFontWeight.w500,
      );
      expect(
        resolvePaint(
          emptyContext,
          tagName: 'g',
          coreAttributes: const SvgCoreAttributes(inlineStyle: 'font-weight: 600'),
        ).text?.fontWeight,
        PaintingFontWeight.w600,
      );
      expect(
        resolvePaint(
          emptyContext,
          tagName: 'g',
          coreAttributes: const SvgCoreAttributes(inlineStyle: 'font-weight: 700'),
        ).text?.fontWeight,
        PaintingFontWeight.w700,
      );
      expect(
        resolvePaint(
          emptyContext,
          tagName: 'g',
          coreAttributes: const SvgCoreAttributes(inlineStyle: 'font-weight: 800'),
        ).text?.fontWeight,
        PaintingFontWeight.w800,
      );
      expect(
        resolvePaint(
          emptyContext,
          tagName: 'g',
          coreAttributes: const SvgCoreAttributes(inlineStyle: 'font-weight: 900'),
        ).text?.fontWeight,
        PaintingFontWeight.w900,
      );
    });

    test('should duplicate dasharray if length is odd', () {
      final PaintingStyle style = resolvePaint(
        emptyContext,
        tagName: 'g',
        coreAttributes: const SvgCoreAttributes(inlineStyle: 'stroke: black; stroke-dasharray: 5'),
      );

      expect(style.stroke?.dashArray, equals(<double>[5.0, 5.0]));
    });

    test('should resolve stroke shader ID', () {
      final PaintingStyle style = resolvePaint(
        emptyContext,
        tagName: 'g',
        presentationAttributes: const SvgPresentationAttributes(
          stroke: SvgStrokeAttributes(color: SvgPaintReference('stroke-grad')),
        ),
      );
      expect(style.stroke?.shaderId, 'stroke-grad');
    });

    test('should resolve stroke-miterlimit and default to 4.0', () {
      // 1. Explicit value
      final PaintingStyle style = resolvePaint(
        emptyContext,
        tagName: 'g',
        coreAttributes: const SvgCoreAttributes(inlineStyle: 'stroke: black; stroke-miterlimit: 8.5'),
      );
      expect(style.stroke?.miterLimit, 8.5);

      // 2. Default value
      final PaintingStyle style2 = resolvePaint(
        emptyContext,
        tagName: 'g',
        coreAttributes: const SvgCoreAttributes(inlineStyle: 'stroke: black'),
      );
      expect(style2.stroke?.miterLimit, 4.0);

      // 3. Invalid value (should fall back to default)
      final PaintingStyle style3 = resolvePaint(
        emptyContext,
        tagName: 'g',
        coreAttributes: const SvgCoreAttributes(inlineStyle: 'stroke: black; stroke-miterlimit: 0.5'),
      );
      expect(style3.stroke?.miterLimit, 4.0);
    });
  });
}
