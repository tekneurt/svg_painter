import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgVectorEffect', () {
    test('should have correct enum values when inspected', () {
      // Arrange & Act & Assert
      expect(SvgVectorEffect.values, hasLength(2));
      expect(SvgVectorEffect.none.value, 'none');
      expect(SvgVectorEffect.nonScalingStroke.value, 'non-scaling-stroke');
    });

    test('should return correct enum when valid string provided to from', () {
      // Arrange & Act
      final SvgVectorEffect? none = SvgVectorEffect.from('none');
      final SvgVectorEffect? nonScalingStroke = SvgVectorEffect.from('non-scaling-stroke');

      // Assert
      expect(none, SvgVectorEffect.none);
      expect(nonScalingStroke, SvgVectorEffect.nonScalingStroke);
    });

    test('should return null when null or unknown string provided to from', () {
      // Arrange & Act
      final SvgVectorEffect? nullResult = SvgVectorEffect.from(null);
      final SvgVectorEffect? unknownResult = SvgVectorEffect.from('unknown');

      // Assert
      expect(nullResult, isNull);
      expect(unknownResult, isNull);
    });

    test('should return correct string representation when toString is called', () {
      // Arrange & Act & Assert
      expect(SvgVectorEffect.none.toString(), 'SvgVectorEffect.none');
      expect(SvgVectorEffect.nonScalingStroke.toString(), 'SvgVectorEffect.nonScalingStroke');
    });
  });
}
