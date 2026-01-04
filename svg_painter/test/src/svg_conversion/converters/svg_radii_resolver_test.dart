import 'package:svg_painter/src/svg_conversion/converters/svg_painting_context.dart';
import 'package:svg_painter/src/svg_conversion/converters/svg_radii_resolver.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  const SvgPaintingContext context = SvgPaintingContext(viewBoxWidth: 100, viewBoxHeight: 200);

  group('resolveRadii', () {
    test('should return (0, 0) when both are auto', () {
      // Arrange
      const SvgAuto rx = SvgAuto();
      const SvgAuto ry = SvgAuto();

      // Act
      final (double, double) result = resolveRadii(rx, ry, context);

      // Assert
      expect(result, (0.0, 0.0));
    });

    test('should use rx when ry is auto', () {
      // Arrange
      const SvgLength rx = SvgLength(10.0);
      const SvgAuto ry = SvgAuto();

      // Act
      final (double, double) result = resolveRadii(rx, ry, context);

      // Assert
      expect(result, (10.0, 10.0));
    });

    test('should use ry when rx is auto', () {
      // Arrange
      const SvgAuto rx = SvgAuto();
      const SvgLength ry = SvgLength(20.0);

      // Act
      final (double, double) result = resolveRadii(rx, ry, context);

      // Assert
      expect(result, (20.0, 20.0));
    });

    test('should use both values when provided', () {
      // Arrange
      const SvgLength rx = SvgLength(10.0);
      const SvgLength ry = SvgLength(20.0);

      // Act
      final (double, double) result = resolveRadii(rx, ry, context);

      // Assert
      expect(result, (10.0, 20.0));
    });
  });
}
