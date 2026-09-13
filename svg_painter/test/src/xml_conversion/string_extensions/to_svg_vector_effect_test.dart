import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:svg_painter/src/xml_conversion/string_extensions/to_svg_vector_effect.dart';
import 'package:test/test.dart';

void main() {
  group('ToSvgVectorEffect', () {
    group('toSvgVectorEffect', () {
      test('should return correct enum when valid value is provided', () {
        // Arrange
        const noneStr = 'none';
        const nonScalingStrokeStr = 'non-scaling-stroke';

        // Act
        final SvgVectorEffect? resultNone = noneStr.toSvgVectorEffect();
        final SvgVectorEffect? resultNonScaling = nonScalingStrokeStr.toSvgVectorEffect();

        // Assert
        expect(resultNone, SvgVectorEffect.none);
        expect(resultNonScaling, SvgVectorEffect.nonScalingStroke);
      });

      test('should handle case insensitivity and whitespace', () {
        // Arrange
        const upperNone = ' NONE ';
        const mixedNonScaling = ' Non-Scaling-Stroke ';

        // Act
        final SvgVectorEffect? resultNone = upperNone.toSvgVectorEffect();
        final SvgVectorEffect? resultNonScaling = mixedNonScaling.toSvgVectorEffect();

        // Assert
        expect(resultNone, SvgVectorEffect.none);
        expect(resultNonScaling, SvgVectorEffect.nonScalingStroke);
      });

      test('should return null when value is unknown or empty', () {
        // Arrange
        const unknownStr = 'unknownEffect';
        const emptyStr = '   ';

        // Act
        final SvgVectorEffect? resultUnknown = unknownStr.toSvgVectorEffect();
        final SvgVectorEffect? resultEmpty = emptyStr.toSvgVectorEffect();

        // Assert
        expect(resultUnknown, isNull);
        expect(resultEmpty, isNull);
      });
    });
  });
}
