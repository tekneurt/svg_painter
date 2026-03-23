import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/xml_conversion/xml_element_extensions/to_svg_defs.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
  group('ToSvgDefs', () {
    test('should return Success with SvgDefs and nested children when valid XML is provided', () {
      // Arrange
      final document = XmlDocument.parse('''
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

    test('should parse and hold presentation attributes for inheritance', () {
      // Arrange
      final document = XmlDocument.parse('''
        <defs fill="red" stroke="blue" stroke-width="5" font-size="20">
          <circle />
        </defs>
      ''');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgDefs> result = element.toSvgDefs();

      // Assert
      expect(result, isA<Success<SvgDefs>>());
      final SvgDefs defs = (result as Success<SvgDefs>).value;
      expect(defs.fillAttributes?.color, isNotNull);
      expect(defs.strokeAttributes?.color, isNotNull);
      expect(defs.strokeAttributes?.width, isNotNull);
      expect(defs.fontAttributes?.size, isNotNull);
    });
  });
}
