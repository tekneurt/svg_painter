import 'package:svg_painter/src/base/_base.dart';
import 'package:svg_painter/src/svg_model/_svg_model.dart';
import 'package:svg_painter/src/xml_conversion/xml_element_extensions/to_svg_root.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
  group('ToSvgRoot', () {
    test('should return Success with SvgRoot when valid <svg> is provided', () {
      // Arrange
      final XmlDocument document = XmlDocument.parse(
        '<svg width="200" height="100" viewBox="0 0 200 100"><circle /></svg>',
      );
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgRoot> result = element.toSvgRoot();

      // Assert
      expect(result, isA<Success<SvgRoot>>());
      final SvgRoot root = (result as Success<SvgRoot>).value;
      expect((root.width! as SvgLength).value, 200.0);
      expect((root.height! as SvgLength).value, 100.0);
      expect(root.viewBox?.width, 200.0);
      expect(root.children, hasLength(1));
    });

    test('should collect and merge CSS rules from <style> blocks', () {
      // Arrange
      final XmlDocument document = XmlDocument.parse('''
        <svg>
          <style>.red { fill: red; }</style>
          <style>.blue { fill: blue; }</style>
          <circle class="red" />
        </svg>
      ''');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgRoot> result = element.toSvgRoot();

      // Assert
      final SvgRoot root = (result as Success<SvgRoot>).value;
      expect(root.styleSheet.rules.containsKey('red'), isTrue);
      expect(root.styleSheet.rules.containsKey('blue'), isTrue);
      expect(root.styleSheet.rules['red']?['fill'], 'red');
    });
  });
}
