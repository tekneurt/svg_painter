import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/xml_conversion/xml_element_extensions/to_svg_fe_offset.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
  group('ToSvgFeOffset', () {
    test('should parse dx and dy when valid attributes are provided', () {
      // Arrange
      final document = XmlDocument.parse('<feOffset dx="65.0" dy="75.0" in="SourceGraphic" result="offsetOut" id="offElem" />');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgFeOffset> result = element.toSvgFeOffset();

      // Assert
      expect(result, isA<Success<SvgFeOffset>>());
      final SvgFeOffset offset = (result as Success<SvgFeOffset>).value;
      expect(offset.dx, 65.0);
      expect(offset.dy, 75.0);
      expect(offset.inSource, 'SourceGraphic');
      expect(offset.result, 'offsetOut');
      expect(offset.id, 'offElem');
    });

    test('should default to zero dx and dy when attributes are absent', () {
      // Arrange
      final document = XmlDocument.parse('<feOffset />');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgFeOffset> result = element.toSvgFeOffset();

      // Assert
      expect(result, isA<Success<SvgFeOffset>>());
      final SvgFeOffset offset = (result as Success<SvgFeOffset>).value;
      expect(offset.dx, 0.0);
      expect(offset.dy, 0.0);
      expect(offset.inSource, isNull);
      expect(offset.result, isNull);
    });
  });
}
