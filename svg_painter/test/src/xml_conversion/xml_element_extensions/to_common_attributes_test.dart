import 'package:svg_painter/src/svg_model/attribute_groups/svg_transform_attributes.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:svg_painter/src/xml_conversion/xml_element_extensions/to_common_attributes.dart';
import 'package:svg_painter/src/xml_model/xml_element_name.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
  group('ToCommonAttributes', () {
    test('should extract attributes correctly', () {
      // Arrange
      final XmlDocument document = XmlDocument.parse(
        '<circle id="c1" fill="red" stroke="blue" opacity="0.5" font-size="12" font-family="Roboto" class="cls1" style="fill: green" transform="scale(2)" />',
      );
      final XmlElement element = document.rootElement;

      // Act
      final CommonAttributes attrs = element.toCommonAttributes(XmlElementName.circle);

      // Assert
      expect(attrs.core.id, 'c1');
      expect(attrs.presentation.fill?.color, isA<SvgNamedColor>());
      expect(attrs.presentation.stroke?.color, isA<SvgNamedColor>());
      expect((attrs.presentation.graphics!.opacity! as SvgLength).value, 0.5);
      expect((attrs.presentation.font!.size! as SvgLength).value, 12.0);
      expect(attrs.presentation.font?.family?.value, 'Roboto');
      expect(attrs.core.cssClass, 'cls1');
      expect(attrs.core.inlineStyle, 'fill: green');
      expect(attrs.presentation.graphics?.transformAttributes?.operations.first, isA<SvgScale>());
    });

    test('should return empty attribute groups when attributes are missing', () {
      // Arrange
      final XmlDocument document = XmlDocument.parse('<circle />');
      final XmlElement element = document.rootElement;

      // Act
      final CommonAttributes attrs = element.toCommonAttributes(XmlElementName.circle);

      // Assert
      expect(attrs.core.id, isNull);
      expect(attrs.presentation.fill?.color, isNull);
      expect(attrs.presentation.stroke?.color, isNull);
      expect(attrs.presentation.font?.size, isNull);
      expect(attrs.presentation.graphics?.opacity, isNull);
    });
  });
}
