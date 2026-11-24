import 'package:svg_painter_annotation/src/svg_painter.dart';
import 'package:svg_painter_annotation/src/svg_theme.dart';
import 'package:test/test.dart';

void main() {
  group('SvgPainter Annotation', () {
    test('SvgPainter.file creates SvgFilePainter', () {
      const annotation = SvgPainter.file('assets/icon.svg');
      expect(annotation, isA<SvgFilePainter>());
      expect((annotation as SvgFilePainter).path, 'assets/icon.svg');
      expect(annotation.painterClassName, isNull);
    });

    test('SvgPainter.code creates SvgCodePainter', () {
      const svgCode = '<svg>...</svg>';
      const annotation = SvgPainter.code(svgCode);
      expect(annotation, isA<SvgCodePainter>());
      expect((annotation as SvgCodePainter).code, svgCode);
      expect(annotation.painterClassName, isNull);
    });

    test('SvgPainter accepts optional painterClassName', () {
      // Arrange & Act
      const annotation = SvgPainter.file('path', painterClassName: 'MyPainter');

      // Assert
      expect(annotation.painterClassName, 'MyPainter');
    });

    test('SvgPainter should use default colorMapping and tokenColors when omitted', () {
      // Arrange & Act
      const annotation = SvgPainter.file('path');

      // Assert
      expect(annotation.colorMapping, SvgColorMapping.material);
      expect(annotation.tokenColors, isFalse);
      expect(annotation.theme, const SvgTheme());
    });

    test('SvgPainter should respect custom colorMapping and tokenColors when provided', () {
      // Arrange & Act
      const annotation = SvgPainter.file(
        'path',
        colorMapping: SvgColorMapping.hex,
        tokenColors: true,
      );

      // Assert
      expect(annotation.colorMapping, SvgColorMapping.hex);
      expect(annotation.tokenColors, isTrue);
    });

    test('SvgPainter should respect custom theme when provided', () {
      // Arrange & Act
      const customTheme = SvgTheme(fontSize: 600.0, xHeight: 300.0);
      const annotation = SvgPainter.code(
        '<svg></svg>',
        theme: customTheme,
      );

      // Assert
      expect(annotation.theme, equals(customTheme));
    });

    test('SvgColorMapping should define expected enum values', () {
      // Arrange & Act
      const List<SvgColorMapping> values = SvgColorMapping.values;

      // Assert
      expect(values, containsAll(<SvgColorMapping>[SvgColorMapping.material, SvgColorMapping.hex]));
    });
  });
}
