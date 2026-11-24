import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/svg_model/attribute_groups/svg_transform_attributes.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:svg_painter/src/xml_conversion/xml_element_extensions/to_svg_linear_gradient.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
  group('ToSvgLinearGradient', () {
    test('should return Success with SvgLinearGradient when valid XML is provided', () {
      // Arrange
      final document = XmlDocument.parse('''
        <linearGradient x1="12%" y1="24%" x2="88%" y2="96%" id="grad1" gradientTransform="rotate(90)">
          <stop offset="0%" stop-color="white" />
          <stop offset="100%" stop-color="black" />
        </linearGradient>
      ''');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgLinearGradient> result = element.toSvgLinearGradient();

      // Assert
      expect(result, isA<Success<SvgLinearGradient>>());
      final SvgLinearGradient grad = (result as Success<SvgLinearGradient>).value;
      expect(
        grad.x1,
        isA<SvgPercentage>().having((SvgPercentage p) => p.value, 'value', 12.0),
      );
      expect(
        grad.y1,
        isA<SvgPercentage>().having((SvgPercentage p) => p.value, 'value', 24.0),
      );
      expect(
        grad.x2,
        isA<SvgPercentage>().having((SvgPercentage p) => p.value, 'value', 88.0),
      );
      expect(
        grad.y2,
        isA<SvgPercentage>().having((SvgPercentage p) => p.value, 'value', 96.0),
      );
      expect(grad.id, 'grad1');
      expect(grad.gradientTransformAttributes?.operations.first, isA<SvgRotate>());
      expect(grad.stops, hasLength(2));
    });

    test('should return Success with null coordinates when minimal gradient is provided', () {
      // Arrange
      final document = XmlDocument.parse('<linearGradient />');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgLinearGradient> result = element.toSvgLinearGradient();

      // Assert
      expect(result, isA<Success<SvgLinearGradient>>());
      final SvgLinearGradient grad = (result as Success<SvgLinearGradient>).value;
      expect(grad.x1, isNull);
      expect(grad.y1, isNull);
      expect(grad.x2, isNull);
      expect(grad.y2, isNull);
      expect(grad.gradientUnits, isNull);
      expect(grad.spreadMethod, isNull);
      expect(grad.href, isNull);
      expect(grad.stops, isEmpty);
    });

    test('should parse href attribute when href is provided', () {
      // Arrange
      final document = XmlDocument.parse('<linearGradient id="g2" href="#g1" />');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgLinearGradient> result = element.toSvgLinearGradient();

      // Assert
      expect(result, isA<Success<SvgLinearGradient>>());
      final SvgLinearGradient grad = (result as Success<SvgLinearGradient>).value;
      expect(grad.id, 'g2');
      expect(grad.href, '#g1');
    });

    test('should parse xlink:href attribute when xlink:href is provided', () {
      // Arrange
      final document = XmlDocument.parse(
        '<linearGradient id="g2" xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#g1" />',
      );
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgLinearGradient> result = element.toSvgLinearGradient();

      // Assert
      expect(result, isA<Success<SvgLinearGradient>>());
      final SvgLinearGradient grad = (result as Success<SvgLinearGradient>).value;
      expect(grad.id, 'g2');
      expect(grad.href, '#g1');
    });

    test('should parse color attribute when color is provided', () {
      // Arrange
      final document = XmlDocument.parse('''
        <linearGradient id="grad1" color="green">
          <stop offset="0%" stop-color="white" />
        </linearGradient>
      ''');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgLinearGradient> result = element.toSvgLinearGradient();

      // Assert
      expect(result, isA<Success<SvgLinearGradient>>());
      final SvgLinearGradient grad = (result as Success<SvgLinearGradient>).value;
      expect(
        grad.color,
        isA<SvgNamedColor>().having(
          (SvgNamedColor c) => c.name,
          'name',
          SvgColorName.green,
        ),
      );
    });
  });
}
