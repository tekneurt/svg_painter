import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/painting_model/styles/painting_style.dart';
import 'package:test/test.dart';

void main() {
  group('DefineClipPath', () {
    test('should construct with distinct properties and return correct toString representation', () {
      // Arrange
      const command = DefineClipPath(
        id: 'clip-alpha',
        commands: <PaintCommand>[],
        clipPathUnits: PaintingGradientUnits.objectBoundingBox,
      );

      // Act
      final result = command.toString();

      // Assert
      expect(command.id, 'clip-alpha');
      expect(command.clipPathUnits, PaintingGradientUnits.objectBoundingBox);
      expect(command.commands, isEmpty);
      expect(result, 'DefineClipPath(id: clip-alpha, commands: 0)');
    });
  });
}
