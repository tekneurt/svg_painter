import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:svg_painter/src/xml_conversion/xml_element_extensions/to_svg_stop.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
  group('ToSvgStop', () {
    test('should return Success with SvgStop when valid XML is provided', () {
      // Arrange
      final document = XmlDocument.parse(
        '<stop offset="50%" stop-color="red" stop-opacity="0.5" id="stop1" />',
      );
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgStop> result = element.toSvgStop();

      // Assert
      expect(result, isA<Success<SvgStop>>());
      final SvgStop stop = (result as Success<SvgStop>).value;
      expect(stop.offset, isA<SvgPercentage>());
      expect((stop.offset as SvgPercentage).value, 50.0);
      switch (stop.stopColor) {
        case final SvgNamedColor c:
          expect(c.name, SvgColorName.red);
        default:
          fail('Expected SvgNamedColor');
      }
      switch (stop.stopOpacity) {
        case final SvgLength l:
          expect(l.value, 0.5);
        default:
          fail('Expected SvgLength');
      }
      expect(stop.id, 'stop1');
    });

    test('should return Success with null stopColor and stopOpacity when minimal stop is provided', () {
      // Arrange
      final document = XmlDocument.parse('<stop />');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgStop> result = element.toSvgStop();

      // Assert
      expect(result, isA<Success<SvgStop>>());
      final SvgStop stop = (result as Success<SvgStop>).value;
      expect((stop.offset as SvgLength).value, 0.0);
      expect(stop.stopColor, isNull);
      expect(stop.stopOpacity, isNull);
    });

    test('should preserve class and inline style in coreAttributes', () {
      // Arrange
      final document = XmlDocument.parse(
        '<stop offset="25%" class="stop1" style="stop-color: blue;" />',
      );
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgStop> result = element.toSvgStop();

      // Assert
      expect(result, isA<Success<SvgStop>>());
      final SvgStop stop = (result as Success<SvgStop>).value;
      expect(stop.coreAttributes?.cssClass, 'stop1');
      expect(stop.coreAttributes?.inlineStyle, 'stop-color: blue;');
    });

    test('should parse color attribute when color is provided', () {
      // Arrange
      final document = XmlDocument.parse(
        '<stop offset="50%" stop-color="currentColor" color="green" />',
      );
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgStop> result = element.toSvgStop();

      // Assert
      expect(result, isA<Success<SvgStop>>());
      final SvgStop stop = (result as Success<SvgStop>).value;
      expect(
        stop.color,
        isA<SvgNamedColor>().having(
          (SvgNamedColor c) => c.name,
          'name',
          SvgColorName.green,
        ),
      );
    });

    test('should inherit stopColor from ancestor when stopColor is inherit', () {
      // Arrange
      final document = XmlDocument.parse(
        '<g stop-color="#ff4488"><linearGradient stop-color="inherit"><stop offset="1" stop-color="inherit" /></linearGradient></g>',
      );
      final XmlElement stopElement = document.findAllElements('stop').first;

      // Act
      final Result<SvgStop> result = stopElement.toSvgStop();

      // Assert
      expect(result, isA<Success<SvgStop>>());
      final SvgStop stop = (result as Success<SvgStop>).value;
      expect(
        stop.stopColor,
        isA<SvgRgbColor>()
            .having((SvgRgbColor c) => c.red, 'red', 255)
            .having((SvgRgbColor c) => c.green, 'green', 68)
            .having((SvgRgbColor c) => c.blue, 'blue', 136),
      );
    });

    test('should inherit stopOpacity from ancestor when stopOpacity is inherit', () {
      // Arrange
      final document = XmlDocument.parse(
        '<g stop-opacity="0.75"><linearGradient stop-opacity="inherit"><stop offset="1" stop-opacity="inherit" /></linearGradient></g>',
      );
      final XmlElement stopElement = document.findAllElements('stop').first;

      // Act
      final Result<SvgStop> result = stopElement.toSvgStop();

      // Assert
      expect(result, isA<Success<SvgStop>>());
      final SvgStop stop = (result as Success<SvgStop>).value;
      expect(
        stop.stopOpacity,
        isA<SvgLength>().having((SvgLength l) => l.value, 'value', 0.75),
      );
    });

    test('should inherit color from ancestor when color is not specified on stop', () {
      // Arrange
      final document = XmlDocument.parse(
        '<g color="yellow"><linearGradient><stop offset="1" stop-color="currentColor" /></linearGradient></g>',
      );
      final XmlElement stopElement = document.findAllElements('stop').first;

      // Act
      final Result<SvgStop> result = stopElement.toSvgStop();

      // Assert
      expect(result, isA<Success<SvgStop>>());
      final SvgStop stop = (result as Success<SvgStop>).value;
      expect(
        stop.color,
        isA<SvgNamedColor>().having((SvgNamedColor c) => c.name, 'name', SvgColorName.yellow),
      );
    });
  });
}
