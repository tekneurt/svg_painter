import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:svg_painter/src/xml_conversion/xml_element_extensions/to_svg_value.dart';
import 'package:svg_painter/src/xml_model/xml_attribute_name.dart';
import 'package:svg_painter/src/xml_model/xml_element_name.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
  group('ToSvgValue', () {
    test('toSvgValue should return parsed value when present', () {
      // Arrange
      final XmlDocument document = XmlDocument.parse('<rect x="10" />');
      final XmlElement element = document.rootElement;

      // Act
      final SvgLengthPercentage result = element.toSvgValue<SvgLengthPercentage>(
        XmlElementName.rect,
        XmlAttributeName.x,
      );

      // Assert
      expect(result, isA<SvgLength>());
      expect((result as SvgLength).value, 10.0);
    });

    test('toSvgValue should return default value when absent', () {
      // Arrange
      final XmlDocument document = XmlDocument.parse('<rect />');
      final XmlElement element = document.rootElement;

      // Act
      final SvgLengthPercentage result = element.toSvgValue<SvgLengthPercentage>(
        XmlElementName.rect,
        XmlAttributeName.x,
      );

      // Assert
      expect(result, const SvgLength(0.0));
    });

    test('toSvgValue should throw UnsupportedError when default value type mismatches', () {
      // Arrange
      final XmlDocument document = XmlDocument.parse('<rect />');
      final XmlElement element = document.rootElement;

      // Act & Assert
      expect(
        () => element.toSvgValue<SvgColor>(XmlElementName.rect, XmlAttributeName.x),
        throwsUnsupportedError,
      );
    });

    test('toSvgValueOrNull should return null when absent', () {
      // Arrange
      final XmlDocument document = XmlDocument.parse('<rect />');
      final XmlElement element = document.rootElement;

      // Act
      final SvgLengthPercentage? result = element.toSvgValueOrNull<SvgLengthPercentage>(
        XmlElementName.rect,
        XmlAttributeName.x,
      );

      // Assert
      expect(result, isNull);
    });

    test('toSvgValueOrNull should return null for string-only attributes', () {
      // Arrange
      final XmlDocument document = XmlDocument.parse('<rect id="r1" />');
      final XmlElement element = document.rootElement;

      // Act
      final SvgBaseValue? result = element.toSvgValueOrNull<SvgBaseValue>(
        XmlElementName.rect,
        XmlAttributeName.id,
      );

      // Assert
      expect(result, isNull);
    });

    test('toSvgValueOrNull should return parsed SvgNonNegativeNumber for pathLength', () {
      // Arrange
      final XmlDocument document = XmlDocument.parse('<rect pathLength="100" />');
      final XmlElement element = document.rootElement;

      // Act
      final SvgBaseValue? result = element.toSvgValueOrNull<SvgBaseValue>(
        XmlElementName.rect,
        XmlAttributeName.pathLength,
      );

      // Assert
      expect(result, isA<SvgNonNegativeNumber>());
      expect((result as SvgNonNegativeNumber).value, 100.0);
    });

    test('toSvgValueOrNull should throw UnsupportedError on type mismatch', () {
      // Arrange
      final XmlDocument document = XmlDocument.parse('<rect x="10" />');
      final XmlElement element = document.rootElement;

      // Act & Assert
      expect(
        () => element.toSvgValueOrNull<SvgColor>(XmlElementName.rect, XmlAttributeName.x),
        throwsUnsupportedError,
      );
    });

    test('toSvgValueOrNull should handle all attribute types in switch', () {
      // This test is to ensure coverage of the switch statement branches
      final Map<XmlAttributeName, String> tests = <XmlAttributeName, String>{
        XmlAttributeName.x: '10',
        XmlAttributeName.width: '100',
        XmlAttributeName.pathLength: '50',
        XmlAttributeName.points: '0,0 10,10',
        XmlAttributeName.fill: 'red',
        XmlAttributeName.strokeLinecap: 'round',
        XmlAttributeName.strokeLinejoin: 'bevel',
      };

      for (final MapEntry<XmlAttributeName, String> entry in tests.entries) {
        final XmlDocument document = XmlDocument.parse(
          '<rect ${entry.key.name}="${entry.value}" />',
        );
        final XmlElement element = document.rootElement;
        final SvgBaseValue? result = element.toSvgValueOrNull<SvgBaseValue>(
          XmlElementName.rect,
          entry.key,
        );
        expect(result, isNotNull, reason: 'Failed for ${entry.key}');
      }
    });

    test('toPathLength should return SvgNumber for valid pathLength', () {
      // Arrange
      final XmlDocument document = XmlDocument.parse('<path pathLength="100" />');
      final XmlElement element = document.rootElement;

      // Act
      final SvgNumber? result = element.toPathLength();

      // Assert
      expect(result, isA<SvgNonNegativeNumber>());
      expect(result?.value, 100.0);
    });

    test('toPathLength should return null for negative pathLength', () {
      // Arrange
      final XmlDocument document = XmlDocument.parse('<path pathLength="-10" />');
      final XmlElement element = document.rootElement;

      // Act
      final SvgNumber? result = element.toPathLength();

      // Assert
      expect(result, isNull);
    });
  });
}
