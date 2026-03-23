import 'package:svg_painter/src/svg_conversion/converters/svg_painting_context.dart';
import 'package:svg_painter/src/svg_model/_svg_model.dart';
import 'package:test/test.dart';

void main() {
  group('SvgPaintingContext', () {
    const context = SvgPaintingContext(viewBoxWidth: 200, viewBoxHeight: 100);

    test('should hold basic properties', () {
      expect(context.viewBoxWidth, 200.0);
      expect(context.viewBoxHeight, 100.0);
      expect(context.viewBoxMinX, 0.0);
      expect(context.viewBoxMinY, 0.0);
    });

    test('should calculate viewBoxNormalizedDiagonal', () {
      // sqrt(200^2 + 100^2) / sqrt(2) = sqrt(50000) / sqrt(2) = sqrt(25000)
      expect(context.viewBoxNormalizedDiagonal, closeTo(158.113, 0.1));
    });

    test('should have default inherited properties', () {
      expect(context.inheritedFill, isA<SvgNamedColor>());
      expect(context.inheritedStroke, isA<SvgNoneColor>());
      expect(context.inheritedStrokeWidth, const SvgLength(1.0));
      expect(context.inheritedFontSize, const SvgLength(12.0));
      expect(context.inheritedFontWeight, isA<SvgFontWeightNormal>());
      expect(context.inheritedFontStyle, SvgFontStyle.normal);
      expect(context.inheritedFontFamily, const SvgFontFamily('sans-serif'));
      
      expect(context.inheritedFillOpacity, const SvgLength(1.0));
      expect(context.inheritedStrokeOpacity, const SvgLength(1.0));
      expect(context.inheritedStrokeDasharray, isNull);
      expect(context.inheritedStrokeLinecap, isNull);
      expect(context.inheritedStrokeLinejoin, isNull);
    });

    test('derive should keep styleSheet and definitions', () {
      const sheet = SvgStyleSheet({'c1': {'fill': 'red'}});
      final defs = {'r1': const SvgIgnoredElement()};
      final ctx = SvgPaintingContext(
        viewBoxWidth: 100,
        viewBoxHeight: 100,
        styleSheet: sheet,
        definitions: defs,
      );

      final SvgPaintingContext derived = ctx.derive(viewBoxWidth: 500);
      expect(derived.viewBoxWidth, 500.0);
      expect(derived.styleSheet, sheet);
      expect(derived.definitions, defs);
    });

    test('deriveWith should return same context if attributes are null', () {
      const element = SvgGroup(children: []);
      final SvgPaintingContext derived = context.deriveWith(element);
      expect(derived, same(context));
    });

    test('deriveWith should return same context if element is not presentable', () {
      const element = SvgIgnoredElement();
      final SvgPaintingContext derived = context.deriveWith(element);
      expect(derived, same(context));
    });
  });
}
