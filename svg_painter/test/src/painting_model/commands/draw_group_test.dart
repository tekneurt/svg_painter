import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/painting_model/styles/painting_style.dart';
import 'package:test/test.dart';

void main() {
  group('DrawGroup', () {
    test('should return correct string representation when toString() is called', () {
      // Arrange
      const DrawGroup command = DrawGroup(
        commands: <PaintCommand>[DrawCircle(cx: 1.0, cy: 2.0, radius: 5.0, style: PaintingStyle())],
        transform: 'translate(10, 11)',
        groupOpacity: 0.5,
      );

      // Act
      final String result = command.toString();

      // Assert
      expect(result, 'DrawGroup(cmds: 1, transform: translate(10, 11), opacity: 0.5)');
    });
  });
}
