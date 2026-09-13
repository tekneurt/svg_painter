import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/painting_model/styles/painting_style.dart';
import 'package:test/test.dart';

void main() {
  group('DrawGroup', () {
    test('should return correct string representation when toString() is called', () {
      // Arrange
      const command = DrawGroup(
        commands: <PaintCommand>[DrawCircle(cx: 1.0, cy: 2.0, radius: 5.0, style: PaintingStyle())],
        opacity: 0.5,
      );

      // Act
      command.toString();

      // Assert
      expect(
        command.toString(),
        'DrawGroup(cmds: 1, style: PaintingStyle(), opacity: 0.5)',
      );
    });
  });
}
