import 'package:svg_painter/src/svg_model/attribute_groups/_attribute_groups.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgRect', () {
    test('should return correct string representation when all fields are provided', () {
      // Arrange
      const rect = SvgRect(
        x: SvgLength(11.0),
        y: SvgLength(22.0),
        width: SvgLength(111.0),
        height: SvgLength(55.0),
        rx: SvgLength(6.0),
        ry: SvgLength(9.0),
        geometryAttributes: SvgGeometryAttributes(
          pathLength: SvgNonNegativeNumber(700.0),
        ),
        coreAttributes: SvgCoreAttributes(id: 'r1'),
      );

      // Act
      final result = rect.toString();

      // Assert
      expect(
        result,
        'SvgRect(x: 11.0, y: 22.0, w: 111.0, h: 55.0, rx: 6.0, ry: 9.0, geometry: SvgGeometryAttributes(pathLength: SvgNumber(700.0)), core: SvgCoreAttributes(id: r1))',
      );
    });

    test('should return compact string representation when optional fields are null', () {
      // Arrange
      const rect = SvgRect(
        x: SvgLength(11.0),
        y: SvgLength(22.0),
        width: SvgLength(111.0),
        height: SvgLength(55.0),
        rx: SvgLength(6.0),
        ry: SvgLength(9.0),
      );

      // Act
      final result = rect.toString();

      // Assert
      expect(result, 'SvgRect(x: 11.0, y: 22.0, w: 111.0, h: 55.0, rx: 6.0, ry: 9.0)');
    });
  });
}
