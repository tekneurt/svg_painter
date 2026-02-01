import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:test/test.dart';

void main() {
  group('SvgParent', () {
    test('should hold children when applied to a class (tested via SvgGroup)', () {
      // Arrange
      const SvgTitle child = SvgTitle(content: 'child');
      const SvgGroup parent = SvgGroup(children: <SvgElement>[child]);

      // Act & Assert
      expect(parent.children, hasLength(1));
      expect(parent.children[0], child);
    });
  });
}
