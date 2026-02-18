import 'package:svg_painter/src/svg_conversion/converters/svg_painting_context.dart';
import 'package:svg_painter/src/svg_model/_svg_model.dart';
import 'package:test/test.dart';

void main() {
  group('SvgPaintingContext', () {
    const SvgPaintingContext initial = SvgPaintingContext(
      viewBoxWidth: 100,
      viewBoxHeight: 100,
    );

    test('should initialize with standard SVG defaults', () {
      expect(initial.inheritedFill, equals(const SvgNamedColor(SvgColorName.black)));
      expect(initial.inheritedStroke, equals(const SvgNoneColor()));
      expect(initial.inheritedStrokeWidth, equals(const SvgLength(1.0)));
      expect(initial.parentOpacity, equals(1.0));
    });

    test('deriveWith should correctly override and inherit styles', () {
      // Arrange
      const SvgGroup element = SvgGroup(
        children: <SvgElement>[],
        fillAttributes: SvgFillAttributes(color: SvgNamedColor(SvgColorName.red)),
        opacity: SvgPercentage(50),
      );

      // Act
      final SvgPaintingContext derived = initial.deriveWith(element);

      // Assert
      expect(derived.inheritedFill, equals(const SvgNamedColor(SvgColorName.red)));
      expect(derived.parentOpacity, equals(0.5));
      // Should inherit stroke from parent
      expect(derived.inheritedStroke, equals(const SvgNoneColor()));
    });

    test('deriveWith should accumulate opacity', () {
      // Arrange
      final SvgPaintingContext context = initial.derive(parentOpacity: 0.5);
      const SvgGroup element = SvgGroup(children: <SvgElement>[], opacity: SvgPercentage(50));

      // Act
      final SvgPaintingContext derived = context.deriveWith(element);

      // Assert
      expect(derived.parentOpacity, equals(0.25));
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
