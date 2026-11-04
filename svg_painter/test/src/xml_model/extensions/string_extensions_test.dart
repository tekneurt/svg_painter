import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/xml_model/extensions/string_extensions.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
  group('StringExtensions', () {
    group('toXmlDocument', () {
      test('should return Success with XmlDocument when valid XML is provided', () {
        // Arrange
        const xml = '<svg width="111" height="222"><circle cx="55" cy="66" r="44" /></svg>';

        // Act
        final Result<XmlDocument> result = xml.toXmlDocument();

        // Assert
        expect(result, isA<Success<XmlDocument>>());
        final XmlDocument doc = (result as Success<XmlDocument>).value;
        expect(doc.rootElement.name.local, 'svg');
        expect(doc.findAllElements('circle'), hasLength(1));
      });

      test('should return Success when XML contains comments and processing instructions', () {
        // Arrange
        const xml = '''
          <?xml version="1.0" encoding="UTF-8"?>
          <!-- This is a comment -->
          <svg>
            <rect />
          </svg>
        ''';

        // Act
        final Result<XmlDocument> result = xml.toXmlDocument();

        // Assert
        expect(result, isA<Success<XmlDocument>>());
        final XmlDocument doc = (result as Success<XmlDocument>).value;
        expect(doc.rootElement.name.local, 'svg');
        expect(doc.findAllElements('rect'), hasLength(1));
      });

      test('should return Failure when malformed XML is provided', () {
        // Arrange
        const malformedXml = '<svg><circle></svg>'; // Missing closing tag for circle

        // Act
        final Result<XmlDocument> result = malformedXml.toXmlDocument();

        // Assert
        expect(result, isA<Failure<XmlDocument>>());
        final failure = result as Failure<XmlDocument>;
        expect(failure.message, contains('XML parsing failed'));
      });

      test('should return Failure when empty string is provided', () {
        // Arrange
        const emptyStr = '';

        // Act
        final Result<XmlDocument> result = emptyStr.toXmlDocument();

        // Assert
        expect(result, isA<Failure<XmlDocument>>());
        final failure = result as Failure<XmlDocument>;
        expect(failure.message, contains('XML parsing failed'));
      });

      test('should expand internal DTD entities when present in document', () {
        // Arrange
        const xml = '''
<!DOCTYPE svg [
          <!ENTITY myShape "<path d='M10,20 L30,40 Z' />">
        ]>
        <svg>&myShape;</svg>''';

        // Act
        final Result<XmlDocument> result = xml.toXmlDocument();

        // Assert
        expect(result, isA<Success<XmlDocument>>());
        final XmlDocument doc = (result as Success<XmlDocument>).value;
        expect(doc.findAllElements('path'), hasLength(1));
        final XmlElement pathElem = doc.findAllElements('path').first;
        expect(pathElem.getAttribute('d'), equals('M10,20 L30,40 Z'));
      });
    });
  });
}
