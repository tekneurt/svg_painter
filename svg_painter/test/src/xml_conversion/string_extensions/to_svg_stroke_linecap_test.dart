import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:svg_painter/src/xml_conversion/string_extensions/to_svg_stroke_linecap.dart';
import 'package:test/test.dart';

void main() {
  group('ToSvgStrokeLinecap', () {
    group('toSvgStrokeLinecap', () {
      test('should return correct enum when valid value is provided', () {
        // Act & Assert
        expect('butt'.toSvgStrokeLinecap(), SvgStrokeLinecap.butt);
        expect('round'.toSvgStrokeLinecap(), SvgStrokeLinecap.round);
        expect('square'.toSvgStrokeLinecap(), SvgStrokeLinecap.square);
      });

      test('should handle case insensitivity', () {
        // Act & Assert
        expect('BUTT'.toSvgStrokeLinecap(), SvgStrokeLinecap.butt);
        expect(' Round '.toSvgStrokeLinecap(), SvgStrokeLinecap.round);
      });

      test('should return null when value is unknown', () {
        // Act & Assert
        expect('foo'.toSvgStrokeLinecap(), isNull);
      });
    });
  });
}
