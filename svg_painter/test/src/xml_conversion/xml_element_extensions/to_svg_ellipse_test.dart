import 'package:svg_painter/src/base/_base.dart';
import 'package:svg_painter/src/svg_model/_svg_model.dart';
import 'package:svg_painter/src/xml_conversion/_xml_conversion.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
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
}
