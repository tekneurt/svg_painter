import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:svg_painter/src/xml_conversion/xml_element_extensions/to_svg_fe_drop_shadow.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
  group('ToSvgFeDropShadow', () {
    test('should parse custom attributes when valid attributes are provided', () {
      // Arrange
      final document = XmlDocument.parse(
        '<feDropShadow dx="3.5" dy="4.5" stdDeviation="1.5 2.5" flood-color="cyan" flood-opacity="0.75" in="SourceAlpha" result="shadowOut" id="shadowElem" />',
      );
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgFeDropShadow> result = element.toSvgFeDropShadow();

      // Assert
      expect(result, isA<Success<SvgFeDropShadow>>());
      final SvgFeDropShadow dropShadow = (result as Success<SvgFeDropShadow>).value;
      expect(dropShadow.dx, 3.5);
      expect(dropShadow.dy, 4.5);
      expect(dropShadow.stdDeviationX, 1.5);
      expect(dropShadow.stdDeviationY, 2.5);
      expect(
        dropShadow.floodColor,
        isA<SvgNamedColor>().having((SvgNamedColor c) => c.name, 'name', SvgColorName.cyan),
      );
      expect(dropShadow.floodOpacity, 0.75);
      expect(dropShadow.inSource, 'SourceAlpha');
      expect(dropShadow.result, 'shadowOut');
      expect(dropShadow.id, 'shadowElem');
    });

    test('should parse single stdDeviation when one value is provided', () {
      // Arrange
      final document = XmlDocument.parse(
        '<feDropShadow stdDeviation="5.0" />',
      );
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgFeDropShadow> result = element.toSvgFeDropShadow();

      // Assert
      expect(result, isA<Success<SvgFeDropShadow>>());
      final SvgFeDropShadow dropShadow = (result as Success<SvgFeDropShadow>).value;
      expect(dropShadow.stdDeviationX, 5.0);
      expect(dropShadow.stdDeviationY, 5.0);
    });

    test('should default to spec defaults when attributes are absent', () {
      // Arrange
      final document = XmlDocument.parse('<feDropShadow />');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgFeDropShadow> result = element.toSvgFeDropShadow();

      // Assert
      expect(result, isA<Success<SvgFeDropShadow>>());
      final SvgFeDropShadow dropShadow = (result as Success<SvgFeDropShadow>).value;
      expect(dropShadow.dx, 2.0);
      expect(dropShadow.dy, 2.0);
      expect(dropShadow.stdDeviationX, 2.0);
      expect(dropShadow.stdDeviationY, 2.0);
      expect(
        dropShadow.floodColor,
        isA<SvgNamedColor>().having((SvgNamedColor c) => c.name, 'name', SvgColorName.black),
      );
      expect(dropShadow.floodOpacity, 1.0);
      expect(dropShadow.inSource, isNull);
      expect(dropShadow.result, isNull);
    });
  });
}
