import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgPatternUnits', () {
    test('should return correct enum when valid string provided to from', () {
      // Arrange & Act & Assert
      expect(SvgPatternUnits.from('objectBoundingBox'), SvgPatternUnits.objectBoundingBox);
      expect(SvgPatternUnits.from('userSpaceOnUse'), SvgPatternUnits.userSpaceOnUse);
    });

    test('should return null when null or unknown string provided to from', () {
      // Arrange & Act & Assert
      expect(SvgPatternUnits.from(null), isNull);
      expect(SvgPatternUnits.from('invalid'), isNull);
    });

    test('should have correct string values when inspected', () {
      // Arrange & Act & Assert
      expect(SvgPatternUnits.objectBoundingBox.value, 'objectBoundingBox');
      expect(SvgPatternUnits.userSpaceOnUse.value, 'userSpaceOnUse');
    });
  });
}
