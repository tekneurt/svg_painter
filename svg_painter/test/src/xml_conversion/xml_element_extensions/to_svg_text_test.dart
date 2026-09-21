import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:svg_painter/src/xml_conversion/xml_element_extensions/to_svg_text.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
  group('ToSvgText', () {
    test(
      'should return SvgText with correct attributes and children when valid XML is provided',
      () {
        // Arrange
        final document = XmlDocument.parse(
          '<text id="t1" x="10" y="20">Hello World</text>',
        );
        final XmlElement element = document.rootElement;

        // Act
        final Result<SvgText> result = element.toSvgText();

        // Assert
        expect(result, isA<Success<SvgText>>());
        final SvgText text = (result as Success<SvgText>).value;
        expect(text.id, 't1');
        expect((text.primaryX as SvgLength).value, 10.0);
        expect((text.primaryY as SvgLength).value, 20.0);
        expect(text.children.length, 1);
        expect(text.children.first, isA<SvgCharacterData>());
        expect((text.children.first as SvgCharacterData).text, 'Hello World');
      },
    );

    test('should parse dx and dy attributes when provided', () {
      // Arrange
      final document = XmlDocument.parse(
        '<text x="10%" y="30%" dx="50%" dy="20">SVG</text>',
      );
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgText> result = element.toSvgText();

      // Assert
      expect(result, isA<Success<SvgText>>());
      final SvgText text = (result as Success<SvgText>).value;
      expect((text.primaryX as SvgPercentage).value, 10.0);
      expect((text.primaryY as SvgPercentage).value, 30.0);
      expect(text.dx, isA<SvgPercentage>());
      expect((text.dx as SvgPercentage?)?.value, 50.0);
      expect(text.dy, isA<SvgLength>());
      expect((text.dy as SvgLength?)?.value, 20.0);
    });

    test('should parse list of coordinates for x and y attributes', () {
      // Arrange
      final document = XmlDocument.parse(
        '<text x="25%, 50%, 75%" y="40%, 60%, 80%">SVG</text>',
      );
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgText> result = element.toSvgText();

      // Assert
      expect(result, isA<Success<SvgText>>());
      final SvgText text = (result as Success<SvgText>).value;
      expect(
        text.x.toList().map((SvgLengthPercentage c) => (c as SvgPercentage).value),
        <double>[25.0, 50.0, 75.0],
      );
      expect(
        text.y.toList().map((SvgLengthPercentage c) => (c as SvgPercentage).value),
        <double>[40.0, 60.0, 80.0],
      );
    });
  });
}
