import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:svg_painter/src/xml_conversion/xml_element_extensions/to_svg_circle.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
  group('ToSvgCircle', () {
    test('should convert <circle> with attributes when valid XML is provided', () {
      // Arrange
      final XmlDocument document = XmlDocument.parse(
        '<circle cx="10" cy="20" r="5" fill="red" stroke="blue" stroke-width="2.5" />',
      );
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgElement> result = element.toSvgCircle();

      // Assert
      expect(result, isA<Success<SvgElement>>());
      final SvgCircle circle = (result as Success<SvgElement>).value as SvgCircle;
      expect((circle.cx as SvgLength).value, 10.0);
      expect((circle.cy as SvgLength).value, 20.0);
      expect((circle.r as SvgLength).value, 5.0);
      expect(circle.fill, isA<SvgNamedColor>());
      expect(circle.stroke?.color, isA<SvgNamedColor>());
      expect((circle.stroke!.width! as SvgLength).value, 2.5);
    });

    test('should return Success with default values when no attributes are provided', () {
      // Arrange
      final XmlDocument document = XmlDocument.parse('<circle />');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgElement> result = element.toSvgCircle();

      // Assert
      expect(result, isA<Success<SvgElement>>());
      final SvgCircle circle = (result as Success<SvgElement>).value as SvgCircle;
      expect((circle.cx as SvgLength).value, 0.0);
      expect((circle.cy as SvgLength).value, 0.0);
      expect((circle.r as SvgLength).value, 0.0);
    });
  });
}
