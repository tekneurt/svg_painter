import 'package:svg_painter/src/svg_model/attribute_groups/_attribute_groups.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgLine', () {
    test('should return correct string representation when all fields are provided', () {
      // Arrange
      const line = SvgLine(
        x1: SvgLength(11.0),
        y1: SvgLength(22.0),
        x2: SvgLength(111.0),
        y2: SvgLength(222.0),
        geometryAttributes: SvgGeometryAttributes(
          pathLength: SvgNonNegativeNumber(300.0),
        ),
        coreAttributes: SvgCoreAttributes(id: 'l1'),
      );

      // Act
      final result = line.toString();

      // Assert
      expect(
        result,
        'SvgLine(x1: 11.0, y1: 22.0, x2: 111.0, y2: 222.0, geometry: SvgGeometryAttributes(pathLength: SvgNumber(300.0)), core: SvgCoreAttributes(id: l1))',
      );
    });

    test('should return compact string representation when optional fields are null', () {
      // Arrange
      const line = SvgLine(
        x1: SvgLength(11.0),
        y1: SvgLength(22.0),
        x2: SvgLength(111.0),
        y2: SvgLength(222.0),
      );

      // Act
      final result = line.toString();

      // Assert
      expect(result, 'SvgLine(x1: 11.0, y1: 22.0, x2: 111.0, y2: 222.0)');
    });
  });
}
