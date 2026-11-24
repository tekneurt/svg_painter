import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('DefineFilter', () {
    test(
      'should construct with distinct properties and return correct toString representation',
      () {
        // Arrange
        const command = DefineFilter(
          id: 'filter-1',
          primitives: <SvgFilterPrimitive>[
            SvgFeGaussianBlur(stdDeviationX: 4.0, stdDeviationY: 8.0),
          ],
          x: SvgPercentage(-10.0),
          y: SvgPercentage(-20.0),
          width: SvgPercentage(120.0),
          height: SvgPercentage(140.0),
        );

        // Act
        final result = command.toString();

        // Assert
        expect(command.id, 'filter-1');
        expect(command.primitives.length, 1);
        expect(command.x, const SvgPercentage(-10.0));
        expect(command.y, const SvgPercentage(-20.0));
        expect(command.width, const SvgPercentage(120.0));
        expect(command.height, const SvgPercentage(140.0));
        expect(result, 'DefineFilter(id: filter-1, primitives: 1)');
      },
    );
  });
}
