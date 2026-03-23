import 'package:svg_painter/src/svg_model/attribute_groups/_attribute_groups.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgEllipse', () {
    test('should return correct string representation when all fields are provided', () {
      // Arrange
      const ellipse = SvgEllipse(
        cx: SvgLength(111.0),
        cy: SvgLength(55.0),
        rx: SvgLength(44.0),
        ry: SvgLength(22.0),
        geometryAttributes: SvgGeometryAttributes(
          pathLength: SvgNonNegativeNumber(200.0),
        ),
        coreAttributes: SvgCoreAttributes(id: 'e1'),
      );

      // Act
      final result = ellipse.toString();

      // Assert
      expect(
        result,
        'SvgEllipse(cx: 111.0, cy: 55.0, rx: 44.0, ry: 22.0, geometry: SvgGeometryAttributes(pathLength: SvgNumber(200.0)), core: SvgCoreAttributes(id: e1))',
      );
    });

    test('should return compact string representation when optional fields are null', () {
      // Arrange
      const ellipse = SvgEllipse(
        cx: SvgLength(111.0),
        cy: SvgLength(55.0),
        rx: SvgLength(44.0),
        ry: SvgLength(22.0),
      );

      // Act
      final result = ellipse.toString();

      // Assert
      expect(result, 'SvgEllipse(cx: 111.0, cy: 55.0, rx: 44.0, ry: 22.0)');
    });
  });
}
