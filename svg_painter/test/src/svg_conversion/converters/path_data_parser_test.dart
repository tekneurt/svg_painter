import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/svg_conversion/converters/path_data_parser.dart';
import 'package:svg_painter/src/svg_conversion/converters/svg_painting_context.dart';
import 'package:test/test.dart';

void main() {
  const SvgPaintingContext context = SvgPaintingContext(viewBoxWidth: 100, viewBoxHeight: 200);

  group('PathDataParser', () {
    group('parse', () {
      test('should return Success with MoveTo when M is provided', () {
        // Arrange
        const String d = 'M 10 20';

        // Act
        final Result<List<PathOperation>> result = PathDataParser.parse(d, context);

        // Assert
        expect(result, isA<Success<List<PathOperation>>>());
        final List<PathOperation> ops = (result as Success<List<PathOperation>>).value;
        expect(ops, hasLength(1));
        expect(ops[0], isA<MoveTo>());
        final MoveTo move = ops[0] as MoveTo;
        expect(move.x, 10.0);
        expect(move.y, 20.0);
      });

      test('should return Success with relative MoveTo when m is provided', () {
        // Arrange
        const String d = 'M 10 20 m 5 5';

        // Act
        final Result<List<PathOperation>> result = PathDataParser.parse(d, context);

        // Assert
        final List<PathOperation> ops = (result as Success<List<PathOperation>>).value;
        expect(ops, hasLength(2));
        final MoveTo move2 = ops[1] as MoveTo;
        expect(move2.x, 15.0); // 10 + 5
        expect(move2.y, 25.0); // 20 + 5
      });

      test('should treat subsequent coordinates as LineTo when M has multiple pairs', () {
        // Arrange
        const String d = 'M 10 20 30 40';

        // Act
        final Result<List<PathOperation>> result = PathDataParser.parse(d, context);

        // Assert
        final List<PathOperation> ops = (result as Success<List<PathOperation>>).value;
        expect(ops, hasLength(2));
        expect(ops[0], isA<MoveTo>());
        expect(ops[1], isA<LineTo>());
        final LineTo line = ops[1] as LineTo;
        expect(line.x, 30.0);
        expect(line.y, 40.0);
      });

      test('should return Success with LineTo when L/l is provided', () {
        // Arrange
        const String d = 'M 0 0 L 10 20 l 5 5';

        // Act
        final Result<List<PathOperation>> result = PathDataParser.parse(d, context);

        // Assert
        final List<PathOperation> ops = (result as Success<List<PathOperation>>).value;
        expect(ops, hasLength(3));
        expect(ops[1], isA<LineTo>());
        expect((ops[1] as LineTo).x, 10.0);
        expect((ops[2] as LineTo).x, 15.0);
      });

      test('should return Success with horizontal line when H/h is provided', () {
        // Arrange
        const String d = 'M 10 20 H 30 h 5';

        // Act
        final Result<List<PathOperation>> result = PathDataParser.parse(d, context);

        // Assert
        final List<PathOperation> ops = (result as Success<List<PathOperation>>).value;
        expect(ops, hasLength(3));
        expect(ops[1], isA<LineTo>());
        expect((ops[1] as LineTo).x, 30.0);
        expect((ops[1] as LineTo).y, 20.0);
        expect((ops[2] as LineTo).x, 35.0);
        expect((ops[2] as LineTo).y, 20.0);
      });

      test('should return Success with vertical line when V/v is provided', () {
        // Arrange
        const String d = 'M 10 20 V 40 v 5';

        // Act
        final Result<List<PathOperation>> result = PathDataParser.parse(d, context);

        // Assert
        final List<PathOperation> ops = (result as Success<List<PathOperation>>).value;
        expect(ops, hasLength(3));
        expect(ops[1], isA<LineTo>());
        expect((ops[1] as LineTo).x, 10.0);
        expect((ops[1] as LineTo).y, 40.0);
        expect((ops[2] as LineTo).x, 10.0);
        expect((ops[2] as LineTo).y, 45.0);
      });

      test('should return Success with CubicTo when C/c is provided', () {
        // Arrange
        const String d = 'M 0 0 C 10 10 20 20 30 30 c 5 5 10 10 15 15';

        // Act
        final Result<List<PathOperation>> result = PathDataParser.parse(d, context);

        // Assert
        final List<PathOperation> ops = (result as Success<List<PathOperation>>).value;
        expect(ops, hasLength(3));
        expect(ops[1], isA<CubicTo>());
        final CubicTo cubic1 = ops[1] as CubicTo;
        expect(cubic1.x1, 10.0);
        expect(cubic1.x2, 20.0);
        expect(cubic1.x3, 30.0);

        final CubicTo cubic2 = ops[2] as CubicTo;
        expect(cubic2.x1, 35.0); // 30 + 5
        expect(cubic2.x2, 40.0); // 30 + 10
        expect(cubic2.x3, 45.0); // 30 + 15
      });

      test('should resolve control point correctly when S/s is provided', () {
        // Arrange
        // M 0 0 C 10 20 30 40 50 60
        // Last control point was (30, 40), last point (50, 60)
        // S 70 80 90 100
        // Reflected control point: (2*50 - 30, 2*60 - 40) = (70, 80)
        const String d = 'M 0 0 C 10 20 30 40 50 60 S 70 80 90 100';

        // Act
        final Result<List<PathOperation>> result = PathDataParser.parse(d, context);

        // Assert
        final List<PathOperation> ops = (result as Success<List<PathOperation>>).value;
        expect(ops, hasLength(3));
        final CubicTo smooth = ops[2] as CubicTo;
        expect(smooth.x1, 70.0);
        expect(smooth.y1, 80.0);
        expect(smooth.x2, 70.0);
        expect(smooth.y2, 80.0);
        expect(smooth.x3, 90.0);
        expect(smooth.y3, 100.0);
      });

      test('should use current point as control point when S/s is not preceded by cubic', () {
        // Arrange
        const String d = 'M 10 20 S 30 40 50 60';

        // Act
        final Result<List<PathOperation>> result = PathDataParser.parse(d, context);

        // Assert
        final List<PathOperation> ops = (result as Success<List<PathOperation>>).value;
        final CubicTo smooth = ops[1] as CubicTo;
        expect(smooth.x1, 10.0);
        expect(smooth.y1, 20.0);
      });

      test('should return Success with QuadraticTo when Q/q is provided', () {
        // Arrange
        const String d = 'M 0 0 Q 10 20 30 40 q 5 5 10 10';

        // Act
        final Result<List<PathOperation>> result = PathDataParser.parse(d, context);

        // Assert
        final List<PathOperation> ops = (result as Success<List<PathOperation>>).value;
        expect(ops, hasLength(3));
        expect(ops[1], isA<QuadraticTo>());
        final QuadraticTo quad1 = ops[1] as QuadraticTo;
        expect(quad1.x1, 10.0);
        expect(quad1.x2, 30.0);

        final QuadraticTo quad2 = ops[2] as QuadraticTo;
        expect(quad2.x1, 35.0); // 30 + 5
        expect(quad2.x2, 40.0); // 30 + 10
      });

      test('should resolve control point correctly when T/t is provided', () {
        // Arrange
        // M 0 0 Q 10 10 30 30
        // Last control point (10, 10), last point (30, 30)
        // T 40 40
        // Reflected: (2*30 - 10, 2*30 - 10) = (50, 50)
        const String d = 'M 0 0 Q 10 10 30 30 T 40 40';

        // Act
        final Result<List<PathOperation>> result = PathDataParser.parse(d, context);

        // Assert
        final List<PathOperation> ops = (result as Success<List<PathOperation>>).value;
        expect(ops, hasLength(3));
        final QuadraticTo smooth = ops[2] as QuadraticTo;
        expect(smooth.x1, 50.0);
        expect(smooth.y1, 50.0);
        expect(smooth.x2, 40.0);
        expect(smooth.y2, 40.0);
      });

      test('should return Success with ArcTo when A/a is provided', () {
        // Arrange
        const String d = 'M 10 10 A 5 5 0 0 1 20 20 a 2 2 45 1 0 5 5';

        // Act
        final Result<List<PathOperation>> result = PathDataParser.parse(d, context);

        // Assert
        final List<PathOperation> ops = (result as Success<List<PathOperation>>).value;
        expect(ops, hasLength(3));
        expect(ops[1], isA<ArcTo>());
        final ArcTo arc1 = ops[1] as ArcTo;
        expect(arc1.rx, 5.0);
        expect(arc1.ry, 5.0);
        expect(arc1.xAxisRotation, 0.0);
        expect(arc1.largeArcFlag, isFalse);
        expect(arc1.sweepFlag, isTrue);
        expect(arc1.x, 20.0);

        final ArcTo arc2 = ops[2] as ArcTo;
        expect(arc2.xAxisRotation, 45.0);
        expect(arc2.largeArcFlag, isTrue);
        expect(arc2.sweepFlag, isFalse);
        expect(arc2.x, 25.0); // 20 + 5
      });

      test('should return Success with ClosePath when Z/z is provided', () {
        // Arrange
        const String d = 'M 10 10 L 20 20 Z';

        // Act
        final Result<List<PathOperation>> result = PathDataParser.parse(d, context);

        // Assert
        final List<PathOperation> ops = (result as Success<List<PathOperation>>).value;
        expect(ops, hasLength(3));
        expect(ops[2], isA<ClosePath>());
      });

      test('should handle commas and multiple spaces between parameters', () {
        // Arrange
        const String d = 'M10,20  L 30 , 40,50,60';

        // Act
        final Result<List<PathOperation>> result = PathDataParser.parse(d, context);

        // Assert
        final List<PathOperation> ops = (result as Success<List<PathOperation>>).value;
        expect(ops, hasLength(3));
        expect(ops[0], isA<MoveTo>());
        expect(ops[1], isA<LineTo>());
        expect(ops[2], isA<LineTo>());
      });

      test('should handle scientific notation in coordinates', () {
        // Arrange
        const String d = 'M 1e1 2.5e-1 L -1.5e2 0';

        // Act
        final Result<List<PathOperation>> result = PathDataParser.parse(d, context);

        // Assert
        final List<PathOperation> ops = (result as Success<List<PathOperation>>).value;
        expect((ops[0] as MoveTo).x, 10.0);
        expect((ops[0] as MoveTo).y, 0.25);
        expect((ops[1] as LineTo).x, -150.0);
      });

      test('should return Failure when command has insufficient parameters', () {
        // Arrange
        const String d = 'M 10';

        // Act
        final Result<List<PathOperation>> result = PathDataParser.parse(d, context);

        // Assert
        expect(result, isA<Failure<List<PathOperation>>>());
        expect(
          (result as Failure<List<PathOperation>>).message,
          contains('Insufficient parameters'),
        );
      });

      test('should return Failure when unknown command is provided', () {
        // Arrange
        const String d = 'M 10 10 K 20 20';

        // Act
        final Result<List<PathOperation>> result = PathDataParser.parse(d, context);

        // Assert
        expect(result, isA<Failure<List<PathOperation>>>());
        expect((result as Failure<List<PathOperation>>).message, contains('Unknown path command'));
      });

      test('should return Failure when path starts with a coordinate instead of a command', () {
        // Arrange
        const String d = '10 10 L 20 20';

        // Act
        final Result<List<PathOperation>> result = PathDataParser.parse(d, context);

        // Assert
        expect(result, isA<Failure<List<PathOperation>>>());
        expect((result as Failure<List<PathOperation>>).message, contains('Expected path command'));
      });
    });
  });
}
