import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgClipPathUnits', () {
    test('should have correct enum values when inspected', () {
      // Arrange & Act & Assert
      expect(SvgClipPathUnits.values, hasLength(2));
      expect(SvgClipPathUnits.userSpaceOnUse.value, 'userSpaceOnUse');
      expect(SvgClipPathUnits.objectBoundingBox.value, 'objectBoundingBox');
    });

    test('should return correct enum when valid string provided to from', () {
      // Arrange
      const validUserSpace = 'userSpaceOnUse';
      const validObjectBoundingBox = 'objectBoundingBox';

      // Act
      final SvgClipPathUnits? resultUserSpace = SvgClipPathUnits.from(validUserSpace);
      final SvgClipPathUnits? resultObjectBoundingBox =
          SvgClipPathUnits.from(validObjectBoundingBox);

      // Assert
      expect(resultUserSpace, SvgClipPathUnits.userSpaceOnUse);
      expect(resultObjectBoundingBox, SvgClipPathUnits.objectBoundingBox);
    });

    test('should return null when null or invalid string provided to from', () {
      // Arrange
      const String? nullValue = null;
      const invalidValue = 'invalidUnits';

      // Act
      final SvgClipPathUnits? resultNull = SvgClipPathUnits.from(nullValue);
      final SvgClipPathUnits? resultInvalid = SvgClipPathUnits.from(invalidValue);

      // Assert
      expect(resultNull, isNull);
      expect(resultInvalid, isNull);
    });

    test('should return correct representation when toString is called', () {
      // Arrange
      const SvgClipPathUnits unit = SvgClipPathUnits.userSpaceOnUse;

      // Act
      final result = unit.toString();

      // Assert
      expect(result, 'SvgClipPathUnits.userSpaceOnUse');
    });
  });
}
