import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:test/test.dart';

void main() {
  group('PathOperation', () {
    group('MoveTo', () {
      test('should store properties correctly', () {
        // Arrange
        const MoveTo op = MoveTo(10.0, 20.0);

        // Act & Assert
        expect(op.x, 10.0);
        expect(op.y, 20.0);
      });

      test('should return correct string representation', () {
        // Arrange
        const MoveTo op = MoveTo(10.0, 20.0);

        // Act & Assert
        expect(op.toString(), 'MoveTo(10.0, 20.0)');
      });
    });

    group('LineTo', () {
      test('should store properties correctly', () {
        // Arrange
        const LineTo op = LineTo(30.0, 40.0);

        // Act & Assert
        expect(op.x, 30.0);
        expect(op.y, 40.0);
      });

      test('should return correct string representation', () {
        // Arrange
        const LineTo op = LineTo(30.0, 40.0);

        // Act & Assert
        expect(op.toString(), 'LineTo(30.0, 40.0)');
      });
    });

    group('CubicTo', () {
      test('should store properties correctly', () {
        // Arrange
        const CubicTo op = CubicTo(1.0, 2.0, 3.0, 4.0, 5.0, 6.0);

        // Act & Assert
        expect(op.x1, 1.0);
        expect(op.y1, 2.0);
        expect(op.x2, 3.0);
        expect(op.y2, 4.0);
        expect(op.x3, 5.0);
        expect(op.y3, 6.0);
      });

      test('should return correct string representation', () {
        // Arrange
        const CubicTo op = CubicTo(1.0, 2.0, 3.0, 4.0, 5.0, 6.0);

        // Act & Assert
        expect(op.toString(), 'CubicTo((1.0, 2.0), (3.0, 4.0), (5.0, 6.0))');
      });
    });

    group('QuadraticTo', () {
      test('should store properties correctly', () {
        // Arrange
        const QuadraticTo op = QuadraticTo(10.0, 20.0, 30.0, 40.0);

        // Act & Assert
        expect(op.x1, 10.0);
        expect(op.y1, 20.0);
        expect(op.x2, 30.0);
        expect(op.y2, 40.0);
      });

      test('should return correct string representation', () {
        // Arrange
        const QuadraticTo op = QuadraticTo(10.0, 20.0, 30.0, 40.0);

        // Act & Assert
        expect(op.toString(), 'QuadraticTo((10.0, 20.0), (30.0, 40.0))');
      });
    });

    group('ArcTo', () {
      test('should store properties correctly', () {
        // Arrange
        const ArcTo op = ArcTo(5.0, 10.0, 45.0, true, false, 20.0, 30.0);

        // Act & Assert
        expect(op.rx, 5.0);
        expect(op.ry, 10.0);
        expect(op.xAxisRotation, 45.0);
        expect(op.largeArcFlag, isTrue);
        expect(op.sweepFlag, isFalse);
        expect(op.x, 20.0);
        expect(op.y, 30.0);
      });

      test('should return correct string representation', () {
        // Arrange
        const ArcTo op = ArcTo(5.0, 10.0, 45.0, true, false, 20.0, 30.0);

        // Act & Assert
        expect(
          op.toString(),
          'ArcTo(rx: 5.0, ry: 10.0, rot: 45.0, large: true, sweep: false, to: (20.0, 30.0))',
        );
      });
    });

    group('ClosePath', () {
      test('should return correct string representation', () {
        // Arrange
        const ClosePath op = ClosePath();

        // Act & Assert
        expect(op.toString(), 'ClosePath()');
      });
    });
  });
}
