import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:svg_painter/src/xml_conversion/string_extensions/to_svg_length_unit.dart';
import 'package:test/test.dart';

void main() {
  group('ToSvgLengthUnit', () {
    group('toSvgLengthUnit', () {
      test('should return correct unit when valid suffix is provided', () {
        // Act & Assert
        expect('px'.toSvgLengthUnit(), SvgLengthUnit.px);
        expect('cm'.toSvgLengthUnit(), SvgLengthUnit.cm);
        expect('mm'.toSvgLengthUnit(), SvgLengthUnit.mm);
        expect('in'.toSvgLengthUnit(), SvgLengthUnit.inUnit);
        expect('pt'.toSvgLengthUnit(), SvgLengthUnit.pt);
        expect('pc'.toSvgLengthUnit(), SvgLengthUnit.pc);
        expect('vw'.toSvgLengthUnit(), SvgLengthUnit.vw);
        expect('vh'.toSvgLengthUnit(), SvgLengthUnit.vh);
        expect('vmin'.toSvgLengthUnit(), SvgLengthUnit.vmin);
        expect('vmax'.toSvgLengthUnit(), SvgLengthUnit.vmax);
        expect('Q'.toSvgLengthUnit(), SvgLengthUnit.q);
      });

      test('should return none when suffix is empty or unknown', () {
        // Act & Assert
        expect(''.toSvgLengthUnit(), SvgLengthUnit.none);
        expect('foo'.toSvgLengthUnit(), SvgLengthUnit.none);
      });
    });
  });
}
