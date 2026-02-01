import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgUse', () {
    test('should return correct string representation when toString() is called', () {
      // Arrange
      const SvgUse use = SvgUse(
        href: '#id1',
        x: SvgLength(10.0),
        y: SvgLength(20.0),
        width: SvgLength(100.0),
        height: SvgLength(50.0),
        id: 'u1',
      );

      // Act
      final String result = use.toString();

      // Assert
      expect(result, 'SvgUse(href: #id1, id: u1)');
    });
  });
}
