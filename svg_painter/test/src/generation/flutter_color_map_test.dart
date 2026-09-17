import 'package:svg_painter/src/generation/flutter_color_map.dart';
import 'package:svg_painter_annotation/svg_painter_annotation.dart';
import 'package:test/test.dart';

void main() {
  group('FlutterColorMap', () {
    group('getColorCode', () {
      test('should return material color constant when color is known and colorMapping is material', () {
        // Arrange
        const black = 0xFF000000;
        const red = 0xFFF44336;
        const transparent = 0x00000000;

        // Act
        final String blackCode = FlutterColorMap.getColorCode(black);
        final String redCode = FlutterColorMap.getColorCode(red);
        final String transCode = FlutterColorMap.getColorCode(transparent);

        // Assert
        expect(blackCode, equals('Colors.black'));
        expect(redCode, equals('Colors.red'));
        expect(transCode, equals('Colors.transparent'));
      });

      test('should return const Color hex when color is known but colorMapping is hex', () {
        // Arrange
        const black = 0xFF000000;
        const red = 0xFFF44336;
        const transparent = 0x00000000;

        // Act
        final String blackCode = FlutterColorMap.getColorCode(black, colorMapping: SvgColorMapping.hex);
        final String redCode = FlutterColorMap.getColorCode(red, colorMapping: SvgColorMapping.hex);
        final String transCode = FlutterColorMap.getColorCode(transparent, colorMapping: SvgColorMapping.hex);

        // Assert
        expect(blackCode, equals('const Color(0xFF000000)'));
        expect(redCode, equals('const Color(0xFFF44336)'));
        expect(transCode, equals('const Color(0x00000000)'));
      });

      test('should return const Color hex when color is unknown regardless of colorMapping', () {
        // Arrange
        const customColor = 0xFF123456;

        // Act
        final String materialResult = FlutterColorMap.getColorCode(customColor);
        final String hexResult = FlutterColorMap.getColorCode(customColor, colorMapping: SvgColorMapping.hex);

        // Assert
        expect(materialResult, equals('const Color(0xFF123456)'));
        expect(hexResult, equals('const Color(0xFF123456)'));
      });
    });

    group('colorToTokenName', () {
      test('should return base color name when color matches known Flutter primary color', () {
        // Arrange
        const black = 0xFF000000;
        const white = 0xFFFFFFFF;
        const red = 0xFFF44336;

        // Act
        final String blackToken = FlutterColorMap.colorToTokenName(black);
        final String whiteToken = FlutterColorMap.colorToTokenName(white);
        final String redToken = FlutterColorMap.colorToTokenName(red);

        // Assert
        expect(blackToken, equals('black'));
        expect(whiteToken, equals('white'));
        expect(redToken, equals('red'));
      });

      test('should return shade camelCase when color matches Flutter shade color', () {
        // Arrange
        const redShade200 = 0xFFEF9A9A;

        // Act
        final String token = FlutterColorMap.colorToTokenName(redShade200);

        // Assert
        expect(token, equals('redShade200'));
      });

      test('should return SVG color name when color is not in Flutter Colors but in SVG color map', () {
        // Arrange
        const antiquewhite = 0xFFFAEBD7;

        // Act
        final String token = FlutterColorMap.colorToTokenName(antiquewhite);

        // Assert
        expect(token, equals('antiquewhite'));
      });

      test('should return cAARRGGBB hex token when color is completely unknown', () {
        // Arrange
        const customColor = 0xFF123456;

        // Act
        final String token = FlutterColorMap.colorToTokenName(customColor);

        // Assert
        expect(token, equals('cFF123456'));
      });
    });
  });
}
