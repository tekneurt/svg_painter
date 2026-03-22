import 'package:svg_painter/src/svg_model/attribute_groups/_attribute_groups.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgGeometry', () {
    test('should hold pathLength when applied to a class (tested via SvgCircle)', () {
      // Arrange
      const element = SvgCircle(
        cx: SvgLength(11.0),
        cy: SvgLength(22.0),
        r: SvgLength(33.0),
        geometryAttributes: SvgGeometryAttributes(
          pathLength: SvgNonNegativeNumber(444.4),
        ),
      );

      // Act & Assert
      expect(element.pathLength?.value, 444.4);
    });
  });
}
