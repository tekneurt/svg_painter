import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgStrokeLinecap', () {
    const Map<String, SvgStrokeLinecap> expectedMapping = <String, SvgStrokeLinecap>{
      'butt': SvgStrokeLinecap.butt,
      'round': SvgStrokeLinecap.round,
      'square': SvgStrokeLinecap.square,
    };

    test('from should return correct enum for all valid strings', () {
      expectedMapping.forEach((String key, SvgStrokeLinecap value) {
        expect(SvgStrokeLinecap.from(key), equals(value), reason: 'String "$key" did not map to $value');
      });
    });

    test('from should handle case insensitivity? (Current implementation is strict)', () {
      // The current implementation uses direct string comparison in the loop, so it IS strict case sensitive
      // unless .toLowerCase() is called before passing to .from().
      // However, the extension `toSvgStrokeLinecap` does the lowercasing.
      // The static method `SvgStrokeLinecap.from` usually expects exact match or handles it internally.
      // Let's verify the behavior of .from() specifically.
      // Looking at source: it iterates and checks `cap.value == value`.
      // The enum values are 'butt', 'round', 'square'.
      // So SvgStrokeLinecap.from('BUTT') would return null.
      expect(SvgStrokeLinecap.from('BUTT'), isNull);
    });

    test('should return null for invalid strings', () {
      expect(SvgStrokeLinecap.from('foo'), isNull);
    });

    test('should verify all enum values are covered in test', () {
      final Set<SvgStrokeLinecap> mappedValues = expectedMapping.values.toSet();
      for (final SvgStrokeLinecap cap in SvgStrokeLinecap.values) {
        expect(mappedValues.contains(cap), isTrue, reason: 'Enum value $cap is not covered by test expectations');
      }
    });
  });
}
