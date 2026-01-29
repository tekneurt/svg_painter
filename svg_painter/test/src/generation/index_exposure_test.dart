import 'package:svg_painter/src/svg_painter_generator.dart';
import 'package:svg_painter_annotation/svg_painter_annotation.dart';
import 'package:test/test.dart';

void main() {
  group('Index-Based Exposure', () {
    final SvgPainterGenerator generator = SvgPainterGenerator();

    test('should generate fill and stroke properties when only one group exists', () {
      // Arrange
      const String svg = '''
<svg viewBox="0 0 100 100">
  <circle cx="50" cy="50" r="40" fill="red" stroke="blue" />
  <rect x="0" y="0" width="10" height="10" fill="red" />
</svg>
''';

      // Act
      final String output = generator.generateFromSvg(
        elementName: 'SingleGroupPainter',
        svgContent: svg,
        exposureMode: SvgExposureMode.indexed,
      );

      // Assert
      expect(output, contains('final Color? fill;'));
      expect(output, contains('final Color? stroke;'));
      // Verify usage
      expect(output, contains('final Color? localFill = fill;'));
      expect(output, contains('final Color? localStroke = stroke;'));
    });

    test('should prioritize most used colors (9 black, 1 yellow)', () {
      // Arrange
      // 9 black lines, 1 yellow line
      final StringBuffer sb = StringBuffer('<svg viewBox="0 0 100 100">');
      for (int i = 0; i < 9; i++) {
        sb.writeln('<line x1="0" y1="$i" x2="10" y2="$i" stroke="black" />');
      }
      sb.writeln('<line x1="0" y1="9" x2="10" y2="9" stroke="yellow" />');
      sb.writeln('</svg>');

      // Act
      final String output = generator.generateFromSvg(
        elementName: 'FrequencyPainter',
        svgContent: sb.toString(),
        exposureMode: SvgExposureMode.indexed,
      );

      // Assert
      // stroke1 should be black (most frequent), stroke2 yellow.
      expect(output, contains('final Color? stroke1;'));
      expect(output, contains('final Color? stroke2;'));
      
      // Verify stroke1 maps to black (0xFF000000)
      expect(output, contains('final Color? localStroke = stroke1;'));
      expect(output, contains('paint.color = Colors.black;')); // inside the localStroke == null block
      
      // Verify stroke2 maps to yellow (0xFFFF00)
      expect(output, contains('final Color? localStroke = stroke2;'));
      expect(output, contains('paint.color = const Color(0xFFFFFF00);'));
    });

    test('should respect mixed mode (IDs take precedence)', () {
      // Arrange
      const String svg = '''
<svg viewBox="0 0 100 100">
  <circle id="named" cx="10" cy="10" r="5" fill="red" />
  <circle cx="20" cy="20" r="5" fill="red" />
  <circle cx="30" cy="30" r="5" fill="blue" />
</svg>
''';

      // Act
      final String output = generator.generateFromSvg(
        elementName: 'MixedPainter',
        svgContent: svg,
        exposureMode: SvgExposureMode.mixed,
      );

      // Assert
      expect(output, contains('final Color? namedFill;'));
      // Remaining red and blue circles get indexed.
      // Frequency: red (1), blue (1). Stable sort by key.
      expect(output, contains('final Color? fill1;'));
      expect(output, contains('final Color? fill2;'));
    });

    test('should generate NO properties when mode is none', () {
      // Arrange
      const String svg = '''
<svg viewBox="0 0 100 100">
  <circle id="ignored" cx="50" cy="50" r="40" fill="red" />
</svg>
''';

      // Act
      final String output = generator.generateFromSvg(
        elementName: 'StaticPainter',
        svgContent: svg,
      );

      // Assert
      expect(output, isNot(contains('Fill')));
      expect(output, isNot(contains('Stroke')));
    });
  });
}
