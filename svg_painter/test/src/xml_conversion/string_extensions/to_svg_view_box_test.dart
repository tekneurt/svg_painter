import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:svg_painter/src/xml_conversion/string_extensions/to_svg_view_box.dart';
import 'package:test/test.dart';

void main() {
  group('ToSvgViewBox', () {
    group('toSvgViewBox', () {
      test('should return SvgViewBox when valid 4-parameter string is provided', () {
        // Arrange
        const input = '0 0 100 200';

        // Act
        final SvgViewBox? result = input.toSvgViewBox();

        // Assert
        expect(result, isNotNull);
        expect(result!.minX, 0.0);
        expect(result.minY, 0.0);
        expect(result.width, 100.0);
        expect(result.height, 200.0);
      });

      test('should handle commas as delimiters', () {
        // Arrange
        const input = '10, 20, 30, 40';

        // Act
        final SvgViewBox? result = input.toSvgViewBox();

        // Assert
        expect(result!.minX, 10.0);
        expect(result.height, 40.0);
      });

      test('should return null when parameters are insufficient or excessive', () {
        // Arrange
        const input1 = '0 0 100';
        const input2 = '0 0 100 200 300';

        // Act & Assert
        expect(input1.toSvgViewBox(), isNull);
        expect(input2.toSvgViewBox(), isNull);
      });

      test('should return null when parameters are not numbers', () {
        // Arrange
        const input = '0 0 width height';

        // Act
        final SvgViewBox? result = input.toSvgViewBox();

        // Assert
        expect(result, isNull);
      });
    });
  });
}
