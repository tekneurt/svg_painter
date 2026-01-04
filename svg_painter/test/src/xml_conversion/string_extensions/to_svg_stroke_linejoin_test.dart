import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:svg_painter/src/xml_conversion/string_extensions/to_svg_stroke_linejoin.dart';
import 'package:test/test.dart';

void main() {
  group('ToSvgStrokeLinejoin', () {
    group('toSvgStrokeLinejoin', () {
      test('should return correct enum when valid value is provided', () {
        // Act & Assert
        expect('miter'.toSvgStrokeLinejoin(), SvgStrokeLinejoin.miter);
        expect('round'.toSvgStrokeLinejoin(), SvgStrokeLinejoin.round);
        expect('bevel'.toSvgStrokeLinejoin(), SvgStrokeLinejoin.bevel);
      });

      test('should handle case insensitivity', () {
        // Act & Assert
        expect('MITER'.toSvgStrokeLinejoin(), SvgStrokeLinejoin.miter);
        expect(' Round '.toSvgStrokeLinejoin(), SvgStrokeLinejoin.round);
      });

      test('should return null when value is unknown', () {
        // Act & Assert
        expect('foo'.toSvgStrokeLinejoin(), isNull);
      });
    });
  });
}
