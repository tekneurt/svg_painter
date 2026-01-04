import 'package:svg_painter/src/svg_model/svg_style_sheet.dart';
import 'package:test/test.dart';

void main() {
  group('SvgStyleSheet', () {
    test('should store rules correctly', () {
      // Arrange
      final Map<String, Map<String, String>> rules = <String, Map<String, String>>{
        'rect': <String, String>{'fill': 'red'},
      };

      // Act
      final SvgStyleSheet styleSheet = SvgStyleSheet(rules);

      // Assert
      expect(styleSheet.rules, rules);
    });

    test('empty constructor should create empty rules', () {
      // Arrange & Act
      const SvgStyleSheet styleSheet = SvgStyleSheet.empty();

      // Assert
      expect(styleSheet.rules, isEmpty);
    });

    test('should return correct string representation', () {
      // Arrange
      const SvgStyleSheet styleSheet = SvgStyleSheet(<String, Map<String, String>>{
        'rect': <String, String>{'fill': 'red'},
      });

      // Act
      final String result = styleSheet.toString();

      // Assert
      expect(result, 'SvgStyleSheet({rect: {fill: red}})');
    });
  });
}
