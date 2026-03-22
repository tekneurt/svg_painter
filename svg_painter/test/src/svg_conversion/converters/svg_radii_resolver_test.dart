import 'package:svg_painter/src/svg_conversion/converters/svg_painting_context.dart';
import 'package:svg_painter/src/svg_conversion/converters/svg_radii_resolver.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  const context = SvgPaintingContext(viewBoxWidth: 100, viewBoxHeight: 200);

  group('resolveRadii', () {
    test('should return (0, 0) when both are auto', () {
      // Arrange
      const rx = SvgAuto();
      const ry = SvgAuto();

      // Act
      final (double, double) result = resolveRadii(rx, ry, context);

      // Assert
      expect(result, (0.0, 0.0));
    });

    test('should use rx when ry is auto', () {
      // Arrange
      const rx = SvgLength(10.0);
      const ry = SvgAuto();

      // Act
      final (double, double) result = resolveRadii(rx, ry, context);

      // Assert
      expect(result, (10.0, 10.0));
    });

    test('should use ry when rx is auto', () {
      // Arrange
      const rx = SvgAuto();
      const ry = SvgLength(20.0);

      // Act
      final (double, double) result = resolveRadii(rx, ry, context);

      // Assert
      expect(result, (20.0, 20.0));
    });

    test('should use both values when provided', () {
      // Arrange
      const rx = SvgLength(10.0);
      const ry = SvgLength(20.0);

      // Act
      final (double, double) result = resolveRadii(rx, ry, context);

      // Assert
      expect(result, (10.0, 20.0));
    });
  });
}
