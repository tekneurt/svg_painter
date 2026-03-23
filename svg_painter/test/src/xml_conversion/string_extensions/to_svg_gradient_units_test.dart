import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:svg_painter/src/xml_conversion/string_extensions/to_svg_gradient_units.dart';
import 'package:test/test.dart';

void main() {
  group('ToSvgGradientUnits', () {
    test('should parse valid strings correctly', () {
      expect('userSpaceOnUse'.toSvgGradientUnits(), SvgGradientUnits.userSpaceOnUse);
      expect('objectBoundingBox'.toSvgGradientUnits(), SvgGradientUnits.objectBoundingBox);
    });

    test('should default to objectBoundingBox for invalid strings', () {
      expect('invalid'.toSvgGradientUnits(), SvgGradientUnits.objectBoundingBox);
      expect(''.toSvgGradientUnits(), SvgGradientUnits.objectBoundingBox);
    });
  });
}
