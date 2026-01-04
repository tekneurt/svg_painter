import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:svg_painter/src/xml_conversion/string_extensions/to_svg_length_percentage_auto.dart';
import 'package:test/test.dart';

void main() {
  group('ToSvgLengthPercentageAuto', () {
    group('toSvgLengthPercentageAuto', () {
      test('should return SvgAuto when auto is provided', () {
        // Arrange & Act
        final SvgLengthPercentageAuto result = 'auto'.toSvgLengthPercentageAuto();

        // Assert
        expect(result, isA<SvgAuto>());
      });

      test('should return SvgLength when number is provided', () {
        // Arrange & Act
        final SvgLengthPercentageAuto result = '10'.toSvgLengthPercentageAuto();

        // Assert
        expect(result, isA<SvgLength>());
        expect((result as SvgLength).value, 10.0);
      });

      test('should return SvgPercentage when percentage is provided', () {
        // Arrange & Act
        final SvgLengthPercentageAuto result = '50%'.toSvgLengthPercentageAuto();

        // Assert
        expect(result, isA<SvgPercentage>());
        expect((result as SvgPercentage).value, 50.0);
      });
    });
  });
}
