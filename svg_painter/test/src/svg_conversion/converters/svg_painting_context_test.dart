import 'package:svg_painter/src/svg_conversion/converters/svg_painting_context.dart';
import 'package:svg_painter/src/svg_model/_svg_model.dart';
import 'package:test/test.dart';

void main() {
  group('SvgPaintingContext', () {
    const SvgPaintingContext initial = SvgPaintingContext(viewBoxWidth: 100, viewBoxHeight: 100);

    test('should initialize with standard SVG defaults', () {
      expect(initial.inheritedFill, equals(const SvgNamedColor(SvgColorName.black)));
      expect(initial.inheritedStroke, equals(const SvgNoneColor()));
      expect(initial.inheritedStrokeWidth, equals(const SvgLength(1.0)));
    });

    test('deriveWith should correctly override and inherit styles', () {
      // Arrange
      const SvgGroup element = SvgGroup(
        children: <SvgElement>[],
        presentationAttributes: SvgPresentationAttributes(
          fill: SvgFillAttributes(color: SvgNamedColor(SvgColorName.red)),
          graphics: SvgGraphicsAttributes(opacity: SvgPercentage(50)),
        ),
      );

      // Act
      final SvgPaintingContext derived = initial.deriveWith(element);

      // Assert
      expect(derived.inheritedFill, equals(const SvgNamedColor(SvgColorName.red)));
      // Should inherit stroke from parent
      expect(derived.inheritedStroke, equals(const SvgNoneColor()));
    });

    test('deriveWith should handle non-graphics elements by returning same context', () {
      // Arrange
      const SvgTitle element = SvgTitle(content: 'test');

      // Act
      final SvgPaintingContext derived = initial.deriveWith(element);

      // Assert
      expect(identical(derived, initial), isTrue);
    });
  });
}
