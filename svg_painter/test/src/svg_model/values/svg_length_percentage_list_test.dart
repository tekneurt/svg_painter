import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgLengthPercentageList', () {
    test('should return first item when firstOrZero is accessed and list is not empty', () {
      // Arrange
      const list = SvgLengthPercentageList(<SvgLengthPercentage>[
        SvgLength(15.0),
        SvgPercentage(35.0),
      ]);

      // Act
      final SvgLengthPercentage result = list.firstOrZero;

      // Assert
      expect(result, isA<SvgLength>());
      expect((result as SvgLength).value, 15.0);
      expect(list.primary, isA<SvgLength>());
      expect((list.primary as SvgLength).value, 15.0);
      expect(list.toList(), hasLength(2));
    });

    test('should return zero length when firstOrZero is accessed on empty list', () {
      // Arrange
      const list = SvgLengthPercentageList(<SvgLengthPercentage>[]);

      // Act
      final SvgLengthPercentage result = list.firstOrZero;

      // Assert
      expect(result, isA<SvgLength>());
      expect((result as SvgLength).value, 0.0);
    });

    test('should construct with single factory when single value is provided', () {
      // Arrange & Act
      final list = SvgLengthPercentageList.single(const SvgPercentage(75.0));

      // Assert
      expect(list.values, hasLength(1));
      expect(list.firstOrZero, isA<SvgPercentage>());
      expect((list.firstOrZero as SvgPercentage).value, 75.0);
    });

    test('should return comma-separated string when toString is called', () {
      // Arrange
      const list = SvgLengthPercentageList(<SvgLengthPercentage>[
        SvgLength(12.0),
        SvgPercentage(48.0),
      ]);

      // Act
      final result = list.toString();

      // Assert
      expect(result, '12.0, 48.0%');
    });
  });
}
