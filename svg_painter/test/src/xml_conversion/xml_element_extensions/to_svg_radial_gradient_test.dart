import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:svg_painter/src/xml_conversion/xml_element_extensions/to_svg_radial_gradient.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
  group('ToSvgRadialGradient', () {
    test('should return Success with SvgRadialGradient when valid XML is provided', () {
      // Arrange
      final document = XmlDocument.parse('''
        <radialGradient cx="50%" cy="60%" r="40%" fx="25%" fy="35%" fr="10%" id="rad1">
          <stop offset="0%" stop-color="red" />
        </radialGradient>
      ''');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgRadialGradient> result = element.toSvgRadialGradient();

      // Assert
      expect(result, isA<Success<SvgRadialGradient>>());
      final SvgRadialGradient grad = (result as Success<SvgRadialGradient>).value;
      expect(
        grad.cx,
        isA<SvgPercentage>().having((SvgPercentage p) => p.value, 'value', 50.0),
      );
      expect(
        grad.cy,
        isA<SvgPercentage>().having((SvgPercentage p) => p.value, 'value', 60.0),
      );
      expect(
        grad.r,
        isA<SvgPercentage>().having((SvgPercentage p) => p.value, 'value', 40.0),
      );
      expect(
        grad.fx,
        isA<SvgPercentage>().having((SvgPercentage p) => p.value, 'value', 25.0),
      );
      expect(
        grad.fy,
        isA<SvgPercentage>().having((SvgPercentage p) => p.value, 'value', 35.0),
      );
      expect(
        grad.fr,
        isA<SvgPercentage>().having((SvgPercentage p) => p.value, 'value', 10.0),
      );
      expect(grad.stops, hasLength(1));
    });

    test('should return Success with null coordinates when minimal gradient is provided', () {
      // Arrange
      final document = XmlDocument.parse('<radialGradient />');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgRadialGradient> result = element.toSvgRadialGradient();

      // Assert
      expect(result, isA<Success<SvgRadialGradient>>());
      final SvgRadialGradient grad = (result as Success<SvgRadialGradient>).value;
      expect(grad.cx, isNull);
      expect(grad.cy, isNull);
      expect(grad.r, isNull);
      expect(grad.fx, isNull);
      expect(grad.fy, isNull);
      expect(grad.fr, isNull);
      expect(grad.gradientUnits, isNull);
      expect(grad.spreadMethod, isNull);
      expect(grad.href, isNull);
    });

    test('should parse href attribute when href is provided', () {
      // Arrange
      final document = XmlDocument.parse('<radialGradient id="r2" href="#r1" />');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgRadialGradient> result = element.toSvgRadialGradient();

      // Assert
      expect(result, isA<Success<SvgRadialGradient>>());
      final SvgRadialGradient grad = (result as Success<SvgRadialGradient>).value;
      expect(grad.id, 'r2');
      expect(grad.href, '#r1');
    });

    test('should parse xlink:href attribute when xlink:href is provided', () {
      // Arrange
      final document = XmlDocument.parse(
        '<radialGradient id="r2" xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#r1" />',
      );
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgRadialGradient> result = element.toSvgRadialGradient();

      // Assert
      expect(result, isA<Success<SvgRadialGradient>>());
      final SvgRadialGradient grad = (result as Success<SvgRadialGradient>).value;
      expect(grad.id, 'r2');
      expect(grad.href, '#r1');
    });

    test('should parse color attribute when color is provided', () {
      // Arrange
      final document = XmlDocument.parse('''
        <radialGradient id="rad1" color="blue">
          <stop offset="0%" stop-color="white" />
        </radialGradient>
      ''');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgRadialGradient> result = element.toSvgRadialGradient();

      // Assert
      expect(result, isA<Success<SvgRadialGradient>>());
      final SvgRadialGradient grad = (result as Success<SvgRadialGradient>).value;
      expect(
        grad.color,
        isA<SvgNamedColor>().having(
          (SvgNamedColor c) => c.name,
          'name',
          SvgColorName.blue,
        ),
      );
    });
  });
}
