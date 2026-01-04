import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgElement', () {
    test('should return correct string representation when toString() is called', () {
      // Arrange
      const SvgCircle element = SvgCircle(
        cx: SvgLength(10.0),
        cy: SvgLength(20.0),
        r: SvgLength(5.0),
        id: 'circle1',
      );

      // Act
      final String result = element.toString();

      // Assert
      expect(result, 'SvgCircle(cx: 10.0, cy: 20.0, r: 5.0, id: circle1)');
    });
  });

  group('SvgGraphicsElement', () {
    test('should return correct string representation when toString() is called', () {
      // Arrange
      const SvgPath element = SvgPath(d: 'M 0 0 L 10 10', id: 'path1');

      // Act
      final String result = element.toString();

      // Assert
      expect(result, 'SvgPath(d: M 0 0 L 10 10, id: path1)');
    });

    test('should return correct base string representation for shape', () {
      // Arrange
      const SvgRect element = SvgRect(
        x: SvgLength(1),
        y: SvgLength(2),
        width: SvgLength(3),
        height: SvgLength(4),
        rx: SvgAuto(),
        ry: SvgAuto(),
        fill: SvgNamedColor(SvgColorName.red),
        id: 'r1',
      );

      // Act
      final String result = element.toString();

      // Assert
      expect(
        result,
        contains('SvgRect(x: 1.0, y: 2.0, w: 3.0, h: 4.0, rx: auto, ry: auto, id: r1)'),
      );
    });
  });

  group('SvgStyle', () {
    test('should return correct string representation when toString() is called', () {
      // Arrange
      const SvgStyle element = SvgStyle(id: 's1');

      // Act
      final String result = element.toString();

      // Assert
      expect(result, 'SvgStyle(id: s1)');
    });
  });

  group('Metadata elements', () {
    test('SvgTitle should return correct string representation', () {
      // Arrange
      const SvgTitle element = SvgTitle(content: 'title1', id: 't1');

      // Act
      final String result = element.toString();

      // Assert
      expect(result, 'SvgTitle(content: title1, id: t1)');
    });

    test('SvgDesc should return correct string representation', () {
      // Arrange
      const SvgDesc element = SvgDesc(content: 'desc1', id: 'd1');

      // Act
      final String result = element.toString();

      // Assert
      expect(result, 'SvgDesc(content: desc1, id: d1)');
    });
  });
}
