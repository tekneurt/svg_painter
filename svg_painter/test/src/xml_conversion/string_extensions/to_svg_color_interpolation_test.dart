import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:svg_painter/src/xml_conversion/string_extensions/to_svg_color_interpolation.dart';
import 'package:test/test.dart';

void main() {
  group('ToSvgColorInterpolation', () {
    test('should parse valid color interpolation strings when valid input is provided', () {
      // Arrange
      const autoStr = 'auto';
      const sRgbStr = 'sRGB';
      const linearRgbStr = 'linearRGB';

      // Act
      final SvgColorInterpolation autoResult = autoStr.toSvgColorInterpolation();
      final SvgColorInterpolation sRgbResult = sRgbStr.toSvgColorInterpolation();
      final SvgColorInterpolation linearRgbResult = linearRgbStr.toSvgColorInterpolation();

      // Assert
      expect(autoResult, SvgColorInterpolation.auto);
      expect(sRgbResult, SvgColorInterpolation.sRGB);
      expect(linearRgbResult, SvgColorInterpolation.linearRGB);
    });

    test('should default to sRGB when string is unknown or empty', () {
      // Arrange
      const unknownStr = 'unknown';
      const emptyStr = '';

      // Act
      final SvgColorInterpolation unknownResult = unknownStr.toSvgColorInterpolation();
      final SvgColorInterpolation emptyResult = emptyStr.toSvgColorInterpolation();

      // Assert
      expect(unknownResult, SvgColorInterpolation.sRGB);
      expect(emptyResult, SvgColorInterpolation.sRGB);
    });
  });
}
