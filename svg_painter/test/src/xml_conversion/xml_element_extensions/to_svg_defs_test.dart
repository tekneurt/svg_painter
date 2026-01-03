import 'package:svg_painter/src/base/_base.dart';
import 'package:svg_painter/src/svg_model/_svg_model.dart';
import 'package:svg_painter/src/xml_conversion/xml_element_extensions/to_svg_defs.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
  group('ToSvgDefs', () {
    test('should return Success with SvgDefs and nested children when valid XML is provided', () {
      // Arrange
      final XmlDocument document = XmlDocument.parse('''
        <defs id="definitions">
          <linearGradient id="grad1" />
          <circle id="sym1" />
        </defs>
      ''');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgDefs> result = element.toSvgDefs();

      // Assert
      expect(result, isA<Success<SvgDefs>>());
      final SvgDefs defs = (result as Success<SvgDefs>).value;
      expect(defs.id, 'definitions');
      expect(defs.children, hasLength(2));
      expect(defs.children[0], isA<SvgLinearGradient>());
      expect(defs.children[1], isA<SvgCircle>());
    });
  });
}
