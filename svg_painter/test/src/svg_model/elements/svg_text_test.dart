import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgText', () {
    test('should return correct string representation when toString() is called', () {
      // Arrange
      const SvgText text = SvgText(
        x: SvgLength(10.0),
        y: SvgLength(20.0),
        text: 'Hi',
        id: 't1',
      );

      // Act
      final String result = text.toString();

      // Assert
      expect(result, 'SvgText(x: 10.0, y: 20.0, text: Hi, id: t1)');
    });
  });
}
