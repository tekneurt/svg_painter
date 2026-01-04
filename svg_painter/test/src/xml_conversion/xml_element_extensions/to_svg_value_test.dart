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
  });
}
