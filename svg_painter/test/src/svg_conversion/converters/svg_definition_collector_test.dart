import 'package:svg_painter/src/svg_conversion/converters/svg_definition_collector.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgElementToDefinitions', () {
    test('should collect definitions from SvgSvg and its children', () {
      // Arrange
      const SvgCircle circle = SvgCircle(cx: SvgLength(0), cy: SvgLength(0), r: SvgLength(10), id: 'c1');
      const SvgRect rect = SvgRect(
        x: SvgLength(1),
        y: SvgLength(2),
        width: SvgLength(10),
        height: SvgLength(20),
        rx: SvgAuto(),
        ry: SvgAuto(),
        id: 'r1',
      );
      const SvgSvg root = SvgSvg(children: <SvgElement>[circle, rect], id: 'root');
      final Map<String, SvgElement> map = <String, SvgElement>{};

      // Act
      root.collectDefinitions(map);

      // Assert
      expect(map, hasLength(3));
      expect(map['root'], root);
      expect(map['c1'], circle);
      expect(map['r1'], rect);
    });

    test('should collect definitions from SvgDefs and its children', () {
      // Arrange
      const SvgLinearGradient grad = SvgLinearGradient(
        x1: SvgLength(0.1),
        y1: SvgLength(0.2),
        x2: SvgLength(0.3),
        y2: SvgLength(0.4),
        id: 'g1',
        stops: <SvgStop>[],
      );
      const SvgDefs defs = SvgDefs(children: <SvgElement>[grad], id: 'defs1');
      final Map<String, SvgElement> map = <String, SvgElement>{};

      // Act
      defs.collectDefinitions(map);

      // Assert
      expect(map, hasLength(2));
      expect(map['defs1'], defs);
      expect(map['g1'], grad);
    });

    test('should not add to map if id is null', () {
      // Arrange
      const SvgCircle circle = SvgCircle(cx: SvgLength(0), cy: SvgLength(0), r: SvgLength(10));
      final Map<String, SvgElement> map = <String, SvgElement>{};

      // Act
      circle.collectDefinitions(map);

      // Assert
      expect(map, isEmpty);
    });
  });
}
