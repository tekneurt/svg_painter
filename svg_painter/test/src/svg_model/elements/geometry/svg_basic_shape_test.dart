import 'package:svg_painter/src/svg_model/attribute_groups/_attribute_groups.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgBasicShape', () {
    test('should return correct base string representation (tested via SvgCircle)', () {
      // Arrange
      const SvgCircle element = SvgCircle(
        cx: SvgLength(11.1),
        cy: SvgLength(22.2),
        r: SvgLength(33.3),
        coreAttributes: SvgCoreAttributes(id: 'shape1'),
      );

      // Act
      final String result = element.toString();

      // Assert
      expect(result, contains('id: shape1'));
    });
  });
}
