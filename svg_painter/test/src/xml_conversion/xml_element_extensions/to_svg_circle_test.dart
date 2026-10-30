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
      final document = XmlDocument.parse(
        '<circle cx="11" cy="22" r="33" fill="red" stroke="blue" stroke-width="2.5" />',
      );
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgElement> result = element.toSvgCircle();

      // Assert
      expect(
        result,
        isA<Success<SvgElement>>().having(
          (Success<SvgElement> s) => s.value,
          'value',
          isA<SvgCircle>()
              .having((SvgCircle c) => (c.cx as SvgLength).value, 'cx', 11.0)
              .having((SvgCircle c) => (c.cy as SvgLength).value, 'cy', 22.0)
              .having((SvgCircle c) => (c.r as SvgLength).value, 'r', 33.0)
              .having((SvgCircle c) => c.fillAttributes?.color, 'fill', isA<SvgNamedColor>())
              .having(
                (SvgCircle c) => c.strokeAttributes?.color,
                'stroke color',
                isA<SvgNamedColor>(),
              )
              .having(
                (SvgCircle c) => (c.strokeAttributes?.width as SvgLength?)?.value,
                'stroke width',
                2.5,
              ),
        ),
      );
    });

    test('should return Success with default values when no attributes are provided', () {
      // Arrange
      final document = XmlDocument.parse('<circle />');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgElement> result = element.toSvgCircle();

      // Assert
      expect(
        result,
        isA<Success<SvgElement>>().having(
          (Success<SvgElement> s) => s.value,
          'value',
          isA<SvgCircle>()
              .having((SvgCircle c) => (c.cx as SvgLength).value, 'cx', 0.0)
              .having((SvgCircle c) => (c.cy as SvgLength).value, 'cy', 0.0)
              .having((SvgCircle c) => (c.r as SvgLength).value, 'r', 0.0),
        ),
      );
    });

    test('should extract title and desc when child elements are present', () {
      // Arrange
      final document = XmlDocument.parse(
        '<circle cx="15" cy="25" r="35"><title id="t-circle">Circle Title</title><desc id="d-circle">Circle Desc</desc></circle>',
      );
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgElement> result = element.toSvgCircle();

      // Assert
      expect(
        result,
        isA<Success<SvgElement>>().having(
          (Success<SvgElement> s) => s.value,
          'value',
          isA<SvgCircle>()
              .having((SvgCircle c) => c.title?.content, 'title content', 'Circle Title')
              .having((SvgCircle c) => c.title?.id, 'title id', 't-circle')
              .having((SvgCircle c) => c.desc?.content, 'desc content', 'Circle Desc')
              .having((SvgCircle c) => c.desc?.id, 'desc id', 'd-circle'),
        ),
      );
    });
  });
}
