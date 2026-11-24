import 'package:svg_painter/src/svg_model/attribute_groups/svg_core_attributes.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgFeFlood', () {
    test('should store properties correctly when instantiated with custom values', () {
      // Arrange & Act
      const flood = SvgFeFlood(
        floodColor: SvgNamedColor(SvgColorName.green),
        floodOpacity: 0.65,
        x: SvgLength(15.0),
        y: SvgLength(25.0),
        width: SvgLength(110.0),
        height: SvgLength(120.0),
        inSource: 'SourceGraphic',
        result: 'floodResult',
        coreAttributes: SvgCoreAttributes(id: 'flood1'),
      );

      // Assert
      expect(flood.floodColor, const SvgNamedColor(SvgColorName.green));
      expect(flood.floodOpacity, 0.65);
      expect(flood.x, const SvgLength(15.0));
      expect(flood.y, const SvgLength(25.0));
      expect(flood.width, const SvgLength(110.0));
      expect(flood.height, const SvgLength(120.0));
      expect(flood.inSource, 'SourceGraphic');
      expect(flood.result, 'floodResult');
      expect(flood.id, 'flood1');
    });

    test('should have default values when instantiated without arguments', () {
      // Arrange & Act
      const flood = SvgFeFlood();

      // Assert
      expect(flood.floodColor, const SvgNamedColor(SvgColorName.black));
      expect(flood.floodOpacity, 1.0);
      expect(flood.x, isNull);
      expect(flood.y, isNull);
      expect(flood.width, isNull);
      expect(flood.height, isNull);
      expect(flood.inSource, isNull);
      expect(flood.result, isNull);
    });
  });
}
