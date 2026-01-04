import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgStrokeLinejoin', () {
    const Map<String, SvgStrokeLinejoin> expectedMapping = <String, SvgStrokeLinejoin>{
      'miter': SvgStrokeLinejoin.miter,
      'round': SvgStrokeLinejoin.round,
      'bevel': SvgStrokeLinejoin.bevel,
      'miter-clip': SvgStrokeLinejoin.miterClip,
      'arcs': SvgStrokeLinejoin.arcs,
    };

    test('from should return correct enum for all valid strings', () {
      expectedMapping.forEach((String key, SvgStrokeLinejoin value) {
        expect(SvgStrokeLinejoin.from(key), equals(value), reason: 'String "$key" did not map to $value');
      });
    });

    test('should return null for invalid strings', () {
      expect(SvgStrokeLinejoin.from('foo'), isNull);
    });

    test('should verify all enum values are covered in test', () {
      final Set<SvgStrokeLinejoin> mappedValues = expectedMapping.values.toSet();
      for (final SvgStrokeLinejoin join in SvgStrokeLinejoin.values) {
        expect(mappedValues.contains(join), isTrue, reason: 'Enum value $join is not covered by test expectations');
      }
    });
  });
}
