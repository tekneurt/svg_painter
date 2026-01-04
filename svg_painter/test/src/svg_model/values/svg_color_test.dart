import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgColor', () {
    test('SvgNoneColor should return "none"', () {
      expect(const SvgNoneColor().toString(), 'none');
    });

    test('SvgCurrentColor should return "currentColor"', () {
      expect(const SvgCurrentColor().toString(), 'currentColor');
    });

    test('SvgNamedColor should return correct string', () {
      expect(const SvgNamedColor(SvgColorName.red).toString(), 'SvgNamedColor(red)');
    });

    test('SvgRgbColor should return correct string', () {
      expect(const SvgRgbColor(255, 255, 0, 0).toString(), 'SvgRgbColor(255, 255, 0, 0)');
    });

    test('SvgHslColor should return correct string', () {
      expect(const SvgHslColor(1.0, 0.0, 100.0, 50.0).toString(), 'SvgHslColor(1.0, 0.0, 100.0%, 50.0%)');
    });

    test('SvgPaintReference should return correct string', () {
      expect(const SvgPaintReference('grad1').toString(), 'SvgPaintReference(grad1, fallback: none)');
    });
  });
}
