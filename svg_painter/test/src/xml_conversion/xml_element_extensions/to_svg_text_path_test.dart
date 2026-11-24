import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:svg_painter/src/xml_conversion/xml_element_extensions/to_svg_text_path.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
  group('ToSvgTextPath', () {
    test(
      'should return SvgTextPath with correct attributes and children when valid XML is provided',
      () {
        // Arrange
        final document = XmlDocument.parse(
          '<textPath href="#myPath" startOffset="30" id="tp1" opacity="0.8">Fox <tspan>jumped</tspan></textPath>',
        );
        final XmlElement element = document.rootElement;

        // Act
        final Result<SvgTextPath> result = element.toSvgTextPath();

        // Assert
        expect(result, isA<Success<SvgTextPath>>());
        final SvgTextPath textPath = (result as Success<SvgTextPath>).value;
        expect(textPath.href, '#myPath');
        expect(textPath.id, 'tp1');
        expect((textPath.startOffset as SvgLength?)?.value, 30.0);
        expect((textPath.presentationAttributes?.graphics?.opacity as SvgLength?)?.value, 0.8);
        expect(textPath.children.length, 2);
        expect(textPath.children[0], isA<SvgCharacterData>());
        expect(textPath.children[1], isA<SvgTspan>());
      },
    );

    test('should return Failure when href attribute is missing', () {
      // Arrange
      final document = XmlDocument.parse(
        '<textPath startOffset="10">Missing href</textPath>',
      );
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgTextPath> result = element.toSvgTextPath();

      // Assert
      expect(result, isA<Failure<SvgTextPath>>());
      final String message = (result as Failure<SvgTextPath>).message;
      expect(message, contains('must have an href attribute'));
    });
  });
}
