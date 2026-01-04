import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:svg_painter/src/xml_conversion/xml_element_extensions/to_svg_group.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
  group('ToSvgGroup', () {
    test('should return Success with SvgGroup and children when valid XML is provided', () {
      // Arrange
      final XmlDocument document = XmlDocument.parse('<g id="group1"><circle /><rect /></g>');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgGroup> result = element.toSvgGroup();

      // Assert
      expect(result, isA<Success<SvgGroup>>());
      final SvgGroup group = (result as Success<SvgGroup>).value;
      expect(group.id, 'group1');
      expect(group.children, hasLength(2));
      expect(group.children[0], isA<SvgCircle>());
      expect(group.children[1], isA<SvgRect>());
    });

    test('should inherit common attributes from group when provided', () {
      // Arrange
      final XmlDocument document = XmlDocument.parse('<g fill="red" opacity="0.8" />');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgGroup> result = element.toSvgGroup();

      // Assert
      final SvgGroup group = (result as Success<SvgGroup>).value;
      expect(group.fill, isA<SvgNamedColor>());
      expect((group.opacity! as SvgLength).value, 0.8);
    });
  });
}
