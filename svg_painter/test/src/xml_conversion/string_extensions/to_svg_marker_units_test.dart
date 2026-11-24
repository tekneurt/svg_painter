import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:svg_painter/src/xml_conversion/string_extensions/to_svg_marker_units.dart';
import 'package:test/test.dart';

void main() {
  group('ToSvgMarkerUnits', () {
    group('toSvgMarkerUnits', () {
      test('should return strokeWidth when "strokeWidth" is provided', () {
        // Arrange
        const input = 'strokeWidth';

        // Act
        final SvgMarkerUnits? result = input.toSvgMarkerUnits();

        // Assert
        expect(result, SvgMarkerUnits.strokeWidth);
      });

      test('should return userSpaceOnUse when "userSpaceOnUse" is provided', () {
        // Arrange
        const input = 'userSpaceOnUse';

        // Act
        final SvgMarkerUnits? result = input.toSvgMarkerUnits();

        // Assert
        expect(result, SvgMarkerUnits.userSpaceOnUse);
      });

      test('should return null when input is empty or invalid', () {
        // Arrange
        const empty = '   ';
        const invalid = 'invalidUnits';

        // Act
        final SvgMarkerUnits? emptyResult = empty.toSvgMarkerUnits();
        final SvgMarkerUnits? invalidResult = invalid.toSvgMarkerUnits();

        // Assert
        expect(emptyResult, isNull);
        expect(invalidResult, isNull);
      });
    });
  });
}
