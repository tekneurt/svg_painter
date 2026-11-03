import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgColorInterpolation', () {
    test('should define expected enum values and string values when inspected', () {
      // Arrange & Act
      const List<SvgColorInterpolation> values = SvgColorInterpolation.values;

      // Assert
      expect(values, hasLength(3));
      expect(SvgColorInterpolation.auto.value, 'auto');
      expect(SvgColorInterpolation.sRGB.value, 'sRGB');
      expect(SvgColorInterpolation.linearRGB.value, 'linearRGB');
    });

    test('should return correct enum value when parsed via from', () {
      // Arrange
      const autoStr = 'auto';
      const sRgbStr = 'sRGB';
      const linearRgbStr = 'linearRGB';
      const unknownStr = 'unknown';

      // Act
      final SvgColorInterpolation? autoResult = SvgColorInterpolation.from(autoStr);
      final SvgColorInterpolation? sRgbResult = SvgColorInterpolation.from(sRgbStr);
      final SvgColorInterpolation? linearRgbResult = SvgColorInterpolation.from(linearRgbStr);
      final SvgColorInterpolation? unknownResult = SvgColorInterpolation.from(unknownStr);

      // Assert
      expect(autoResult, SvgColorInterpolation.auto);
      expect(sRgbResult, SvgColorInterpolation.sRGB);
      expect(linearRgbResult, SvgColorInterpolation.linearRGB);
      expect(unknownResult, isNull);
    });

    test('should return expected string representation when toString is called', () {
      // Arrange
      const SvgColorInterpolation interpolation = SvgColorInterpolation.linearRGB;

      // Act
      final result = interpolation.toString();

      // Assert
      expect(result, 'SvgColorInterpolation.linearRGB');
    });
  });
}
