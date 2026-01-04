import 'package:svg_painter/src/svg_conversion/svg_value_extensions/svg_color_to_int.dart';
import 'package:svg_painter/src/xml_conversion/string_extensions/to_svg_color.dart';
import 'package:test/test.dart';

void main() {
  group('ToSvgColor', () {
    group('toSvgColor', () {
      test('should parse 3-digit hex colors correctly', () {
        expect('#F00'.toSvgColor().toArgb(), 0xFFFF0000);
        expect('#0F0'.toSvgColor().toArgb(), 0xFF00FF00);
        expect('#00F'.toSvgColor().toArgb(), 0xFF0000FF);
      });

      test('should parse 6-digit hex colors correctly', () {
        expect('#FF0000'.toSvgColor().toArgb(), 0xFFFF0000);
        expect('#00FF00'.toSvgColor().toArgb(), 0xFF00FF00);
        expect('#0000FF'.toSvgColor().toArgb(), 0xFF0000FF);
      });

      test('should parse 8-digit hex colors correctly (RRGGBBAA to AARRGGBB)', () {
        expect('#FF0000FF'.toSvgColor().toArgb(), 0xFFFF0000); // opaque red
        expect('#00FF0080'.toSvgColor().toArgb(), 0x8000FF00); // 50% green
      });

      test('should parse named colors correctly', () {
        expect('red'.toSvgColor().toArgb(), 0xFFFF0000);
        expect('blue'.toSvgColor().toArgb(), 0xFF0000FF);
        expect('transparent'.toSvgColor().toArgb(), 0x00000000);
      });

      test('should parse rgb() functional notation correctly', () {
        expect('rgb(255, 0, 0)'.toSvgColor().toArgb(), 0xFFFF0000);
        expect('rgb(100%, 0%, 0%)'.toSvgColor().toArgb(), 0xFFFF0000);
        expect('rgb(0, 255, 0)'.toSvgColor().toArgb(), 0xFF00FF00);
      });

      test('should parse rgba() functional notation correctly', () {
        expect('rgba(255, 0, 0, 1.0)'.toSvgColor().toArgb(), 0xFFFF0000);
        expect('rgba(0, 255, 0, 0.5)'.toSvgColor().toArgb(), 0x8000FF00);
      });

      test('should parse hsl() functional notation correctly', () {
        expect('hsl(0, 100%, 50%)'.toSvgColor().toArgb(), 0xFFFF0000);
        expect('hsl(120, 100%, 50%)'.toSvgColor().toArgb(), 0xFF00FF00);
        expect('hsl(240, 100%, 50%)'.toSvgColor().toArgb(), 0xFF0000FF);
      });

      test('should parse hsla() functional notation correctly', () {
        expect('hsla(0, 100%, 50%, 0.5)'.toSvgColor().toArgb(), 0x80FF0000);
      });
    });
  });
}
