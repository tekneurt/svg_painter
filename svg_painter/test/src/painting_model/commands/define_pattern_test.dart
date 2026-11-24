import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('DefinePattern', () {
    test(
      'should construct with distinct properties and return correct toString representation',
      () {
        // Arrange
        const command = DefinePattern(
          id: 'pattern-1',
          commands: <PaintCommand>[],
          x: SvgLength(5.0),
          y: SvgPercentage(0.1),
          width: SvgPercentage(0.2),
          height: SvgLength(25.0),
          patternUnits: SvgPatternUnits.userSpaceOnUse,
          patternContentUnits: SvgPatternUnits.objectBoundingBox,
          viewBox: SvgViewBox(1.0, 2.0, 30.0, 40.0),
        );

        // Act
        final result = command.toString();

        // Assert
        expect(command.id, 'pattern-1');
        expect(command.commands, isEmpty);
        expect(command.x, const SvgLength(5.0));
        expect(command.y, const SvgPercentage(0.1));
        expect(command.width, const SvgPercentage(0.2));
        expect(command.height, const SvgLength(25.0));
        expect(command.patternUnits, SvgPatternUnits.userSpaceOnUse);
        expect(command.patternContentUnits, SvgPatternUnits.objectBoundingBox);
        expect(command.viewBox, const SvgViewBox(1.0, 2.0, 30.0, 40.0));
        expect(result, 'DefinePattern(id: pattern-1, commands: 0)');
      },
    );
  });
}
