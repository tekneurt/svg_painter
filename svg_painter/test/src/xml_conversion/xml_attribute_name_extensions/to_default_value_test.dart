import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:svg_painter/src/xml_conversion/xml_attribute_name_extensions/to_default_value.dart';
import 'package:svg_painter/src/xml_model/xml_attribute_name.dart';
import 'package:svg_painter/src/xml_model/xml_element_name.dart';
import 'package:test/test.dart';

void main() {
  group('ToDefaultValue', () {
    test('x should return 0.0 for rect, use, text, svg', () {
      // Arrange & Act & Assert
      expect(XmlAttributeName.x.toDefaultValue(XmlElementName.rect), const SvgLength(0.0));
      expect(XmlAttributeName.x.toDefaultValue(XmlElementName.use), const SvgLength(0.0));
      expect(XmlAttributeName.x.toDefaultValue(XmlElementName.text), const SvgLength(0.0));
      expect(XmlAttributeName.x.toDefaultValue(XmlElementName.svg), const SvgLength(0.0));
    });

    test('x should throw UnsupportedError for circle', () {
      // Arrange & Act & Assert
      expect(
        () => XmlAttributeName.x.toDefaultValue(XmlElementName.circle),
        throwsUnsupportedError,
      );
    });

    test('y1 should return 0% for linearGradient and 0.0 for line', () {
      // Arrange & Act & Assert
      expect(
        XmlAttributeName.y1.toDefaultValue(XmlElementName.linearGradient),
        const SvgPercentage(0.0),
      );
      expect(XmlAttributeName.y1.toDefaultValue(XmlElementName.line), const SvgLength(0.0));
    });

    test('x2 should return 100% for linearGradient and 0.0 for line', () {
      // Arrange & Act & Assert
      expect(
        XmlAttributeName.x2.toDefaultValue(XmlElementName.linearGradient),
        const SvgPercentage(100.0),
      );
      expect(XmlAttributeName.x2.toDefaultValue(XmlElementName.line), const SvgLength(0.0));
    });

    test('cx should return 0.0 for circle/ellipse and 50% for radialGradient', () {
      // Arrange & Act & Assert
      expect(XmlAttributeName.cx.toDefaultValue(XmlElementName.circle), const SvgLength(0.0));
      expect(XmlAttributeName.cx.toDefaultValue(XmlElementName.ellipse), const SvgLength(0.0));
      expect(
        XmlAttributeName.cx.toDefaultValue(XmlElementName.radialGradient),
        const SvgPercentage(50.0),
      );
    });

    test('r should return 0.0 for circle and 50% for radialGradient', () {
      // Arrange & Act & Assert
      expect(XmlAttributeName.r.toDefaultValue(XmlElementName.circle), const SvgLength(0.0));
      expect(
        XmlAttributeName.r.toDefaultValue(XmlElementName.radialGradient),
        const SvgPercentage(50.0),
      );
    });

    test('rx should return auto for ellipse/rect', () {
      // Arrange & Act & Assert
      expect(XmlAttributeName.rx.toDefaultValue(XmlElementName.ellipse), const SvgAuto());
      expect(XmlAttributeName.rx.toDefaultValue(XmlElementName.rect), const SvgAuto());
    });

    test('width should return auto for svg/rect/use', () {
      // Arrange & Act & Assert
      expect(XmlAttributeName.width.toDefaultValue(XmlElementName.svg), const SvgAuto());
      expect(XmlAttributeName.width.toDefaultValue(XmlElementName.rect), const SvgAuto());
      expect(XmlAttributeName.width.toDefaultValue(XmlElementName.use), const SvgAuto());
    });

    test('points should return empty SvgPointList', () {
      // Arrange & Act & Assert
      expect(
        XmlAttributeName.points.toDefaultValue(XmlElementName.polygon),
        const SvgPointList(<double>[]),
      );
    });

    test('fill should return none for line and black for others', () {
      // Arrange & Act & Assert
      expect(XmlAttributeName.fill.toDefaultValue(XmlElementName.line), const SvgNoneColor());
      expect(
        XmlAttributeName.fill.toDefaultValue(XmlElementName.circle),
        const SvgNamedColor(SvgColorName.black),
      );
    });

    test('stroke attributes should return correct defaults', () {
      // Arrange & Act & Assert
      expect(XmlAttributeName.stroke.toDefaultValue(XmlElementName.circle), const SvgNoneColor());
      expect(
        XmlAttributeName.strokeWidth.toDefaultValue(XmlElementName.circle),
        const SvgLength(1.0),
      );
      expect(
        XmlAttributeName.strokeLinecap.toDefaultValue(XmlElementName.circle),
        SvgStrokeLinecap.butt,
      );
      expect(
        XmlAttributeName.strokeLinejoin.toDefaultValue(XmlElementName.circle),
        SvgStrokeLinejoin.miter,
      );
    });

    test('gradient stop attributes should return correct defaults', () {
      // Arrange & Act & Assert
      expect(XmlAttributeName.offset.toDefaultValue(XmlElementName.stop), const SvgLength(0.0));
      expect(
        XmlAttributeName.stopColor.toDefaultValue(XmlElementName.stop),
        const SvgNamedColor(SvgColorName.black),
      );
      expect(
        XmlAttributeName.stopOpacity.toDefaultValue(XmlElementName.stop),
        const SvgLength(1.0),
      );
    });

    test('opacity attributes should return 1.0', () {
      // Arrange & Act & Assert
      expect(XmlAttributeName.opacity.toDefaultValue(XmlElementName.g), const SvgLength(1.0));
      expect(
        XmlAttributeName.fillOpacity.toDefaultValue(XmlElementName.path),
        const SvgLength(1.0),
      );
      expect(
        XmlAttributeName.strokeOpacity.toDefaultValue(XmlElementName.path),
        const SvgLength(1.0),
      );
    });

    test('radialGradient specific attributes should return correct defaults', () {
      // Arrange & Act & Assert
      expect(
        XmlAttributeName.fx.toDefaultValue(XmlElementName.radialGradient),
        const SvgPercentage(50.0),
      );
      expect(
        XmlAttributeName.fy.toDefaultValue(XmlElementName.radialGradient),
        const SvgPercentage(50.0),
      );
      expect(
        XmlAttributeName.fr.toDefaultValue(XmlElementName.radialGradient),
        const SvgPercentage(0.0),
      );
    });

    test('attributes without SvgBaseValue default should throw UnsupportedError', () {
      // Arrange & Act & Assert
      final List<XmlAttributeName> noDefaultAttrs = <XmlAttributeName>[
        XmlAttributeName.viewBox,
        XmlAttributeName.id,
        XmlAttributeName.d,
        XmlAttributeName.className,
        XmlAttributeName.style,
        XmlAttributeName.href,
        XmlAttributeName.transform,
        XmlAttributeName.gradientTransform,
        XmlAttributeName.fontSize,
        XmlAttributeName.fontWeight,
        XmlAttributeName.fontStyle,
        XmlAttributeName.fontFamily,
        XmlAttributeName.pathLength,
        XmlAttributeName.strokeDasharray,
      ];

      for (final XmlAttributeName attr in noDefaultAttrs) {
        expect(
          () => attr.toDefaultValue(XmlElementName.svg),
          throwsUnsupportedError,
          reason: '$attr should throw UnsupportedError',
        );
      }
    });

    test('invalid element combinations should throw UnsupportedError', () {
      // Arrange & Act & Assert
      // x/y with circle
      expect(
        () => XmlAttributeName.x.toDefaultValue(XmlElementName.circle),
        throwsUnsupportedError,
      );
      // x1 with rect
      expect(() => XmlAttributeName.x1.toDefaultValue(XmlElementName.rect), throwsUnsupportedError);
      // x2 with path
      expect(() => XmlAttributeName.x2.toDefaultValue(XmlElementName.path), throwsUnsupportedError);
      // cx with path
      expect(() => XmlAttributeName.cx.toDefaultValue(XmlElementName.path), throwsUnsupportedError);
      // r with path
      expect(() => XmlAttributeName.r.toDefaultValue(XmlElementName.path), throwsUnsupportedError);
      // rx with path
      expect(() => XmlAttributeName.rx.toDefaultValue(XmlElementName.path), throwsUnsupportedError);
      // width with path
      expect(
        () => XmlAttributeName.width.toDefaultValue(XmlElementName.path),
        throwsUnsupportedError,
      );
      // fx with linearGradient
      expect(
        () => XmlAttributeName.fx.toDefaultValue(XmlElementName.linearGradient),
        throwsUnsupportedError,
      );
      // fr with linearGradient
      expect(
        () => XmlAttributeName.fr.toDefaultValue(XmlElementName.linearGradient),
        throwsUnsupportedError,
      );
    });
  });
}
