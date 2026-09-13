import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgTextAnchor', () {
    test('should have correct enum values when inspected', () {
      // Arrange & Act & Assert
      expect(SvgTextAnchor.values, hasLength(3));
      expect(SvgTextAnchor.start.value, 'start');
      expect(SvgTextAnchor.middle.value, 'middle');
      expect(SvgTextAnchor.end.value, 'end');
    });

    test('should return correct enum when valid string provided to from', () {
      // Arrange
      const validStart = 'start';
      const validMiddle = 'middle';
      const validEnd = 'end';

      // Act
      final SvgTextAnchor? resultStart = SvgTextAnchor.from(validStart);
      final SvgTextAnchor? resultMiddle = SvgTextAnchor.from(validMiddle);
      final SvgTextAnchor? resultEnd = SvgTextAnchor.from(validEnd);

      // Assert
      expect(resultStart, SvgTextAnchor.start);
      expect(resultMiddle, SvgTextAnchor.middle);
      expect(resultEnd, SvgTextAnchor.end);
    });

    test('should return null when null or invalid string provided to from', () {
      // Arrange
      const String? nullValue = null;
      const invalidValue = 'invalidAnchor';

      // Act
      final SvgTextAnchor? resultNull = SvgTextAnchor.from(nullValue);
      final SvgTextAnchor? resultInvalid = SvgTextAnchor.from(invalidValue);

      // Assert
      expect(resultNull, isNull);
      expect(resultInvalid, isNull);
    });

    test('should return correct representation when toString is called', () {
      // Arrange
      const SvgTextAnchor anchor = SvgTextAnchor.middle;

      // Act
      final result = anchor.toString();

      // Assert
      expect(result, 'SvgTextAnchor.middle');
    });
  });
}
