import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:svg_painter/src/xml_conversion/xml_element_extensions/to_svg_switch.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
  group('ToSvgSwitch', () {
    test('should return Success with SvgSwitch and children when valid XML is provided', () {
      // Arrange
      final document = XmlDocument.parse(
        '<switch id="sw1"><text systemLanguage="en">Hello</text><text>Fallback</text></switch>',
      );
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgSwitch> result = element.toSvgSwitch();

      // Assert
      expect(
        result,
        isA<Success<SvgSwitch>>().having(
          (Success<SvgSwitch> s) => s.value,
          'value',
          isA<SvgSwitch>()
              .having((SvgSwitch s) => s.id, 'id', 'sw1')
              .having((SvgSwitch s) => s.children, 'children', hasLength(2)),
        ),
      );
    });

    test('should parse common attributes and presentation attributes when provided', () {
      // Arrange
      final document = XmlDocument.parse(
        '<switch id="sw2" fill="blue" opacity="0.75" />',
      );
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgSwitch> result = element.toSvgSwitch();

      // Assert
      expect(
        result,
        isA<Success<SvgSwitch>>().having(
          (Success<SvgSwitch> s) => s.value,
          'value',
          isA<SvgSwitch>()
              .having((SvgSwitch s) => s.id, 'id', 'sw2')
              .having(
                (SvgSwitch s) => s.presentationAttributes?.fill?.color,
                'fill color',
                isA<SvgNamedColor>().having((c) => c.name, 'name', SvgColorName.blue),
              )
              .having(
                (SvgSwitch s) => s.presentationAttributes?.graphics?.opacity,
                'opacity',
                isA<SvgLength>().having((o) => o.value, 'value', 0.75),
              ),
        ),
      );
    });
  });
}
