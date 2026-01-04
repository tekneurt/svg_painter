import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:test/test.dart';

void main() {
  group('SvgSvg', () {
    test('should return correct string representation when toString() is called', () {
      // Arrange
      const SvgSvg svg = SvgSvg(children: <SvgElement>[], id: 's1');

      // Act
      final String result = svg.toString();

      // Assert
      expect(result, 'SvgSvg(children: 0, id: s1)');
    });
  });

  group('SvgRoot', () {
    test('should return correct string representation when toString() is called', () {
      // Arrange
      const SvgRoot root = SvgRoot(children: <SvgElement>[], id: 'root1');

      // Act
      final String result = root.toString();

      // Assert
      expect(result, 'SvgRoot(children: 0, id: root1)');
    });
  });
}
