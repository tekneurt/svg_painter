import 'package:svg_painter/src/svg_model/svg_style_sheet.dart';
import 'package:test/test.dart';

void main() {
  group('SvgStyleSheet', () {
    test('should store rules correctly', () {
      // Arrange
      final rules = <String, Map<String, String>>{
        'rect': <String, String>{'fill': 'red'},
      };

      // Act
      final styleSheet = SvgStyleSheet(rules);

      // Assert
      expect(styleSheet.rules, rules);
    });

    test('empty constructor should create empty rules', () {
      // Arrange & Act
      const styleSheet = SvgStyleSheet.empty();

      // Assert
      expect(styleSheet.rules, isEmpty);
    });

    test('should return correct string representation', () {
      // Arrange
      const styleSheet = SvgStyleSheet(<String, Map<String, String>>{
        'rect': <String, String>{'fill': 'red'},
      });

      // Act
      final result = styleSheet.toString();

      // Assert
      expect(result, 'SvgStyleSheet({rect: {fill: red}})');
    });
  });
}
