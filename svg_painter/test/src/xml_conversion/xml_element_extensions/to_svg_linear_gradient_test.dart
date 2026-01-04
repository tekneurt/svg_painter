import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:svg_painter/src/xml_conversion/xml_element_extensions/to_svg_linear_gradient.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
  group('ToSvgLinearGradient', () {
    test('should return Success with SvgLinearGradient when valid XML is provided', () {
      // Arrange
      final XmlDocument document = XmlDocument.parse('''
        <linearGradient x1="0%" y1="0%" x2="100%" y2="100%" id="grad1" gradientTransform="rotate(90)">
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
      expect((grad.x1 as SvgPercentage).value, 0.0);
      expect((grad.y1 as SvgPercentage).value, 0.0);
      expect((grad.x2 as SvgPercentage).value, 100.0);
      expect((grad.y2 as SvgPercentage).value, 100.0);
      expect(grad.id, 'grad1');
      expect(grad.gradientTransform, 'rotate(90)');
      expect(grad.stops, hasLength(2));
    });

    test('should return Success with default values when minimal gradient is provided', () {
      // Arrange
      final XmlDocument document = XmlDocument.parse('<linearGradient />');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgLinearGradient> result = element.toSvgLinearGradient();

      // Assert
      expect(result, isA<Success<SvgLinearGradient>>());
      final SvgLinearGradient grad = (result as Success<SvgLinearGradient>).value;
      expect((grad.x1 as SvgPercentage).value, 0.0);
      expect((grad.y1 as SvgPercentage).value, 0.0);
      expect((grad.x2 as SvgPercentage).value, 100.0);
      expect((grad.y2 as SvgPercentage).value, 0.0);
      expect(grad.stops, isEmpty);
    });
  });
}
