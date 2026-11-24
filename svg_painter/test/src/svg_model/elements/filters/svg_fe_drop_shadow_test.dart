import 'package:svg_painter/src/svg_model/attribute_groups/svg_core_attributes.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgFeDropShadow', () {
    test('should store properties correctly when instantiated with custom values', () {
      // Arrange & Act
      const dropShadow = SvgFeDropShadow(
        dx: 12.0,
        dy: 14.0,
        stdDeviationX: 5.5,
        stdDeviationY: 7.5,
        floodColor: SvgNamedColor(SvgColorName.cyan),
        floodOpacity: 0.85,
        inSource: 'SourceAlpha',
        result: 'dropShadowResult',
        coreAttributes: SvgCoreAttributes(id: 'ds1'),
      );

      // Assert
      expect(dropShadow.dx, 12.0);
      expect(dropShadow.dy, 14.0);
      expect(dropShadow.stdDeviationX, 5.5);
      expect(dropShadow.stdDeviationY, 7.5);
      expect(dropShadow.floodColor, const SvgNamedColor(SvgColorName.cyan));
      expect(dropShadow.floodOpacity, 0.85);
      expect(dropShadow.inSource, 'SourceAlpha');
      expect(dropShadow.result, 'dropShadowResult');
      expect(dropShadow.id, 'ds1');
    });

    test('should have default values when instantiated without arguments', () {
      // Arrange & Act
      const dropShadow = SvgFeDropShadow();

      // Assert
      expect(dropShadow.dx, 2.0);
      expect(dropShadow.dy, 2.0);
      expect(dropShadow.stdDeviationX, 2.0);
      expect(dropShadow.stdDeviationY, 2.0);
      expect(dropShadow.floodColor, const SvgNamedColor(SvgColorName.black));
      expect(dropShadow.floodOpacity, 1.0);
      expect(dropShadow.inSource, isNull);
      expect(dropShadow.result, isNull);
    });
  });
}
