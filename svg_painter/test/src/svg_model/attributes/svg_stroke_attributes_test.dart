import 'package:svg_painter/src/svg_model/attributes/svg_stroke_attributes.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgStrokeAttributes', () {
    test('should return correct string representation when toString() is called', () {
      // Arrange
      const SvgStrokeAttributes attrs = SvgStrokeAttributes(
        color: SvgNamedColor(SvgColorName.red),
        opacity: SvgPercentage(50.0),
        width: SvgLength(2.0),
      );

      // Act
      final String result = attrs.toString();

      // Assert
      expect(
        result,
        'SvgStrokeAttributes(color: SvgNamedColor(red), opacity: 50.0%, width: 2.0, dashArray: null, linecap: null, linejoin: null)',
      );
    });
  });
}
