import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:svg_painter/src/xml_conversion/string_extensions/to_svg_point_list.dart';
import 'package:test/test.dart';

void main() {
  group('ToSvgPointList', () {
    group('toSvgPointList', () {
      test('should return list of doubles when valid points string is provided', () {
        // Arrange
        const String input = '10,20 30.5,40.5 -50,-60';

        // Act
        final SvgPointList result = input.toSvgPointList();

        // Assert
        expect(result.points, <double>[10.0, 20.0, 30.5, 40.5, -50.0, -60.0]);
      });

      test('should return empty list when input contains no numbers', () {
        // Arrange
        const String input = 'abc, def';

        // Act
        final SvgPointList result = input.toSvgPointList();

        // Assert
        expect(result.points, isEmpty);
      });

      test('should return all coordinates even if input has odd number of values', () {
        // Arrange
        const String input = '10,20 30';

        // Act
        final SvgPointList result = input.toSvgPointList();

        // Assert
        expect(result.points, <double>[10.0, 20.0, 30.0]);
      });
    });
  });
}
