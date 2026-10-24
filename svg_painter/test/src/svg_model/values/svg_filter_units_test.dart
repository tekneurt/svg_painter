import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgFilterUnits', () {
    test('should return correct enum when valid string provided to from', () {
      // Arrange & Act & Assert
      expect(SvgFilterUnits.from('objectBoundingBox'), SvgFilterUnits.objectBoundingBox);
      expect(SvgFilterUnits.from('userSpaceOnUse'), SvgFilterUnits.userSpaceOnUse);
    });

    test('should return null when null or unknown string provided to from', () {
      // Arrange & Act & Assert
      expect(SvgFilterUnits.from(null), isNull);
      expect(SvgFilterUnits.from('invalid'), isNull);
    });

    test('should have correct string values when inspected', () {
      // Arrange & Act & Assert
      expect(SvgFilterUnits.objectBoundingBox.value, 'objectBoundingBox');
      expect(SvgFilterUnits.userSpaceOnUse.value, 'userSpaceOnUse');
    });
  });
}
