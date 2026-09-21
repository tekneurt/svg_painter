import 'package:svg_painter/src/generation/generator_buffer.dart';
import 'package:svg_painter/src/generation/generators/text_generator.dart';
import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/painting_model/styles/painting_style.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  const textStyle = PaintingStyle(
    fill: PaintingFillStyle(colorArgb: 0xFF000000),
    text: PaintingTextStyle(
      fontSize: 12.0,
      fontWeight: PaintingFontWeight.bold,
      fontStyle: PaintingFontStyle.italic,
      fontFamily: 'Roboto',
    ),
  );

  group('TextGenerator', () {
    test('should generate TextPainter with correct properties when DrawText is provided', () {
      // Arrange
      const generator = TextGenerator();
      const command = DrawText(
        x: 10.0,
        y: 20.0,
        rootSpan: PaintingTextSpan(text: 'Hello SVG'),
        style: textStyle,
      );
      final buffer = GeneratorBuffer();

      // Act
      generator.generate(command, buffer, painterClassName: 'TestPainter');

      // Assert
      final output = buffer.toString();
      expect(output, contains("text: 'Hello SVG'"));
      expect(output, contains('fontSize: 12.0'));
      expect(output, contains("fontFamily: 'Roboto'"));
      expect(output, contains('fontWeight: FontWeight.bold'));
      expect(output, contains('fontStyle: FontStyle.italic'));
      expect(output, contains('..layout()'));
      expect(
        output,
        contains(
          'tp.paint(canvas, Offset(10.0, 20.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic)))',
        ),
      );
    });

    test('should generate sequential text painters with currentX advancement when chunks are provided', () {
      // Arrange
      const generator = TextGenerator();
      const command = DrawText(
        x: 50.0,
        y: 90.0,
        rootSpan: PaintingTextSpan(text: 'SVG'),
        style: textStyle,
        chunks: <PaintingTextChunk>[
          PaintingTextChunk(text: 'S', x: 50.0, y: 90.0),
          PaintingTextChunk(text: 'V', x: 100.0),
          PaintingTextChunk(text: 'G', x: 150.0),
        ],
      );
      final buffer = GeneratorBuffer();

      // Act
      generator.generate(command, buffer, painterClassName: 'TestPainter');

      // Assert
      final output = buffer.toString();
      expect(output, contains('double currentX = 50.0;'));
      expect(output, contains('double currentY = 90.0;'));
      expect(output, contains('currentX += tp.width;'));
      expect(output, contains("text: 'S'"));
      expect(output, contains("text: 'V'"));
      expect(output, contains("text: 'G'"));
    });

    test('should escape single quotes in text', () {
      // Arrange
      const generator = TextGenerator();
      const command = DrawText(
        x: 15.0,
        y: 25.0,
        rootSpan: PaintingTextSpan(text: "It's a test"),
        style: textStyle,
      );
      final buffer = GeneratorBuffer();

      // Act
      generator.generate(command, buffer);

      // Assert
      expect(buffer.toString(), contains(r"text: 'It\'s a test'"));
    });

    test('should escape dollar signs and backslashes in text', () {
      // Arrange
      const generator = TextGenerator();
      const command = DrawText(
        x: 18.0,
        y: 28.0,
        rootSpan: PaintingTextSpan(text: r'$Revision: 1.1 $\path'),
        style: textStyle,
      );
      final buffer = GeneratorBuffer();

      // Act
      generator.generate(command, buffer);

      // Assert
      expect(buffer.toString(), contains(r"text: '\$Revision: 1.1 \$\\path'"));
    });

    test('should offset x position by half width when textAnchor is middle', () {
      // Arrange
      const generator = TextGenerator();
      const middleStyle = PaintingStyle(
        fill: PaintingFillStyle(colorArgb: 0xFF000000),
        text: PaintingTextStyle(
          fontSize: 14.0,
          fontWeight: PaintingFontWeight.normal,
          fontStyle: PaintingFontStyle.normal,
          fontFamily: 'Verdana',
          textAnchor: PaintingTextAnchor.middle,
        ),
      );
      const command = DrawText(
        x: 60.0,
        y: 75.0,
        rootSpan: PaintingTextSpan(text: 'Anchor Middle'),
        style: middleStyle,
      );
      final buffer = GeneratorBuffer();

      // Act
      generator.generate(command, buffer);

      // Assert
      final output = buffer.toString();
      expect(
        output,
        contains(
          'tp.paint(canvas, Offset(60.0 - tp.width / 2.0, 75.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic)))',
        ),
      );
    });

    test('should offset x position by full width when textAnchor is end', () {
      // Arrange
      const generator = TextGenerator();
      const endStyle = PaintingStyle(
        fill: PaintingFillStyle(colorArgb: 0xFF000000),
        text: PaintingTextStyle(
          fontSize: 16.0,
          fontWeight: PaintingFontWeight.normal,
          fontStyle: PaintingFontStyle.normal,
          fontFamily: 'Arial',
          textAnchor: PaintingTextAnchor.end,
        ),
      );
      const command = DrawText(
        x: 60.0,
        y: 110.0,
        rootSpan: PaintingTextSpan(text: 'Anchor End'),
        style: endStyle,
      );
      final buffer = GeneratorBuffer();

      // Act
      generator.generate(command, buffer);

      // Assert
      final output = buffer.toString();
      expect(
        output,
        contains(
          'tp.paint(canvas, Offset(60.0 - tp.width, 110.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic)))',
        ),
      );
    });

    test('should emit stroke pass before fill pass when paintOrder is stroke first', () {
      // Arrange
      const generator = TextGenerator();
      const strokeFirstStyle = PaintingStyle(
        fill: PaintingFillStyle(colorArgb: 0xFFDC143C),
        stroke: PaintingStrokeStyle(colorArgb: 0xFFFFFFFF, width: 6.0),
        paintOrder: SvgPaintOrder(<SvgPaintOrderComponent>[
          SvgPaintOrderComponent.stroke,
          SvgPaintOrderComponent.fill,
          SvgPaintOrderComponent.markers,
        ]),
        text: PaintingTextStyle(
          fontSize: 50.0,
          fontWeight: PaintingFontWeight.bold,
          fontStyle: PaintingFontStyle.normal,
          fontFamily: 'sans-serif',
        ),
      );
      const command = DrawText(
        x: 200.0,
        y: 150.0,
        rootSpan: PaintingTextSpan(text: 'stroke under'),
        style: strokeFirstStyle,
      );
      final buffer = GeneratorBuffer();

      // Act
      generator.generate(command, buffer);

      // Assert
      final output = buffer.toString();
      final int strokeIndex = output.indexOf('PaintingStyle.stroke');
      final int fillIndex = output.indexOf('PaintingStyle.fill');
      expect(strokeIndex, isNot(-1));
      expect(fillIndex, isNot(-1));
      expect(strokeIndex, lessThan(fillIndex));
    });

    test('should emit package parameter when fontPackage is specified on textStyle', () {
      // Arrange
      const generator = TextGenerator();
      const packagedStyle = PaintingStyle(
        fill: PaintingFillStyle(colorArgb: 0xFF123456),
        text: PaintingTextStyle(
          fontSize: 18.0,
          fontWeight: PaintingFontWeight.w500,
          fontStyle: PaintingFontStyle.normal,
          fontFamily: 'Noto Serif',
          fontPackage: 'svg_painter',
        ),
      );
      const command = DrawText(
        x: 30.0,
        y: 40.0,
        rootSpan: PaintingTextSpan(text: 'Packaged Font'),
        style: packagedStyle,
      );
      final buffer = GeneratorBuffer();

      // Act
      generator.generate(command, buffer);

      // Assert
      final output = buffer.toString();
      expect(output, contains("fontFamily: 'Noto Serif',"));
      expect(output, contains("package: 'svg_painter',"));
    });
  });

  group('escapeDartStringLiteral', () {
    test('should return unchanged string when input has no special characters', () {
      // Arrange
      const input = 'Simple text 123';

      // Act
      final String result = escapeDartStringLiteral(input);

      // Assert
      expect(result, 'Simple text 123');
    });

    test('should escape backslashes when present', () {
      // Arrange
      const input = r'C:\Users\test';

      // Act
      final String result = escapeDartStringLiteral(input);

      // Assert
      expect(result, r'C:\\Users\\test');
    });

    test('should escape single quotes when present', () {
      // Arrange
      const input = "It's a test";

      // Act
      final String result = escapeDartStringLiteral(input);

      // Assert
      expect(result, r"It\'s a test");
    });

    test('should escape dollar signs when present', () {
      // Arrange
      const input = r'$Revision: 1.7 $';

      // Act
      final String result = escapeDartStringLiteral(input);

      // Assert
      expect(result, r'\$Revision: 1.7 \$');
    });

    test('should escape newlines and carriage returns when present', () {
      // Arrange
      const input = 'Line 1\nLine 2\rLine 3';

      // Act
      final String result = escapeDartStringLiteral(input);

      // Assert
      expect(result, r'Line 1\nLine 2\rLine 3');
    });

    test('should escape multiple mixed special characters when combined', () {
      // Arrange
      const input = "Path: 'C:\\dir\\\$file'\nDone";

      // Act
      final String result = escapeDartStringLiteral(input);

      // Assert
      expect(result, r"Path: \'C:\\dir\\\$file\'\nDone");
    });
  });
}
