import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/painting_model/styles/painting_style.dart';
import 'package:test/test.dart';

void main() {
  group('DrawGroup', () {
    test('should return correct string representation when toString() is called', () {
      // Arrange
      const DrawGroup command = DrawGroup(
        commands: <PaintCommand>[DrawCircle(cx: 1.0, cy: 2.0, radius: 5.0, style: PaintingStyle())],
        opacity: 0.5,
      );

      // Act
      command.toString();

      // Assert
      expect(
        command.toString(),
        'DrawGroup(cmds: 1, style: PaintingStyle(fill: null, stroke: null, text: null, groupOpacity: 1.0, transform: null, clipRect: null), opacity: 0.5)',
      );
    });
  });
}
