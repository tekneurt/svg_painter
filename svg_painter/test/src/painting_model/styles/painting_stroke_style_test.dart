import 'package:svg_painter/src/painting_model/styles/painting_style.dart';
import 'package:test/test.dart';

void main() {
  group('PaintingStrokeStyle', () {
    test('should store all properties correctly when initialized', () {
      // Arrange & Act
      // ignore: prefer_const_constructors
      final style = PaintingStrokeStyle(
        colorArgb: 0xFF00FF00,
        shaderId: 'stroke-shader',
        width: 3.5,
        opacity: 0.6,
        cap: PaintingStrokeCap.square,
        join: PaintingStrokeJoin.round,
        dashArray: const <double>[10.0, 5.0],
        pathLength: 200.0,
        isExplicit: false,
        isCurrentColor: true,
      );

      // Assert
      expect(style.colorArgb, 0xFF00FF00);
      expect(style.shaderId, 'stroke-shader');
      expect(style.width, 3.5);
      expect(style.opacity, 0.6);
      expect(style.cap, PaintingStrokeCap.square);
      expect(style.join, PaintingStrokeJoin.round);
      expect(style.dashArray, equals(<double>[10.0, 5.0]));
      expect(style.pathLength, 200.0);
      expect(style.isExplicit, isFalse);
      expect(style.isCurrentColor, isTrue);
    });

    test('should return correct string representation when toString() is called', () {
      // Arrange
      // ignore: prefer_const_constructors
      final style = PaintingStrokeStyle(
        colorArgb: 0xFF000000,
        shaderId: 'grad2',
        width: 2.0,
        opacity: 0.8,
        cap: PaintingStrokeCap.round,
        join: PaintingStrokeJoin.bevel,
      );

      // Act
      final result = style.toString();

      // Assert
      expect(
        result,
        'PaintingStrokeStyle(color: 4278190080, shader: grad2, units: null, width: 2.0, opacity: 0.8, cap: PaintingStrokeCap.round, join: PaintingStrokeJoin.bevel, explicit: true, currentColor: false)',
      );
    });
  });
}
