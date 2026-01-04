import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgStop', () {
    test('should return correct string representation when toString() is called', () {
      // Arrange
      const SvgStop stop = SvgStop(
        offset: SvgPercentage(50.0),
        stopColor: SvgNamedColor(SvgColorName.red),
        stopOpacity: SvgLength(0.8),
        id: 'stop1',
      );

      // Act
      final String result = stop.toString();

      // Assert
      expect(result, 'SvgStop(offset: 50.0%, color: SvgNamedColor(red), id: stop1)');
    });
  });
}
