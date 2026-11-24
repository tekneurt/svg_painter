import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:svg_painter/src/xml_conversion/xml_element_extensions/to_svg_fe_flood.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
  group('ToSvgFeFlood', () {
    test('should parse custom attributes when valid attributes are provided', () {
      // Arrange
      final document = XmlDocument.parse(
        '<feFlood x="25" y="35" width="120" height="140" flood-color="green" flood-opacity="0.6" in="SourceGraphic" result="floodOut" id="floodElem" />',
      );
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgFeFlood> result = element.toSvgFeFlood();

      // Assert
      expect(result, isA<Success<SvgFeFlood>>());
      final SvgFeFlood flood = (result as Success<SvgFeFlood>).value;
      expect(flood.x, isA<SvgLength>().having((SvgLength l) => l.value, 'value', 25.0));
      expect(flood.y, isA<SvgLength>().having((SvgLength l) => l.value, 'value', 35.0));
      expect(flood.width, isA<SvgLength>().having((SvgLength l) => l.value, 'value', 120.0));
      expect(flood.height, isA<SvgLength>().having((SvgLength l) => l.value, 'value', 140.0));
      expect(
        flood.floodColor,
        isA<SvgNamedColor>().having((SvgNamedColor c) => c.name, 'name', SvgColorName.green),
      );
      expect(flood.floodOpacity, 0.6);
      expect(flood.inSource, 'SourceGraphic');
      expect(flood.result, 'floodOut');
      expect(flood.id, 'floodElem');
    });

    test('should default to spec defaults when attributes are absent', () {
      // Arrange
      final document = XmlDocument.parse('<feFlood />');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgFeFlood> result = element.toSvgFeFlood();

      // Assert
      expect(result, isA<Success<SvgFeFlood>>());
      final SvgFeFlood flood = (result as Success<SvgFeFlood>).value;
      expect(flood.x, isNull);
      expect(flood.y, isNull);
      expect(flood.width, isNull);
      expect(flood.height, isNull);
      expect(
        flood.floodColor,
        isA<SvgNamedColor>().having((SvgNamedColor c) => c.name, 'name', SvgColorName.black),
      );
      expect(flood.floodOpacity, 1.0);
      expect(flood.inSource, isNull);
      expect(flood.result, isNull);
    });
  });
}
