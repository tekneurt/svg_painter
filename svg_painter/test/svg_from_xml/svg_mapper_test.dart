import 'package:svg_painter/src/svg_from_xml/svg_mapper.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/util/result.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
  group('SvgMapper', () {
    test('maps <circle> correctly', () {
      final XmlDocument document = XmlDocument.parse(
        '<circle cx="50" cy="50" r="50" />',
      );
      final XmlElement element = document.rootElement;

      final Result<SvgElement> result = SvgMapper.fromXml(element);

      expect(result, isA<Success<SvgElement>>());
      
      final SvgElement svgElement = (result as Success<SvgElement>).value;
      expect(svgElement, isA<SvgCircle>());
      
      final SvgCircle circle = svgElement as SvgCircle;
      expect(circle.cx, 50.0);
      expect(circle.cy, 50.0);
      expect(circle.r, 50.0);
    });

    test('maps <circle> with missing attributes to defaults', () {
      final XmlDocument document = XmlDocument.parse('<circle />');
      final XmlElement element = document.rootElement;

      final Result<SvgElement> result = SvgMapper.fromXml(element);

      expect(result, isA<Success<SvgElement>>());
      final SvgCircle circle = (result as Success<SvgElement>).value as SvgCircle;
      expect(circle.cx, 0.0);
      expect(circle.cy, 0.0);
      expect(circle.r, 0.0);
    });

    test('returns Failure for unsupported element', () {
      final XmlDocument document = XmlDocument.parse('<rect />');
      final XmlElement element = document.rootElement;

      final Result<SvgElement> result = SvgMapper.fromXml(element);

      expect(result, isA<Failure<SvgElement>>());
      expect((result as Failure<SvgElement>).message, contains('Unsupported'));
    });
  });
}
