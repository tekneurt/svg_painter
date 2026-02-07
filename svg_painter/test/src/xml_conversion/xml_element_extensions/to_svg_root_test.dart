import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:svg_painter/src/xml_conversion/xml_element_extensions/to_svg_root.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
  group('ToSvgRoot', () {
    test('should return Success with SvgRoot when valid <svg> is provided', () {
      // Arrange
      final XmlDocument document = XmlDocument.parse(
        '<svg width="222" height="111" viewBox="0 0 222 111"><circle /></svg>',
      );
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgRoot> result = element.toSvgRoot();

      // Assert
      expect(
        result,
        isA<Success<SvgRoot>>().having(
          (Success<SvgRoot> s) => s.value,
          'value',
          isA<SvgRoot>()
              .having((SvgRoot r) => (r.width as SvgLength?)?.value, 'width', 222.0)
              .having((SvgRoot r) => (r.height as SvgLength?)?.value, 'height', 111.0)
              .having((SvgRoot r) => r.viewBox?.width, 'viewBox width', 222.0)
              .having((SvgRoot r) => r.children, 'children', hasLength(1)),
        ),
      );
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
      expect(
        result,
        isA<Success<SvgRoot>>().having(
          (Success<SvgRoot> s) => s.value.styleSheet.rules,
          'rules',
          containsPair('red', containsPair('fill', 'red')),
        ),
      );
    });

    test('should NOT collect CSS rules from <style> blocks inside nested <svg> elements', () {
      // Arrange
      final XmlDocument document = XmlDocument.parse('''
        <svg>
          <style>.outer { fill: red; }</style>
          <g>
            <svg>
              <style>.inner { fill: blue; }</style>
            </svg>
          </g>
        </svg>
      ''');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgRoot> result = element.toSvgRoot();

      // Assert
      expect(result, isA<Success<SvgRoot>>());
      final SvgRoot root = (result as Success<SvgRoot>).value;
      final Map<String, Map<String, String>> rules = root.styleSheet.rules;

      expect(rules, contains('outer'));
      expect(rules, isNot(contains('inner')));
    });

    test('should collect CSS rules from <style> blocks inside <defs>', () {
      // Arrange
      final XmlDocument document = XmlDocument.parse('''
        <svg>
          <defs>
            <style>.def-style { fill: green; }</style>
          </defs>
        </svg>
      ''');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgRoot> result = element.toSvgRoot();

      // Assert
      expect(result, isA<Success<SvgRoot>>());
      final SvgRoot root = (result as Success<SvgRoot>).value;
      expect(root.styleSheet.rules, contains('def-style'));
    });
  });
}
