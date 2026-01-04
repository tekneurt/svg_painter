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

    test('SvgGradient should return correct string representation', () {
      // Arrange
      const SvgLinearGradient grad = SvgLinearGradient(
        id: 'g1',
        x1: SvgLength(0),
        y1: SvgLength(0),
        x2: SvgLength(100),
        y2: SvgLength(0),
        stops: <SvgStop>[
          SvgStop(
            offset: SvgLength(0),
            stopColor: SvgNamedColor(SvgColorName.white),
            stopOpacity: SvgLength(1),
          ),
        ],
      );

      // Act
      final String result = grad.toString();

      // Assert
      expect(result, 'SvgLinearGradient(stops: 1, id: g1)');
    });
  });
}
