import 'package:svg_painter/src/painting_model/styles/painting_style.dart';
import 'package:test/test.dart';

void main() {
  group('PaintingFontWeight', () {
    test('toFlutterString should return correct mapping for all weights', () {
      expect(PaintingFontWeight.normal.toFlutterString(), equals('FontWeight.normal'));
      expect(PaintingFontWeight.bold.toFlutterString(), equals('FontWeight.bold'));
      expect(PaintingFontWeight.w100.toFlutterString(), equals('FontWeight.w100'));
      expect(PaintingFontWeight.w200.toFlutterString(), equals('FontWeight.w200'));
      expect(PaintingFontWeight.w300.toFlutterString(), equals('FontWeight.w300'));
      expect(PaintingFontWeight.w400.toFlutterString(), equals('FontWeight.normal'));
      expect(PaintingFontWeight.w500.toFlutterString(), equals('FontWeight.w500'));
      expect(PaintingFontWeight.w600.toFlutterString(), equals('FontWeight.w600'));
      expect(PaintingFontWeight.w700.toFlutterString(), equals('FontWeight.bold'));
      expect(PaintingFontWeight.w800.toFlutterString(), equals('FontWeight.w800'));
      expect(PaintingFontWeight.w900.toFlutterString(), equals('FontWeight.w900'));
    });
  });

  group('PaintingFontStyle', () {
    test('toFlutterString should return correct mapping for all styles', () {
      expect(PaintingFontStyle.normal.toFlutterString(), equals('FontStyle.normal'));
      expect(PaintingFontStyle.italic.toFlutterString(), equals('FontStyle.italic'));
    });
  });

  group('PaintingTextStyle', () {
    test('should contain all relevant properties when converted to string', () {
      // Arrange
      const style = PaintingTextStyle(
        fontSize: 14.5,
        fontWeight: PaintingFontWeight.w600,
        fontStyle: PaintingFontStyle.italic,
        fontFamily: 'Noto Serif',
        textAnchor: PaintingTextAnchor.middle,
        fontPackage: 'svg_painter',
      );

      // Act
      final str = style.toString();

      // Assert
      expect(str, contains('size: 14.5'));
      expect(str, contains('weight: PaintingFontWeight.w600'));
      expect(str, contains('style: PaintingFontStyle.italic'));
      expect(str, contains('family: Noto Serif'));
      expect(str, contains('anchor: PaintingTextAnchor.middle'));
      expect(str, contains('package: svg_painter'));
    });

    test('should omit anchor and package when default or null', () {
      // Arrange
      const style = PaintingTextStyle(
        fontSize: 16.0,
        fontWeight: PaintingFontWeight.w400,
        fontStyle: PaintingFontStyle.normal,
        fontFamily: 'Roboto',
      );

      // Act
      final str = style.toString();

      // Assert
      expect(str, contains('size: 16.0'));
      expect(str, contains('family: Roboto'));
      expect(str, isNot(contains('anchor')));
      expect(str, isNot(contains('package')));
    });

    test('should include fallback when fontFamilyFallback is not empty', () {
      // Arrange
      const style = PaintingTextStyle(
        fontSize: 16.0,
        fontWeight: PaintingFontWeight.normal,
        fontStyle: PaintingFontStyle.normal,
        fontFamily: 'CustomFont',
        fontFamilyFallback: <String>['Fallback1', 'Fallback2'],
      );

      // Act
      final str = style.toString();

      // Assert
      expect(str, contains('fallback: [Fallback1, Fallback2]'));
    });
  });
}
