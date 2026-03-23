import 'package:svg_painter/src/generation/generation_extensions.dart';
import 'package:svg_painter/src/painting_model/styles/painting_style.dart';
import 'package:svg_painter/src/svg_model/_svg_model.dart';
import 'package:test/test.dart';

void main() {
  group('GenerationExtensions', () {
    group('SvgTransformAttributesToFlutterMatrix', () {
      test('should handle all transform operations correctly', () {
        const transform = SvgTransformAttributes(<SvgTransformOperation>[
          SvgMatrix(1, 0, 0, 1, 10, 20),
          SvgTranslate(5, 5),
          SvgScale(2, 2),
          SvgRotate(45),
          SvgRotate(90, 10, 10), // Centered rotate
          SvgSkewX(10),
          SvgSkewY(10),
        ]);

        final List<double> matrix = transform.toFlutterMatrix();
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
