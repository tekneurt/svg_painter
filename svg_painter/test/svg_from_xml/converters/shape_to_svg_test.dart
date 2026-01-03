import 'package:svg_painter/src/base/_base.dart';
import 'package:svg_painter/src/svg_model/_svg_model.dart';
import 'package:svg_painter/src/xml_conversion/_xml_conversion.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
  group('Shape XML Conversion', () {
    group('ToSvgCircle', () {
      test('should convert <circle> with attributes when valid XML is provided', () {
        // Arrange
        final XmlDocument document = XmlDocument.parse(
          '<circle cx="10" cy="20" r="5" fill="red" stroke="blue" stroke-width="2" />',
        );
        final XmlElement element = document.rootElement;

        // Act
        final Result<SvgElement> result = element.toSvgElement();

        // Assert
        expect(result, isA<Success<SvgElement>>());
        final SvgCircle circle = (result as Success<SvgElement>).value as SvgCircle;
        expect((circle.cx as SvgLength).value, 10.0);
        expect((circle.cy as SvgLength).value, 20.0);
        expect((circle.r as SvgLength).value, 5.0);
        expect(circle.fill, isA<SvgNamedColor>());
        expect(circle.stroke?.color, isA<SvgNamedColor>());
        expect((circle.stroke!.width! as SvgLength).value, 2.0);
      });

      test('should return Success with default values when no attributes are provided', () {
        // Arrange
        final XmlDocument document = XmlDocument.parse('<circle />');
        final XmlElement element = document.rootElement;

        // Act
        final Result<SvgElement> result = element.toSvgElement();

        // Assert
        expect(result, isA<Success<SvgElement>>());
        final SvgCircle circle = (result as Success<SvgElement>).value as SvgCircle;
        expect((circle.cx as SvgLength).value, 0.0);
        expect((circle.cy as SvgLength).value, 0.0);
        expect((circle.r as SvgLength).value, 0.0);
      });
    });

    group('ToSvgEllipse', () {
      test('should convert <ellipse> with lengths when valid XML is provided', () {
        // Arrange
        final XmlDocument document = XmlDocument.parse(
          '<ellipse cx="100" cy="50" rx="40" ry="20" />',
        );
        final XmlElement element = document.rootElement;

        // Act
        final Result<SvgElement> result = element.toSvgElement();

        // Assert
        expect(result, isA<Success<SvgElement>>());
        final SvgEllipse ellipse = (result as Success<SvgElement>).value as SvgEllipse;
        expect((ellipse.cx as SvgLength).value, 100.0);
        expect((ellipse.cy as SvgLength).value, 50.0);
        expect((ellipse.rx as SvgLength).value, 40.0);
        expect((ellipse.ry as SvgLength).value, 20.0);
      });

      test('should return Success with auto for radii when not provided', () {
        // Arrange
        final XmlDocument document = XmlDocument.parse('<ellipse />');
        final XmlElement element = document.rootElement;

        // Act
        final Result<SvgElement> result = element.toSvgElement();

        // Assert
        final SvgEllipse ellipse = (result as Success<SvgElement>).value as SvgEllipse;
        expect(ellipse.rx, isA<SvgAuto>());
        expect(ellipse.ry, isA<SvgAuto>());
      });
    });

    group('ToSvgLine', () {
      test('should convert <line> with coordinates when valid XML is provided', () {
        // Arrange
        final XmlDocument document = XmlDocument.parse(
          '<line x1="0" y1="0" x2="100" y2="100" stroke="black" />',
        );
        final XmlElement element = document.rootElement;

        // Act
        final Result<SvgElement> result = element.toSvgElement();

        // Assert
        expect(result, isA<Success<SvgElement>>());
        final SvgLine line = (result as Success<SvgElement>).value as SvgLine;
        expect((line.x1 as SvgLength).value, 0.0);
        expect((line.y1 as SvgLength).value, 0.0);
        expect((line.x2 as SvgLength).value, 100.0);
        expect((line.y2 as SvgLength).value, 100.0);
      });
    });

    group('ToSvgRect', () {
      test('should convert <rect> with all attributes when valid XML is provided', () {
        // Arrange
        final XmlDocument document = XmlDocument.parse(
          '<rect x="10" y="20" width="100" height="50" rx="5" ry="5" fill="green" />',
        );
        final XmlElement element = document.rootElement;

        // Act
        final Result<SvgElement> result = element.toSvgElement();

        // Assert
        expect(result, isA<Success<SvgElement>>());
        final SvgRect rect = (result as Success<SvgElement>).value as SvgRect;
        expect((rect.x as SvgLength).value, 10.0);
        expect((rect.y as SvgLength).value, 20.0);
        expect((rect.width as SvgLength).value, 100.0);
        expect((rect.height as SvgLength).value, 50.0);
        expect((rect.rx as SvgLength).value, 5.0);
        expect((rect.ry as SvgLength).value, 5.0);
      });

      test('should return Success with default values when minimal rect is provided', () {
        // Arrange
        final XmlDocument document = XmlDocument.parse('<rect />');
        final XmlElement element = document.rootElement;

        // Act
        final Result<SvgElement> result = element.toSvgElement();

        // Assert
        final SvgRect rect = (result as Success<SvgElement>).value as SvgRect;
        expect((rect.x as SvgLength).value, 0.0);
        expect((rect.y as SvgLength).value, 0.0);
        expect(rect.width, isA<SvgAuto>());
        expect(rect.height, isA<SvgAuto>());
      });
    });
  });
}
