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
      final document = XmlDocument.parse('<g id="group1"><circle /><rect /></g>');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgGroup> result = element.toSvgGroup();

      // Assert
      expect(
        result,
        isA<Success<SvgGroup>>().having(
          (Success<SvgGroup> s) => s.value,
          'value',
          isA<SvgGroup>()
              .having((SvgGroup g) => g.id, 'id', 'group1')
              .having((SvgGroup g) => g.children, 'children', hasLength(2)),
        ),
      );
    });

    test('should inherit common attributes from group when provided', () {
      // Arrange
      final document = XmlDocument.parse('<g fill="red" opacity="0.45" />');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgGroup> result = element.toSvgGroup();

      // Assert
      expect(
        result,
        isA<Success<SvgGroup>>().having(
          (Success<SvgGroup> s) => s.value,
          'value',
          isA<SvgGroup>()
              .having((SvgGroup g) => g.fillAttributes?.color, 'fill', isA<SvgNamedColor>())
              .having((SvgGroup g) => (g.opacity as SvgLength?)?.value, 'opacity', 0.45),
        ),
      );
    });
  });
}
