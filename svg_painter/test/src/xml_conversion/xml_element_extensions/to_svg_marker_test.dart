import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:svg_painter/src/xml_conversion/xml_element_extensions/to_svg_marker.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
  group('ToSvgMarker', () {
    test('should return SvgMarker with correct attributes when valid XML is provided', () {
      // Arrange
      final document = XmlDocument.parse('''
<marker id="marker1" viewBox="0 0 10 20" refX="5" refY="7" markerWidth="8" markerHeight="9" markerUnits="userSpaceOnUse" orient="auto-start-reverse">
<rect width="10" height="20" />
</marker>''');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgMarker> result = element.toSvgMarker();

      // Assert
      expect(result, isA<Success<SvgMarker>>());
      final SvgMarker marker = (result as Success<SvgMarker>).value;
      expect(marker.id, 'marker1');
      expect(marker.viewBox?.minX, 0.0);
      expect(marker.viewBox?.minY, 0.0);
      expect(marker.viewBox?.width, 10.0);
      expect(marker.viewBox?.height, 20.0);
      expect(marker.refX, isA<SvgLength>().having((SvgLength l) => l.value, 'value', 5.0));
      expect(marker.refY, isA<SvgLength>().having((SvgLength l) => l.value, 'value', 7.0));
      expect(marker.markerWidth, isA<SvgLength>().having((SvgLength l) => l.value, 'value', 8.0));
      expect(marker.markerHeight, isA<SvgLength>().having((SvgLength l) => l.value, 'value', 9.0));
      expect(marker.markerUnits, SvgMarkerUnits.userSpaceOnUse);
      expect(marker.orient, SvgMarkerOrient.autoStartReverse);
      expect(marker.children, hasLength(1));
    });

    test('should return SvgMarker with default attributes when none are provided', () {
      // Arrange
      final document = XmlDocument.parse('<marker />');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgMarker> result = element.toSvgMarker();

      // Assert
      expect(result, isA<Success<SvgMarker>>());
      final SvgMarker marker = (result as Success<SvgMarker>).value;
      expect(marker.id, isNull);
      expect(marker.viewBox, isNull);
      expect(marker.refX, isA<SvgLength>().having((SvgLength l) => l.value, 'value', 0.0));
      expect(marker.refY, isA<SvgLength>().having((SvgLength l) => l.value, 'value', 0.0));
      expect(marker.markerWidth, isA<SvgLength>().having((SvgLength l) => l.value, 'value', 3.0));
      expect(marker.markerHeight, isA<SvgLength>().having((SvgLength l) => l.value, 'value', 3.0));
      expect(marker.markerUnits, SvgMarkerUnits.strokeWidth);
      expect(marker.orient, SvgMarkerOrient.zero);
      expect(marker.children, isEmpty);
    });
  });
}
