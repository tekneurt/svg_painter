import 'package:svg_painter/src/svg_model/svg_style_sheet.dart';
import 'package:svg_painter/src/xml_conversion/svg_style_parser.dart';
import 'package:test/test.dart';

void main() {
  group('SvgStyleParser', () {
    test('should parse class selectors', () {
      // Arrange
      const String css = '.red { fill: red; } .blue { stroke: blue; stroke-width: 2; }';

      // Act
      final SvgStyleSheet result = SvgStyleParser.parse(css);

      // Assert
      expect(result.rules, hasLength(2));
      expect(result.rules['red']?['fill'], 'red');
      expect(result.rules['blue']?['stroke'], 'blue');
      expect(result.rules['blue']?['stroke-width'], '2');
    });

    test('should parse tag selectors', () {
      // Arrange
      const String css = 'circle { fill: green; }';

      // Act
      final SvgStyleSheet result = SvgStyleParser.parse(css);

      // Assert
      expect(result.rules['circle']?['fill'], 'green');
    });

    test('should ignore comments', () {
      // Arrange
      const String css = '/* comment */ .c1 { fill: red; } // not a css comment but handled by split';

      // Act
      final SvgStyleSheet result = SvgStyleParser.parse(css);

      // Assert
      expect(result.rules['c1']?['fill'], 'red');
    });

    test('should handle empty or whitespace declarations', () {
      // Arrange
      const String css = '.c1 { ; fill: red; ; }';

      // Act
      final SvgStyleSheet result = SvgStyleParser.parse(css);

      // Assert
      expect(result.rules['c1']?['fill'], 'red');
      expect(result.rules['c1'], hasLength(1));
    });
  });
}
