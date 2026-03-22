import 'package:svg_painter/src/svg_model/_svg_model.dart';
import 'package:test/test.dart';

void main() {
  group('SvgTransform', () {
    group('SvgTransformAttributes', () {
      test('should store operations and have correct toString', () {
        // Arrange
        const translate = SvgTranslate(10, 20);
        const scale = SvgScale(2);
        const attrs = SvgTransformAttributes(<SvgTransformOperation>[
          translate,
          scale,
        ]);

        // Act & Assert
        expect(attrs.operations, <SvgTransformOperation>[translate, scale]);
        expect(attrs.toString(), 'SvgTransformAttributes(translate(10.0, 20.0), scale(2.0, 2.0))');
      });
    });

    group('SvgMatrix', () {
      test('should store values and have correct toString', () {
        // Arrange
        const matrix = SvgMatrix(1, 2, 3, 4, 5, 6);

        // Act & Assert
        expect(matrix.a, 1.0);
        expect(matrix.b, 2.0);
        expect(matrix.c, 3.0);
        expect(matrix.d, 4.0);
        expect(matrix.e, 5.0);
        expect(matrix.f, 6.0);
        expect(matrix.toString(), 'matrix(1.0, 2.0, 3.0, 4.0, 5.0, 6.0)');
      });
    });

    group('SvgTranslate', () {
      test('should handle x and y and have correct toString', () {
        // Arrange
        const translate = SvgTranslate(10, 20);

        // Act & Assert
        expect(translate.x, 10.0);
        expect(translate.y, 20.0);
        expect(translate.toString(), 'translate(10.0, 20.0)');
      });

      test('should default y to 0.0', () {
        // Arrange
        const translate = SvgTranslate(10);

        // Act & Assert
        expect(translate.x, 10.0);
        expect(translate.y, 0.0);
        expect(translate.toString(), 'translate(10.0, 0.0)');
      });
    });

    group('SvgScale', () {
      test('should handle x and y and have correct toString', () {
        // Arrange
        const scale = SvgScale(2, 3);

        // Act & Assert
        expect(scale.x, 2.0);
        expect(scale.y, 3.0);
        expect(scale.toString(), 'scale(2.0, 3.0)');
      });

      test('should default y to x', () {
        // Arrange
        const scale = SvgScale(2.5);

        // Act & Assert
        expect(scale.x, 2.5);
        expect(scale.y, 2.5);
        expect(scale.toString(), 'scale(2.5, 2.5)');
      });
    });

    group('SvgRotate', () {
      test('should handle angle without pivot and have correct toString', () {
        // Arrange
        const rotate = SvgRotate(45);

        // Act & Assert
        expect(rotate.angle, 45.0);
        expect(rotate.cx, isNull);
        expect(rotate.cy, isNull);
        expect(rotate.toString(), 'rotate(45.0)');
      });

      test('should handle angle with pivot and have correct toString', () {
        // Arrange
        const rotate = SvgRotate(45, 10, 20);

        // Act & Assert
        expect(rotate.angle, 45.0);
        expect(rotate.cx, 10.0);
        expect(rotate.cy, 20.0);
        expect(rotate.toString(), 'rotate(45.0, 10.0, 20.0)');
      });

      test('should handle partial pivot (treated as no pivot in toString)', () {
        // Arrange
        const rotate = SvgRotate(45, 10);

        // Act & Assert
        expect(rotate.toString(), 'rotate(45.0)');
      });
    });

    group('SvgSkewX', () {
      test('should store angle and have correct toString', () {
        // Arrange
        const skew = SvgSkewX(30);

        // Act & Assert
        expect(skew.angle, 30.0);
        expect(skew.toString(), 'skewX(30.0)');
      });
    });

    group('SvgSkewY', () {
      test('should store angle and have correct toString', () {
        // Arrange
        const skew = SvgSkewY(30);

        // Act & Assert
        expect(skew.angle, 30.0);
        expect(skew.toString(), 'skewY(30.0)');
      });
    });
  });
}
