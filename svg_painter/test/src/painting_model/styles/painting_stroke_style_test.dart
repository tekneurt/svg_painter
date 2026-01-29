import 'package:svg_painter/src/painting_model/styles/painting_style.dart';
import 'package:test/test.dart';

void main() {
  group('PaintingStrokeStyle', () {
    test('should return correct string representation when toString() is called', () {
      // Arrange
      const PaintingStrokeStyle style = PaintingStrokeStyle(
        colorArgb: 0xFF000000,
        width: 2.0,
        opacity: 0.8,
        cap: PaintingStrokeCap.round,
        join: PaintingStrokeJoin.bevel,
      );

      // Act
      final String _ = style.toString();

      // Assert
      expect(
        style.toString(),
        'PaintingStrokeStyle(color: 4278190080, shader: null, width: 2.0, opacity: 0.8, cap: PaintingStrokeCap.round, join: PaintingStrokeJoin.bevel, explicit: true)',
      );
    });
  });
}
