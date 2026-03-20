import 'package:svg_painter/src/svg_model/attribute_groups/_attribute_groups.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgPath', () {
    test('should return correct string representation when all fields are provided', () {
      // Arrange
      const SvgPath path = SvgPath(
        d: 'M 11 22 L 33 44',
        geometryAttributes: SvgGeometryAttributes(
          pathLength: SvgNonNegativeNumber(400.0),
        ),
        coreAttributes: SvgCoreAttributes(id: 'p1'),
      );

      // Act
      final String result = path.toString();

      // Assert
      expect(
        result,
        'SvgPath(d: M 11 22 L 33 44, geometry: SvgGeometryAttributes(pathLength: SvgNumber(400.0)), core: SvgCoreAttributes(id: p1))',
      );
    });

    test('should return compact string representation when optional fields are null', () {
      // Arrange
      const SvgPath path = SvgPath(d: 'M 11 22 L 33 44');

      // Act
      final String result = path.toString();

      // Assert
      expect(result, 'SvgPath(d: M 11 22 L 33 44)');
    });
  });
}
