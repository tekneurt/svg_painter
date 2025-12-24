import 'package:svg_painter/src/base/_base.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:svg_painter/src/xml_conversion/_xml_conversion.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
  group('ElementToSvg - Rect', () {
    test('converts <rect> with lengths correctly', () {
      final XmlDocument document = XmlDocument.parse(
        '<rect x="10" y="20" width="100" height="50" rx="5" ry="5" />',
      );
      final XmlElement element = document.rootElement;

      final Result<SvgElement> result = element.toSvgElement();

      expect(result, isA<Success<SvgElement>>());

      final SvgRect rect = (result as Success<SvgElement>).value as SvgRect;
      expect((rect.x as SvgLength).value, 10.0);
      expect((rect.y as SvgLength).value, 20.0);
      expect((rect.width as SvgLength).value, 100.0);
      expect((rect.height as SvgLength).value, 50.0);
      expect((rect.rx as SvgLength).value, 5.0);
      expect((rect.ry as SvgLength).value, 5.0);
    });

    test('converts <rect> with default values', () {
      final XmlDocument document = XmlDocument.parse('<rect />');
      final XmlElement element = document.rootElement;

      final Result<SvgElement> result = element.toSvgElement();

      expect(result, isA<Success<SvgElement>>());
      final SvgRect rect = (result as Success<SvgElement>).value as SvgRect;

      expect((rect.x as SvgLength).value, 0.0);
      expect((rect.y as SvgLength).value, 0.0);
      expect(rect.width, isA<SvgAuto>());
      expect(rect.height, isA<SvgAuto>());
      expect(rect.rx, isA<SvgAuto>());
      expect(rect.ry, isA<SvgAuto>());
    });
  });
}
