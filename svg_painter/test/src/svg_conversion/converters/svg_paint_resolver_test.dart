import 'package:svg_painter/src/painting_model/styles/painting_style.dart';
import 'package:svg_painter/src/svg_conversion/converters/svg_paint_resolver.dart';
import 'package:svg_painter/src/svg_conversion/converters/svg_painting_context.dart';
import 'package:svg_painter/src/svg_model/attributes/svg_stroke_attributes.dart';
import 'package:svg_painter/src/svg_model/svg_style_sheet.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('resolvePaint', () {
    const SvgPaintingContext baseContext = SvgPaintingContext(
      viewBoxWidth: 100,
      viewBoxHeight: 100,
    );

    test('should resolve fill from attribute when provided', () {
      // Arrange
      const SvgColor fill = SvgNamedColor(SvgColorName.red);

      // Act
      final PaintingStyle result = resolvePaint(baseContext, fill: fill);

      // Assert
      expect(result.fill?.colorArgb, 0xFFFF0000);
    });

    test('should resolve inherited fill when not provided on element', () {
      // Arrange
      final SvgPaintingContext context = baseContext.derive(
        inheritedFill: const SvgNamedColor(SvgColorName.blue),
      );

      // Act
      final PaintingStyle result = resolvePaint(context);

      // Assert
      expect(result.fill?.colorArgb, 0xFF0000FF);
    });

    test('should prioritize inline style over attributes', () {
      // Arrange
      const SvgColor fillAttribute = SvgNamedColor(SvgColorName.red);
      const String inlineStyle = 'fill: blue';

      // Act
      final PaintingStyle result = resolvePaint(
        baseContext,
        fill: fillAttribute,
        inlineStyle: inlineStyle,
      );

      // Assert
      expect(result.fill?.colorArgb, 0xFF0000FF);
    });

    test('should prioritize CSS class over tag selector', () {
      // Arrange
      const SvgPaintingContext context = SvgPaintingContext(
        viewBoxWidth: 100,
        viewBoxHeight: 100,
        styleSheet: SvgStyleSheet(<String, Map<String, String>>{
          'circle': <String, String>{'fill': 'red'},
          'my-class': <String, String>{'fill': 'blue'},
        }),
      );

      // Act
      final PaintingStyle result = resolvePaint(context, tagName: 'circle', cssClass: 'my-class');

      // Assert
      expect(result.fill?.colorArgb, 0xFF0000FF);
    });

    test('should resolve stroke attributes correctly', () {
      // Arrange
      const SvgStrokeAttributes stroke = SvgStrokeAttributes(
        color: SvgNamedColor(SvgColorName.black),
        width: SvgLength(2.0),
        linecap: SvgStrokeLinecap.round,
      );

      // Act
      final PaintingStyle result = resolvePaint(baseContext, stroke: stroke);

      // Assert
      expect(result.stroke?.colorArgb, 0xFF000000);
      expect(result.stroke?.width, 2.0);
      expect(result.stroke?.cap, PaintingStrokeCap.round);
    });

    test('should multiply opacities correctly', () {
      // Arrange
      final SvgPaintingContext context = baseContext.derive(parentOpacity: 0.5);
      const SvgLengthPercentage elementOpacity = SvgPercentage(50.0); // 0.5

      // Act
      final PaintingStyle result = resolvePaint(context, opacity: elementOpacity);

      // Assert
      expect(result.groupOpacity, 0.25);
    });

    test('should resolve font-size with scaling', () {
      // Arrange
      const SvgPaintingContext context = SvgPaintingContext(
        viewBoxWidth: 200,
        viewBoxHeight: 200,
        parentSx: 2.0,
        parentSy: 2.0,
      );
      const SvgLengthPercentage fontSize = SvgLength(16.0);

      // Act
      final PaintingStyle result = resolvePaint(context, fontSize: fontSize);

      // Assert
      // 16.0 * parentSy (2.0) = 32.0
      expect(result.text?.fontSize, 32.0);
    });

    test('should map generic font families', () {
      // Arrange & Act
      final PaintingStyle resultSerif = resolvePaint(baseContext, fontFamily: 'serif');
      final PaintingStyle resultSans = resolvePaint(baseContext, fontFamily: 'sans-serif');
      final PaintingStyle resultMono = resolvePaint(baseContext, fontFamily: 'monospace');

      // Assert
      expect(resultSerif.text?.fontFamily, 'Noto Serif');
      expect(resultSans.text?.fontFamily, 'Roboto');
      expect(resultMono.text?.fontFamily, 'Roboto Mono');
    });
  });
}
