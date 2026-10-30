import 'package:svg_painter/src/generation/generation_extensions.dart';
import 'package:svg_painter/src/painting_model/styles/painting_style.dart';
import 'package:svg_painter/src/svg_model/attribute_groups/svg_transform_attributes.dart';
import 'package:test/test.dart';

void main() {
  group('GenerationExtensions', () {
    group('SvgTransformAttributesToFlutterMatrix', () {
      test('should return identity matrix when operations list is empty', () {
        // Arrange
        const transform = SvgTransformAttributes(<SvgTransformOperation>[]);

        // Act
        final List<double> matrix = transform.toFlutterMatrix();

        // Assert
        expect(matrix, <double>[
          1.0, 0.0, 0.0, 0.0,
          0.0, 1.0, 0.0, 0.0,
          0.0, 0.0, 1.0, 0.0,
          0.0, 0.0, 0.0, 1.0,
        ]);
      });

      test('should return translation matrix when SvgTranslate is used', () {
        // Arrange
        const transform = SvgTransformAttributes(<SvgTransformOperation>[
          SvgTranslate(15.0, 25.0),
        ]);

        // Act
        final List<double> matrix = transform.toFlutterMatrix();

        // Assert
        expect(matrix, <double>[
          1.0, 0.0, 0.0, 0.0,
          0.0, 1.0, 0.0, 0.0,
          0.0, 0.0, 1.0, 0.0,
          15.0, 25.0, 0.0, 1.0,
        ]);
      });

      test('should return scale matrix when SvgScale is used with distinct x and y', () {
        // Arrange
        const transform = SvgTransformAttributes(<SvgTransformOperation>[
          SvgScale(2.5, 3.5),
        ]);

        // Act
        final List<double> matrix = transform.toFlutterMatrix();

        // Assert
        expect(matrix, <double>[
          2.5, 0.0, 0.0, 0.0,
          0.0, 3.5, 0.0, 0.0,
          0.0, 0.0, 1.0, 0.0,
          0.0, 0.0, 0.0, 1.0,
        ]);
      });

      test('should return rotation matrix when SvgRotate is used without center', () {
        // Arrange
        const transform = SvgTransformAttributes(<SvgTransformOperation>[
          SvgRotate(90.0),
        ]);

        // Act
        final List<double> matrix = transform.toFlutterMatrix();

        // Assert
        expect(matrix[0], closeTo(0.0, 1e-10));
        expect(matrix[1], closeTo(1.0, 1e-10));
        expect(matrix[4], closeTo(-1.0, 1e-10));
        expect(matrix[5], closeTo(0.0, 1e-10));
        expect(matrix[10], 1.0);
        expect(matrix[15], 1.0);
      });

      test('should return centered rotation matrix when SvgRotate is used with cx and cy', () {
        // Arrange
        const transform = SvgTransformAttributes(<SvgTransformOperation>[
          SvgRotate(90.0, 10.0, 20.0),
        ]);

        // Act
        final List<double> matrix = transform.toFlutterMatrix();

        // Assert: rotate 90 deg around (10, 20)
        // x' = 10 - (y - 20) = 30 - y
        // y' = 20 + (x - 10) = 10 + x
        expect(matrix[0], closeTo(0.0, 1e-10));
        expect(matrix[1], closeTo(1.0, 1e-10));
        expect(matrix[4], closeTo(-1.0, 1e-10));
        expect(matrix[5], closeTo(0.0, 1e-10));
        expect(matrix[12], closeTo(30.0, 1e-10));
        expect(matrix[13], closeTo(10.0, 1e-10));
      });

      test('should return skewX matrix when SvgSkewX is used', () {
        // Arrange
        const transform = SvgTransformAttributes(<SvgTransformOperation>[
          SvgSkewX(45.0),
        ]);

        // Act
        final List<double> matrix = transform.toFlutterMatrix();

        // Assert
        expect(matrix[0], 1.0);
        expect(matrix[4], closeTo(1.0, 1e-10)); // tan(45 deg) = 1
        expect(matrix[5], 1.0);
        expect(matrix[10], 1.0);
        expect(matrix[15], 1.0);
      });

      test('should return skewY matrix when SvgSkewY is used', () {
        // Arrange
        const transform = SvgTransformAttributes(<SvgTransformOperation>[
          SvgSkewY(45.0),
        ]);

        // Act
        final List<double> matrix = transform.toFlutterMatrix();

        // Assert
        expect(matrix[0], 1.0);
        expect(matrix[1], closeTo(1.0, 1e-10)); // tan(45 deg) = 1
        expect(matrix[5], 1.0);
        expect(matrix[10], 1.0);
        expect(matrix[15], 1.0);
      });

      test('should return matrix when SvgMatrix is used', () {
        // Arrange
        const transform = SvgTransformAttributes(<SvgTransformOperation>[
          SvgMatrix(1.5, 2.5, 3.5, 4.5, 5.5, 6.5),
        ]);

        // Act
        final List<double> matrix = transform.toFlutterMatrix();

        // Assert
        expect(matrix[0], 1.5);
        expect(matrix[1], 2.5);
        expect(matrix[4], 3.5);
        expect(matrix[5], 4.5);
        expect(matrix[12], 5.5);
        expect(matrix[13], 6.5);
        expect(matrix[10], 1.0);
        expect(matrix[15], 1.0);
      });

      test('should chain and multiply nested operations in correct order when multiple transforms are provided', () {
        // Arrange: translate by (10, 20) followed by scale by (2, 3)
        const transform = SvgTransformAttributes(<SvgTransformOperation>[
          SvgTranslate(10.0, 20.0),
          SvgScale(2.0, 3.0),
        ]);

        // Act
        final List<double> matrix = transform.toFlutterMatrix();

        // Assert: T * S
        expect(matrix[0], 2.0);
        expect(matrix[5], 3.0);
        expect(matrix[12], 10.0);
        expect(matrix[13], 20.0);
        expect(matrix[10], 1.0);
        expect(matrix[15], 1.0);
      });

      test('should handle all transform operations correctly', () {
        // Arrange
        const transform = SvgTransformAttributes(<SvgTransformOperation>[
          SvgMatrix(1, 0, 0, 1, 10, 20),
          SvgTranslate(5, 5),
          SvgScale(2, 2),
          SvgRotate(45),
          SvgRotate(90, 10, 10),
          SvgSkewX(10),
          SvgSkewY(10),
        ]);

        // Act
        final List<double> matrix = transform.toFlutterMatrix();

        // Assert
        expect(matrix, hasLength(16));
      });
    });

    group('PaintingStrokeCapToFlutterString', () {
      test('should return correct string for each PaintingStrokeCap', () {
        // Arrange & Act & Assert
        expect(PaintingStrokeCap.butt.toFlutterString(), 'StrokeCap.butt');
        expect(PaintingStrokeCap.round.toFlutterString(), 'StrokeCap.round');
        expect(PaintingStrokeCap.square.toFlutterString(), 'StrokeCap.square');
      });
    });

    group('PaintingStrokeJoinToFlutterString', () {
      test('should return correct string for each PaintingStrokeJoin', () {
        // Arrange & Act & Assert
        expect(PaintingStrokeJoin.miter.toFlutterString(), 'StrokeJoin.miter');
        expect(PaintingStrokeJoin.round.toFlutterString(), 'StrokeJoin.round');
        expect(PaintingStrokeJoin.bevel.toFlutterString(), 'StrokeJoin.bevel');
      });
    });
  });
}
