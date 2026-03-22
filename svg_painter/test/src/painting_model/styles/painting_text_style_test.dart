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
    test('toString should contain all relevant properties', () {
      const style = PaintingTextStyle(
        fontSize: 12.0,
        fontWeight: PaintingFontWeight.bold,
        fontStyle: PaintingFontStyle.italic,
        fontFamily: 'Roboto',
      );

      final str = style.toString();
      expect(str, contains('size: 12.0'));
      expect(str, contains('weight: PaintingFontWeight.bold'));
      expect(str, contains('style: PaintingFontStyle.italic'));
      expect(str, contains('family: Roboto'));
    });
  });
}
