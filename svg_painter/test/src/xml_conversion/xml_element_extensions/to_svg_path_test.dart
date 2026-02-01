import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:svg_painter/src/xml_conversion/xml_element_extensions/to_svg_path.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
  group('ToSvgPath', () {
    test('should return Success with SvgPath when valid d attribute is provided', () {
      // Arrange
      final XmlDocument document = XmlDocument.parse('<path d="M 11 22 L 33 44" />');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgPath> result = element.toSvgPath();

      // Assert
      expect(
        result,
        isA<Success<SvgPath>>().having((Success<SvgPath> s) => s.value.d, 'd', 'M 11 22 L 33 44'),
      );
    });

    test('should return Failure when d attribute is missing', () {
      // Arrange
      final XmlDocument document = XmlDocument.parse('<path />');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgPath> result = element.toSvgPath();

      // Assert
      expect(
        result,
        isA<Failure<SvgPath>>().having(
          (Failure<SvgPath> f) => f.message,
          'message',
          contains('must have a "d" attribute'),
        ),
      );
    });

    test('should map common attributes when provided', () {
      // Arrange
      final XmlDocument document = XmlDocument.parse(
        '<path d="M1 2" id="path1" fill="red" stroke="blue" opacity="45%" />',
      );
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgPath> result = element.toSvgPath();

      // Assert
      expect(
        result,
        isA<Success<SvgPath>>().having(
          (Success<SvgPath> s) => s.value,
          'value',
          isA<SvgPath>()
              .having((SvgPath p) => p.id, 'id', 'path1')
              .having((SvgPath p) => p.fill, 'fill', isA<SvgNamedColor>())
              .having((SvgPath p) => p.stroke?.color, 'stroke color', isA<SvgNamedColor>())
              .having((SvgPath p) => (p.opacity as SvgPercentage?)?.value, 'opacity', 45.0),
        ),
      );
    });
  });
}
