import 'package:svg_painter/src/svg_model/_svg_model.dart';
import 'package:test/test.dart';

void main() {
  group('SvgText', () {
    test('should return correct string representation when toString() is called', () {
      // Arrange
      const SvgText text = SvgText(
        coreAttributes: SvgCoreAttributes(id: 't1'),
        x: SvgLength(10.0),
        y: SvgLength(20.0),
        text: 'Hi',
      );

      // Act
      final String result = text.toString();

      // Assert
      expect(result, 'SvgText(x: 10.0, y: 20.0, text: Hi, id: t1)');
    });
  });
}
