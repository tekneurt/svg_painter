import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:svg_painter/src/xml_conversion/string_extensions/to_svg_pattern_units.dart';
import 'package:test/test.dart';

void main() {
  group('ToSvgPatternUnits', () {
    test('should return correct enum when valid string is provided', () {
      // Arrange & Act & Assert
      expect('objectBoundingBox'.toSvgPatternUnits(), SvgPatternUnits.objectBoundingBox);
      expect('userSpaceOnUse'.toSvgPatternUnits(), SvgPatternUnits.userSpaceOnUse);
    });

    test('should return null when invalid string is provided', () {
      // Arrange & Act & Assert
      expect('invalidUnit'.toSvgPatternUnits(), isNull);
    });
  });
}
