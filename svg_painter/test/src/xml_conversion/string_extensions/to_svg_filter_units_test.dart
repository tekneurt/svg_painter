import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:svg_painter/src/xml_conversion/string_extensions/to_svg_filter_units.dart';
import 'package:test/test.dart';

void main() {
  group('ToSvgFilterUnits', () {
    test('should return correct enum when valid string is provided', () {
      // Arrange & Act & Assert
      expect('objectBoundingBox'.toSvgFilterUnits(), SvgFilterUnits.objectBoundingBox);
      expect('userSpaceOnUse'.toSvgFilterUnits(), SvgFilterUnits.userSpaceOnUse);
    });

    test('should return null when invalid string is provided', () {
      // Arrange & Act & Assert
      expect('invalidUnit'.toSvgFilterUnits(), isNull);
    });
  });
}
