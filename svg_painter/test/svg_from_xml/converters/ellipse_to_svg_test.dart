import 'package:svg_painter/src/base/_base.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:svg_painter/src/xml_conversion/_xml_conversion.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
  group('ElementToSvg - Ellipse', () {
    test('converts <ellipse> with lengths correctly', () {
      final XmlDocument document = XmlDocument.parse(
        '<ellipse cx="100" cy="50" rx="40" ry="20" />',
      );
      final XmlElement element = document.rootElement;

      final Result<SvgElement> result = element.toSvgElement();

      expect(result, isA<Success<SvgElement>>());

      final SvgElement svgElement = (result as Success<SvgElement>).value;
      expect(svgElement, isA<SvgEllipse>());

      final SvgEllipse ellipse = svgElement as SvgEllipse;
      expect(ellipse.cx, isA<SvgLength>());
      expect((ellipse.cx as SvgLength).value, 100.0);
      expect(ellipse.cy, isA<SvgLength>());
      expect((ellipse.cy as SvgLength).value, 50.0);
      expect(ellipse.rx, isA<SvgLength>());
      expect((ellipse.rx as SvgLength).value, 40.0);
      expect(ellipse.ry, isA<SvgLength>());
      expect((ellipse.ry as SvgLength).value, 20.0);
    });

    test('converts <ellipse> with percentages correctly', () {
      final XmlDocument document = XmlDocument.parse(
        '<ellipse cx="50%" cy="25%" rx="20%" ry="10%" />',
      );
      final XmlElement element = document.rootElement;

      final Result<SvgElement> result = element.toSvgElement();

      expect(result, isA<Success<SvgElement>>());
      final SvgEllipse ellipse = (result as Success<SvgElement>).value as SvgEllipse;

      expect(ellipse.cx, isA<SvgPercentage>());
      expect((ellipse.cx as SvgPercentage).value, 50.0);
      expect(ellipse.rx, isA<SvgPercentage>());
      expect((ellipse.rx as SvgPercentage).value, 20.0);
    });

    test('converts <ellipse> with default values (auto)', () {
      final XmlDocument document = XmlDocument.parse('<ellipse />');
      final XmlElement element = document.rootElement;

      final Result<SvgElement> result = element.toSvgElement();

      expect(result, isA<Success<SvgElement>>());
      final SvgEllipse ellipse = (result as Success<SvgElement>).value as SvgEllipse;
      
      expect((ellipse.cx as SvgLength).value, 0.0);
      expect((ellipse.cy as SvgLength).value, 0.0);
      expect(ellipse.rx, isA<SvgAuto>());
      expect(ellipse.ry, isA<SvgAuto>());
    });

    test('converts <ellipse> with explicit auto', () {
      final XmlDocument document = XmlDocument.parse('<ellipse rx="auto" ry="auto" />');
      final XmlElement element = document.rootElement;

      final Result<SvgElement> result = element.toSvgElement();

      expect(result, isA<Success<SvgElement>>());
      final SvgEllipse ellipse = (result as Success<SvgElement>).value as SvgEllipse;

      expect(ellipse.rx, isA<SvgAuto>());
      expect(ellipse.ry, isA<SvgAuto>());
    });
  });
}
