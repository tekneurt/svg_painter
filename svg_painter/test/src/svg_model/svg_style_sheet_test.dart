import 'package:svg_painter/src/svg_model/svg_style_sheet.dart';
import 'package:test/test.dart';

void main() {
  group('SvgStyleSheet', () {
    test('should return correct string representation', () {
      // Arrange
      const SvgStyleSheet styleSheet = SvgStyleSheet(<String, Map<String, String>>{
        'rect': <String, String>{'fill': 'red'},
        '.cls': <String, String>{'stroke': 'black'},
      });

      // Act
      final String result = styleSheet.toString();

      // Assert
      expect(result, 'SvgStyleSheet({rect: {fill: red}, .cls: {stroke: black}})');
    });
  });
}
