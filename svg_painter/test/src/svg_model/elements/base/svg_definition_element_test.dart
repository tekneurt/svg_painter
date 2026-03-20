import 'package:svg_painter/src/svg_model/attribute_groups/_attribute_groups.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgDefinitionElement', () {
    test('should return correct base string representation (tested via SvgStop)', () {
      // Arrange
      const SvgStop element = SvgStop(
        offset: SvgLength(0.5),
        stopColor: SvgNamedColor(SvgColorName.black),
        stopOpacity: SvgLength(1.0),
        coreAttributes: SvgCoreAttributes(id: 'stop1'),
      );

      // Act
      final String result = element.toString();

      // Assert
      expect(result, contains('id: stop1'));
    });
  });
}
