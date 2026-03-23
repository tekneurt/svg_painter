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
      expect(stop.stopColor, isA<SvgNamedColor>());
      expect((stop.stopColor as SvgNamedColor).name, SvgColorName.red);
      expect(stop.stopOpacity, isA<SvgLength>());
      expect((stop.stopOpacity as SvgLength).value, 0.5);
      expect(stop.id, 'stop1');
    });

    test('should return Success with default values when minimal stop is provided', () {
      // Arrange
      final document = XmlDocument.parse('<stop />');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgStop> result = element.toSvgStop();

      // Assert
      expect(result, isA<Success<SvgStop>>());
      final SvgStop stop = (result as Success<SvgStop>).value;
      expect((stop.offset as SvgLength).value, 0.0);
      expect((stop.stopColor as SvgNamedColor).name, SvgColorName.black);
      expect((stop.stopOpacity as SvgLength).value, 1.0);
    });
  });
}
