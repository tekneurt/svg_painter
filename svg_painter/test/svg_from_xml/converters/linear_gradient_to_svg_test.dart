import 'package:svg_painter/src/base/_base.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:svg_painter/src/xml_conversion/_xml_conversion.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
  group('ElementToSvg - LinearGradient', () {
    test('converts <linearGradient> with attributes correctly', () {
      final XmlDocument document = XmlDocument.parse(
        '''
        <linearGradient id="grad1" x1="0%" y1="0%" x2="100%" y2="0%">
          <stop offset="0%" stop-color="red" />
          <stop offset="100%" stop-color="blue" />
        </linearGradient>
        ''',
      );
      final XmlElement element = document.rootElement;

      final Result<SvgElement> result = element.toSvgElement();

      expect(result, isA<Success<SvgElement>>());
      final SvgLinearGradient gradient =
          (result as Success<SvgElement>).value as SvgLinearGradient;

      expect(gradient.id, 'grad1');
      expect((gradient.x1 as SvgPercentage).value, 0.0);
      expect((gradient.y1 as SvgPercentage).value, 0.0);
      expect((gradient.x2 as SvgPercentage).value, 100.0);
      expect((gradient.y2 as SvgPercentage).value, 0.0);

      expect(gradient.stops, hasLength(2));
    });

    test('converts <linearGradient> defaults correctly', () {
      final XmlDocument document = XmlDocument.parse('<linearGradient />');
      final XmlElement element = document.rootElement;

      final Result<SvgElement> result = element.toSvgElement();

      expect(result, isA<Success<SvgElement>>());
      final SvgLinearGradient gradient =
          (result as Success<SvgElement>).value as SvgLinearGradient;

      expect((gradient.x1 as SvgPercentage).value, 0.0);
      expect((gradient.y1 as SvgPercentage).value, 0.0);
      expect((gradient.x2 as SvgPercentage).value, 100.0);
      expect((gradient.y2 as SvgPercentage).value, 0.0);
    });
  });
}
