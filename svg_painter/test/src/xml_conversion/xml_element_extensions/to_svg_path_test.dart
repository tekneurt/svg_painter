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
      final XmlDocument document = XmlDocument.parse('<path d="M 10 10 L 20 20" />');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgPath> result = element.toSvgPath();

      // Assert
      expect(result, isA<Success<SvgPath>>());
      final SvgPath path = (result as Success<SvgPath>).value;
      expect(path.d, 'M 10 10 L 20 20');
    });

    test('should return Failure when d attribute is missing', () {
      // Arrange
      final XmlDocument document = XmlDocument.parse('<path />');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgPath> result = element.toSvgPath();

      // Assert
      expect(result, isA<Failure<SvgPath>>());
      expect((result as Failure<SvgPath>).message, contains('must have a "d" attribute'));
    });

    test('should map common attributes when provided', () {
      // Arrange
      final XmlDocument document = XmlDocument.parse(
        '<path d="M0 0" id="path1" fill="red" stroke="blue" opacity="50%" />',
      );
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgPath> result = element.toSvgPath();

      // Assert
      final SvgPath path = (result as Success<SvgPath>).value;
      expect(path.id, 'path1');
      expect(path.fill, isA<SvgNamedColor>());
      expect(path.stroke?.color, isA<SvgNamedColor>());
      expect((path.opacity! as SvgPercentage).value, 50.0);
    });
  });
}
