import 'package:svg_painter/src/svg_model/attribute_groups/svg_core_attributes.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgStop', () {
    test('should return correct string representation when toString() is called', () {
      // Arrange
      const stop = SvgStop(
        offset: SvgPercentage(55.0),
        stopColor: SvgNamedColor(SvgColorName.red),
        stopOpacity: SvgLength(0.45),
        coreAttributes: SvgCoreAttributes(id: 'stop1'),
      );

      // Act
      final result = stop.toString();

      // Assert
      expect(result, 'SvgStop(offset: 55.0%, color: SvgNamedColor(red), id: stop1)');
    });

    test('should allow nullable stopColor and stopOpacity when omitted', () {
      // Arrange & Act
      const stop = SvgStop(
        offset: SvgPercentage(25.0),
      );

      // Assert
      expect(stop.offset, const SvgPercentage(25.0));
      expect(stop.stopColor, isNull);
      expect(stop.stopOpacity, isNull);
    });
  });
}
