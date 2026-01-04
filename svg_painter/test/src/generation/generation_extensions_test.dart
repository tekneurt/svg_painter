import 'package:svg_painter/src/generation/generation_extensions.dart';
import 'package:svg_painter/src/painting_model/styles/painting_style.dart';
import 'package:test/test.dart';

void main() {
  group('GenerationExtensions', () {
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
