import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/painting_model/styles/painting_style.dart';
import 'package:test/test.dart';

void main() {
  group('DrawPath', () {
    test('should return correct string representation when toString() is called', () {
      // Arrange
      const DrawPath command = DrawPath(
        operations: <PathOperation>[MoveTo(10.0, 20.0), LineTo(30.0, 40.0), ClosePath()],
        style: PaintingStyle(),
      );

      // Act
      final String result = command.toString();

      // Assert
      expect(
        result,
        'DrawPath(ops: 3, style: PaintingStyle(fill: null, stroke: null, text: null, groupOpacity: 1.0), transform: null)',
      );
    });

    test('PathOperation subclasses should return correct string representations', () {
      expect(const MoveTo(1.0, 2.0).toString(), 'MoveTo(1.0, 2.0)');
      expect(const LineTo(3.0, 4.0).toString(), 'LineTo(3.0, 4.0)');
      expect(
        const CubicTo(1.0, 2.0, 3.0, 4.0, 5.0, 6.0).toString(),
        'CubicTo((1.0, 2.0), (3.0, 4.0), (5.0, 6.0))',
      );
      expect(
        const QuadraticTo(1.0, 2.0, 3.0, 4.0).toString(),
        'QuadraticTo((1.0, 2.0), (3.0, 4.0))',
      );
      expect(
        const ArcTo(5.0, 10.0, 45.0, true, false, 20.0, 30.0).toString(),
        'ArcTo(rx: 5.0, ry: 10.0, rot: 45.0, large: true, sweep: false, to: (20.0, 30.0))',
      );
      expect(const ClosePath().toString(), 'ClosePath()');
    });
  });
}
