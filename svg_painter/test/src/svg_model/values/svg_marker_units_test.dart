import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgMarkerUnits', () {
    test('should have correct enum values when inspected', () {
      // Arrange & Act & Assert
      expect(SvgMarkerUnits.values, hasLength(2));
      expect(SvgMarkerUnits.strokeWidth.value, 'strokeWidth');
      expect(SvgMarkerUnits.userSpaceOnUse.value, 'userSpaceOnUse');
    });

    test('should return correct enum when valid string provided to from', () {
      // Arrange
      const validStrokeWidth = 'strokeWidth';
      const validUserSpace = 'userSpaceOnUse';

      // Act
      final SvgMarkerUnits? resultStrokeWidth = SvgMarkerUnits.from(validStrokeWidth);
      final SvgMarkerUnits? resultUserSpace = SvgMarkerUnits.from(validUserSpace);

      // Assert
      expect(resultStrokeWidth, SvgMarkerUnits.strokeWidth);
      expect(resultUserSpace, SvgMarkerUnits.userSpaceOnUse);
    });

    test('should return null when null or invalid string provided to from', () {
      // Arrange
      const String? nullValue = null;
      const invalidValue = 'invalidUnits';

      // Act
      final SvgMarkerUnits? resultNull = SvgMarkerUnits.from(nullValue);
      final SvgMarkerUnits? resultInvalid = SvgMarkerUnits.from(invalidValue);

      // Assert
      expect(resultNull, isNull);
      expect(resultInvalid, isNull);
    });

    test('should return correct representation when toString is called', () {
      // Arrange
      const SvgMarkerUnits unit = SvgMarkerUnits.strokeWidth;

      // Act
      final result = unit.toString();

      // Assert
      expect(result, 'SvgMarkerUnits.strokeWidth');
    });
  });
}
