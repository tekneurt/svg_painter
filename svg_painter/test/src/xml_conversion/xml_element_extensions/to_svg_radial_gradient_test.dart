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
      final XmlDocument document = XmlDocument.parse('''
        <radialGradient cx="50%" cy="50%" r="50%" fx="25%" fy="25%" fr="10%" id="rad1">
          <stop offset="0%" stop-color="red" />
        </radialGradient>
      ''');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgRadialGradient> result = element.toSvgRadialGradient();

      // Assert
      expect(result, isA<Success<SvgRadialGradient>>());
      final SvgRadialGradient grad = (result as Success<SvgRadialGradient>).value;
      expect((grad.cx as SvgPercentage).value, 50.0);
      expect((grad.cy as SvgPercentage).value, 50.0);
      expect((grad.r as SvgPercentage).value, 50.0);
      expect((grad.fx as SvgPercentage).value, 25.0);
      expect((grad.fy as SvgPercentage).value, 25.0);
      expect((grad.fr as SvgPercentage).value, 10.0);
      expect(grad.stops, hasLength(1));
    });

    test('should fallback fx/fy to cx/cy when not provided', () {
      // Arrange
      final XmlDocument document = XmlDocument.parse('<radialGradient cx="40%" cy="60%" />');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgRadialGradient> result = element.toSvgRadialGradient();

      // Assert
      final SvgRadialGradient grad = (result as Success<SvgRadialGradient>).value;
      expect((grad.fx as SvgPercentage).value, 40.0);
      expect((grad.fy as SvgPercentage).value, 60.0);
    });

    test('should return Success with default values when minimal gradient is provided', () {
      // Arrange
      final XmlDocument document = XmlDocument.parse('<radialGradient />');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgRadialGradient> result = element.toSvgRadialGradient();

      // Assert
      final SvgRadialGradient grad = (result as Success<SvgRadialGradient>).value;
      expect((grad.cx as SvgPercentage).value, 50.0);
      expect((grad.cy as SvgPercentage).value, 50.0);
      expect((grad.r as SvgPercentage).value, 50.0);
      expect((grad.fr as SvgPercentage).value, 0.0);
    });
  });
}
