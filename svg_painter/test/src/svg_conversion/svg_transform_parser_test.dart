import 'package:svg_painter/src/svg_conversion/svg_transform_parser.dart';
import 'package:test/test.dart';

void main() {
  group('SvgTransformParser', () {
    group('scaleTransform', () {
      test('should return null when input is null', () {
        // Arrange
        const String? transform = null;

        // Act
        final String? result = SvgTransformParser.scaleTransform(transform, 1.0, 1.0);

        // Assert
        expect(result, isNull);
      });

      test('should return null when input is empty', () {
        // Arrange
        const String transform = '';

        // Act
        final String? result = SvgTransformParser.scaleTransform(transform, 1.0, 1.0);

        // Assert
        expect(result, isNull);
      });

      test('should scale translation coordinates when translate(tx) is provided', () {
        // Arrange
        const String transform = 'translate(10)';
        const double sx = 2.0;
        const double sy = 3.0;

        // Act
        final String? result = SvgTransformParser.scaleTransform(transform, sx, sy);

        // Assert
        expect(result, 'translate(20.0, 0.0)');
      });

      test('should scale translation coordinates when translate(tx, ty) is provided', () {
        // Arrange
        const String transform = 'translate(10, 20)';
        const double sx = 2.0;
        const double sy = 0.5;

        // Act
        final String? result = SvgTransformParser.scaleTransform(transform, sx, sy);

        // Assert
        expect(result, 'translate(20.0, 10.0)');
      });

      test('should preserve angle when rotate(angle) is provided', () {
        // Arrange
        const String transform = 'rotate(45)';
        const double sx = 2.0;
        const double sy = 3.0;

        // Act
        final String? result = SvgTransformParser.scaleTransform(transform, sx, sy);

        // Assert
        expect(result, 'rotate(45.0)');
      });

      test('should scale pivot point when rotate(angle, cx, cy) is provided', () {
        // Arrange
        const String transform = 'rotate(45, 10, 20)';
        const double sx = 2.0;
        const double sy = 3.0;

        // Act
        final String? result = SvgTransformParser.scaleTransform(transform, sx, sy);

        // Assert
        expect(result, 'rotate(45.0, 20.0, 60.0)');
      });

      test('should preserve scale factors when scale(sx, sy) is provided', () {
        // Arrange
        const String transform = 'scale(2, 3)';
        const double parentSx = 10.0;
        const double parentSy = 10.0;

        // Act
        final String? result = SvgTransformParser.scaleTransform(transform, parentSx, parentSy);

        // Assert
        expect(result, 'scale(2.0, 3.0)');
      });

      test('should preserve angle when skewX(angle) is provided', () {
        // Arrange
        const String transform = 'skewX(30)';
        const double sx = 2.0;
        const double sy = 3.0;

        // Act
        final String? result = SvgTransformParser.scaleTransform(transform, sx, sy);

        // Assert
        expect(result, 'skewX(30.0)');
      });

      test('should preserve angle when skewY(angle) is provided', () {
        // Arrange
        const String transform = 'skewY(30)';
        const double sx = 2.0;
        const double sy = 3.0;

        // Act
        final String? result = SvgTransformParser.scaleTransform(transform, sx, sy);

        // Assert
        expect(result, 'skewY(30.0)');
      });

      test('should correctly scale matrix components when matrix(...) is provided', () {
        // Arrange
        // matrix(a, b, c, d, e, f)
        // a=1, b=2, c=3, d=4, e=10, f=20
        const String transform = 'matrix(1, 2, 3, 4, 10, 20)';
        const double sx = 2.0;
        const double sy = 4.0;

        // Act
        final String? result = SvgTransformParser.scaleTransform(transform, sx, sy);

        // Assert
        // Expected components:
        // a' = a = 1.0
        // b' = b * (sy / sx) = 2 * (4 / 2) = 4.0
        // c' = c * (sx / sy) = 3 * (2 / 4) = 1.5
        // d' = d = 4.0
        // e' = e * sx = 10 * 2 = 20.0
        // f' = f * sy = 20 * 4 = 80.0
        expect(result, 'matrix(1.0, 4.0, 1.5, 4.0, 20.0, 80.0)');
      });

      test('should handle various parameter delimiters when input is provided', () {
        // Arrange
        const String transform = 'translate(10  20),rotate(45,10,20) scale(2,3)';
        const double sx = 2.0;
        const double sy = 3.0;

        // Act
        final String? result = SvgTransformParser.scaleTransform(transform, sx, sy);

        // Assert
        expect(result, 'translate(20.0, 60.0) rotate(45.0, 20.0, 60.0) scale(2.0, 3.0)');
      });

      test('should correctly process multiple transforms when chained', () {
        // Arrange
        const String transform = 'translate(10, 20) rotate(45) scale(2)';
        const double sx = 2.0;
        const double sy = 3.0;

        // Act
        final String? result = SvgTransformParser.scaleTransform(transform, sx, sy);

        // Assert
        expect(result, 'translate(20.0, 60.0) rotate(45.0) scale(2.0, 2.0)');
      });

      test('should be case sensitive for transform type names', () {
        // Arrange
        const String transform = 'TRANSLATE(10, 20)';
        const double sx = 2.0;
        const double sy = 3.0;

        // Act
        final String? result = SvgTransformParser.scaleTransform(transform, sx, sy);

        // Assert
        // The current implementation is case sensitive because switch(type)
        // doesn't lowercase and matches 'translate'.
        // If it doesn't match, it returns an empty string or skips it.
        expect(result, '');
      });
    });
  });
}
