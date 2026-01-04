import 'package:svg_painter/src/svg_conversion/svg_value_extensions/svg_color_to_int.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgColorToArgb', () {
    test('should convert SvgNamedColor correctly', () {
      // Arrange & Act & Assert
      expect(const SvgNamedColor(SvgColorName.red).toArgb(), 0xFFFF0000);
    });

    test('should convert SvgRgbColor correctly', () {
      // Arrange & Act & Assert
      expect(const SvgRgbColor(255, 0, 255, 0).toArgb(), 0xFF00FF00);
    });

    test('should convert SvgHslColor correctly', () {
      // Arrange & Act & Assert
      // red: hsl(0, 100%, 50%)
      expect(const SvgHslColor(1.0, 0.0, 100.0, 50.0).toArgb(), 0xFFFF0000);
      // green: hsl(120, 100%, 50%)
      expect(const SvgHslColor(1.0, 120.0, 100.0, 50.0).toArgb(), 0xFF00FF00);
      // blue: hsl(240, 100%, 50%)
      expect(const SvgHslColor(1.0, 240.0, 100.0, 50.0).toArgb(), 0xFF0000FF);
    });

    test('should convert SvgNoneColor correctly', () {
      // Arrange & Act & Assert
      expect(const SvgNoneColor().toArgb(), 0x00000000);
    });

    test('should use fallback for SvgPaintReference', () {
      // Arrange & Act & Assert
      expect(
        const SvgPaintReference('url1', fallback: SvgNamedColor(SvgColorName.blue)).toArgb(),
        0xFF0000FF,
      );
    });
  });
}
