import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:svg_painter/src/xml_conversion/string_extensions/to_svg_marker_orient.dart';
import 'package:test/test.dart';

void main() {
  group('ToSvgMarkerOrient', () {
    group('toSvgMarkerOrient', () {
      test('should return SvgMarkerOrientAuto when "auto" is provided', () {
        // Arrange
        const input = 'auto';

        // Act
        final SvgMarkerOrient? result = input.toSvgMarkerOrient();

        // Assert
        expect(result, SvgMarkerOrient.auto);
      });

      test(
        'should return SvgMarkerOrientAutoStartReverse when "auto-start-reverse" is provided',
        () {
          // Arrange
          const input = 'auto-start-reverse';

          // Act
          final SvgMarkerOrient? result = input.toSvgMarkerOrient();

          // Assert
          expect(result, SvgMarkerOrient.autoStartReverse);
        },
      );

      test('should return angle in degrees when unitless number is provided', () {
        // Arrange
        const input = '45.5';

        // Act
        final SvgMarkerOrient? result = input.toSvgMarkerOrient();

        // Assert
        expect(result, const SvgMarkerOrientAngle(45.5));
      });

      test('should return angle in degrees when "deg" suffix is provided', () {
        // Arrange
        const input = '90deg';

        // Act
        final SvgMarkerOrient? result = input.toSvgMarkerOrient();

        // Assert
        expect(result, const SvgMarkerOrientAngle(90.0));
      });

      test('should convert radians to degrees when "rad" suffix is provided', () {
        // Arrange
        const input = '3.141592653589793rad';

        // Act
        final SvgMarkerOrient? result = input.toSvgMarkerOrient();

        // Assert
        expect(result, isA<SvgMarkerOrientAngle>());
        switch (result) {
          case final SvgMarkerOrientAngle angle:
            expect(angle.degrees, closeTo(180.0, 0.0001));
          case null || SvgMarkerOrient():
            fail('Expected SvgMarkerOrientAngle');
        }
      });

      test('should convert gradians to degrees when "grad" suffix is provided', () {
        // Arrange
        const input = '100grad';

        // Act
        final SvgMarkerOrient? result = input.toSvgMarkerOrient();

        // Assert
        expect(result, const SvgMarkerOrientAngle(90.0));
      });

      test('should convert turns to degrees when "turn" suffix is provided', () {
        // Arrange
        const input = '0.5turn';

        // Act
        final SvgMarkerOrient? result = input.toSvgMarkerOrient();

        // Assert
        expect(result, const SvgMarkerOrientAngle(180.0));
      });

      test('should return null when input is empty or invalid string', () {
        // Arrange
        const empty = '   ';
        const invalid = 'invalid-orient';

        // Act
        final SvgMarkerOrient? emptyResult = empty.toSvgMarkerOrient();
        final SvgMarkerOrient? invalidResult = invalid.toSvgMarkerOrient();

        // Assert
        expect(emptyResult, isNull);
        expect(invalidResult, isNull);
      });
    });
  });
}
