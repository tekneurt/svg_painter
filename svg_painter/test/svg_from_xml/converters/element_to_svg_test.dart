import 'package:svg_painter/src/base/_base.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:svg_painter/src/xml_conversion/_xml_conversion.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
  group('ElementToSvg', () {
    test('converts <circle> with lengths correctly', () {
      final XmlDocument document = XmlDocument.parse('<circle cx="50" cy="50" r="50" />');
      final XmlElement element = document.rootElement;

      final Result<SvgElement> result = element.toSvgElement();

      expect(result, isA<Success<SvgElement>>());

      final SvgElement svgElement = (result as Success<SvgElement>).value;
      expect(svgElement, isA<SvgCircle>());

      final SvgCircle circle = svgElement as SvgCircle;
      expect(circle.cx, isA<SvgLength>());
      expect((circle.cx as SvgLength).value, 50.0);
    });

    test('converts <circle> with percentages correctly', () {
      final XmlDocument document = XmlDocument.parse('<circle cx="50%" cy="0" r="0" />');
      final XmlElement element = document.rootElement;

      final Result<SvgElement> result = element.toSvgElement();

      expect(result, isA<Success<SvgElement>>());
      final SvgCircle circle = (result as Success<SvgElement>).value as SvgCircle;

      expect(circle.cx, isA<SvgPercentage>());
      expect((circle.cx as SvgPercentage).value, 50.0);
    });

    test('converts <circle> with missing attributes to defaults', () {
      final XmlDocument document = XmlDocument.parse('<circle />');
      final XmlElement element = document.rootElement;

      final Result<SvgElement> result = element.toSvgElement();

      expect(result, isA<Success<SvgElement>>());
      final SvgCircle circle = (result as Success<SvgElement>).value as SvgCircle;
      expect(circle.cx, isA<SvgLength>());
      expect((circle.cx as SvgLength).value, 0.0);
    });

    test('returns Failure for unsupported element', () {
      final XmlDocument document = XmlDocument.parse('<rect />');
      final XmlElement element = document.rootElement;

      final Result<SvgElement> result = element.toSvgElement();

      expect(result, isA<Failure<SvgElement>>());
      expect((result as Failure<SvgElement>).message, contains('Unsupported'));
    });
  });
}
