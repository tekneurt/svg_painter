import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/svg_model/_svg_model.dart';
import 'package:svg_painter/src/xml_conversion/xml_element_extensions/to_svg_symbol.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
  group('ToSvgSymbol', () {
    test('should return SvgSymbol with correct attributes when valid XML is provided', () {
      // Arrange
      final XmlDocument document = XmlDocument.parse(
        '<symbol id="sym1" viewBox="0 0 10 10" preserveAspectRatio="xMidYMid meet" width="100" height="50" x="10" y="20" />',
      );
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgSymbol> result = element.toSvgSymbol();

      // Assert
      expect(result, isA<Success<SvgSymbol>>());
      final SvgSymbol symbol = (result as Success<SvgSymbol>).value;
      expect(symbol.id, 'sym1');
      expect(symbol.viewBox?.width, 10.0);
      expect(symbol.viewBox?.height, 10.0);
      expect(symbol.preserveAspectRatio?.alignment, SvgPreserveAspectRatioAlignment.xMidYMid);
      expect(symbol.width, isA<SvgLength>());
      expect((symbol.width! as SvgLength).value, 100.0);
      expect(symbol.height, isA<SvgLength>());
      expect((symbol.height! as SvgLength).value, 50.0);
      expect(symbol.x, isA<SvgLength>());
      expect((symbol.x! as SvgLength).value, 10.0);
      expect(symbol.y, isA<SvgLength>());
      expect((symbol.y! as SvgLength).value, 20.0);
    });

    test('should return SvgSymbol with null attributes when none are provided', () {
      // Arrange
      final XmlDocument document = XmlDocument.parse('<symbol />');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgSymbol> result = element.toSvgSymbol();

      // Assert
      expect(result, isA<Success<SvgSymbol>>());
      final SvgSymbol symbol = (result as Success<SvgSymbol>).value;
      expect(symbol.id, isNull);
      expect(symbol.viewBox, isNull);
      expect(symbol.preserveAspectRatio, isNull);
      expect(symbol.width, isNull);
      expect(symbol.height, isNull);
      expect(symbol.x, isNull);
      expect(symbol.y, isNull);
    });
  });
}
