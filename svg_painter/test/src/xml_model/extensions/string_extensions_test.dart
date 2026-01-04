import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/xml_model/extensions/string_extensions.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
  group('StringExtensions', () {
    group('toXmlDocument', () {
      test('should return Success with XmlDocument when valid XML is provided', () {
        // Arrange
        const String xml = '<svg width="100" height="100"><circle cx="50" cy="50" r="40" /></svg>';

        // Act
        final Result<XmlDocument> result = xml.toXmlDocument();

        // Assert
        expect(result, isA<Success<XmlDocument>>());
        final XmlDocument doc = (result as Success<XmlDocument>).value;
        expect(doc.rootElement.name.local, 'svg');
        expect(doc.findAllElements('circle'), hasLength(1));
      });

      test('should return Failure when malformed XML is provided', () {
        // Arrange
        const String malformedXml = '<svg><circle></svg>'; // Missing closing tag for circle

        // Act
        final Result<XmlDocument> result = malformedXml.toXmlDocument();

        // Assert
        expect(result, isA<Failure<XmlDocument>>());
        final Failure<XmlDocument> failure = result as Failure<XmlDocument>;
        expect(failure.message, contains('XML parsing failed'));
      });

      test('should return Failure when empty string is provided', () {
        // Arrange
        const String emptyStr = '';

        // Act
        final Result<XmlDocument> result = emptyStr.toXmlDocument();

        // Assert
        expect(result, isA<Failure<XmlDocument>>());
        expect((result as Failure<XmlDocument>).message, contains('XML parsing failed'));
      });
    });
  });
}
