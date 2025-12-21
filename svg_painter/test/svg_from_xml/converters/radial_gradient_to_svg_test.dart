import 'package:svg_painter/src/base/_base.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:svg_painter/src/xml_conversion/_xml_conversion.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
  group('ElementToSvg - RadialGradient', () {
    test('converts <radialGradient> with attributes correctly', () {
      final XmlDocument document = XmlDocument.parse(
        '''
        <radialGradient id="grad1" cx="50%" cy="50%" r="50%" fx="50%" fy="50%">
          <stop offset="0%" stop-color="rgb(255,255,255)" stop-opacity="0" />
          <stop offset="100%" stop-color="rgb(0,0,255)" stop-opacity="1" />
        </radialGradient>
        ''',
      );
      final XmlElement element = document.rootElement;

      final Result<SvgElement> result = element.toSvgElement();

      expect(result, isA<Success<SvgElement>>());
      final SvgRadialGradient gradient =
          (result as Success<SvgElement>).value as SvgRadialGradient;

      expect(gradient.id, 'grad1');
      expect((gradient.cx as SvgPercentage).value, 50.0);
      expect((gradient.cy as SvgPercentage).value, 50.0);
      expect((gradient.r as SvgPercentage).value, 50.0);
      expect((gradient.fx as SvgPercentage).value, 50.0);
      expect((gradient.fy as SvgPercentage).value, 50.0);

      expect(gradient.stops, hasLength(2));
      final SvgStop stop1 = gradient.stops[0];
      expect((stop1.offset as SvgPercentage).value, 0.0);
      expect((stop1.stopOpacity as SvgLength).value, 0.0); // 0 parses as Length(0) not Percentage

      final SvgStop stop2 = gradient.stops[1];
      expect((stop2.offset as SvgPercentage).value, 100.0);
      expect((stop2.stopOpacity as SvgLength).value, 1.0);
    });

    test('converts <radialGradient> defaults correctly', () {
      final XmlDocument document = XmlDocument.parse('<radialGradient />');
      final XmlElement element = document.rootElement;

      final Result<SvgElement> result = element.toSvgElement();

      expect(result, isA<Success<SvgElement>>());
      final SvgRadialGradient gradient =
          (result as Success<SvgElement>).value as SvgRadialGradient;

      expect((gradient.cx as SvgPercentage).value, 50.0);
      expect((gradient.cy as SvgPercentage).value, 50.0);
      expect((gradient.r as SvgPercentage).value, 50.0);
      // fx defaults to cx
      expect((gradient.fx as SvgPercentage).value, 50.0);
      // fy defaults to cy
      expect((gradient.fy as SvgPercentage).value, 50.0);
    });
  });
}
