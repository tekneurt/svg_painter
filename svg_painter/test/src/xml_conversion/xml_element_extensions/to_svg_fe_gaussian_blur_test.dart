import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/xml_conversion/xml_element_extensions/to_svg_fe_gaussian_blur.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
  group('ToSvgFeGaussianBlur', () {
    test('should parse single stdDeviation when single number is provided', () {
      // Arrange
      final document = XmlDocument.parse('<feGaussianBlur stdDeviation="3.5" in="SourceGraphic" result="blurOut" id="blurElem" />');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgFeGaussianBlur> result = element.toSvgFeGaussianBlur();

      // Assert
      expect(result, isA<Success<SvgFeGaussianBlur>>());
      final SvgFeGaussianBlur blur = (result as Success<SvgFeGaussianBlur>).value;
      expect(blur.stdDeviationX, 3.5);
      expect(blur.stdDeviationY, 3.5);
      expect(blur.inSource, 'SourceGraphic');
      expect(blur.result, 'blurOut');
      expect(blur.id, 'blurElem');
    });

    test('should parse separate stdDeviation values when two numbers are provided', () {
      // Arrange
      final document = XmlDocument.parse('<feGaussianBlur stdDeviation="2.0, 6.0" in="SourceAlpha" />');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgFeGaussianBlur> result = element.toSvgFeGaussianBlur();

      // Assert
      expect(result, isA<Success<SvgFeGaussianBlur>>());
      final SvgFeGaussianBlur blur = (result as Success<SvgFeGaussianBlur>).value;
      expect(blur.stdDeviationX, 2.0);
      expect(blur.stdDeviationY, 6.0);
      expect(blur.inSource, 'SourceAlpha');
    });

    test('should default to zero stdDeviation when attribute is absent or malformed', () {
      // Arrange
      final document = XmlDocument.parse('<feGaussianBlur />');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgFeGaussianBlur> result = element.toSvgFeGaussianBlur();

      // Assert
      expect(result, isA<Success<SvgFeGaussianBlur>>());
      final SvgFeGaussianBlur blur = (result as Success<SvgFeGaussianBlur>).value;
      expect(blur.stdDeviationX, 0.0);
      expect(blur.stdDeviationY, 0.0);
      expect(blur.inSource, isNull);
      expect(blur.result, isNull);
    });
  });
}
