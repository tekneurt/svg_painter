import 'package:svg_painter/src/svg_model/attribute_groups/_attribute_groups.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:test/test.dart';

void main() {
  group('SvgSvg', () {
    test('should return correct string representation when toString() is called', () {
      // Arrange
      const svg = SvgSvg(
        children: <SvgElement>[],
        coreAttributes: SvgCoreAttributes(id: 's1'),
      );

      // Act
      final result = svg.toString();

      // Assert
      expect(result, 'SvgSvg(children: 0, id: s1)');
    });
  });

  group('SvgRoot', () {
    test('should return correct string representation when toString() is called', () {
      // Arrange
      const root = SvgRoot(
        children: <SvgElement>[],
        coreAttributes: SvgCoreAttributes(id: 'root1'),
      );

      // Act
      final result = root.toString();

      // Assert
      expect(result, 'SvgRoot(children: 0, id: root1)');
    });
  });
}
