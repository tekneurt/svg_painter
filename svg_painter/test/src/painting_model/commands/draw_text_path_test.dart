import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/painting_model/styles/painting_style.dart';
import 'package:test/test.dart';

void main() {
  group('DrawTextPath', () {
    test('should return correct string representation when toString() is called', () {
      // Arrange
      const command = DrawTextPath(
        pathOperations: <PathOperation>[
          MoveTo(10.0, 20.0),
          LineTo(30.0, 40.0),
        ],
        text: 'Quick fox',
        startOffset: 15.0,
        style: PaintingStyle(),
        id: 'tp1',
      );

      // Act
      final result = command.toString();

      // Assert
      expect(
        result,
        "DrawTextPath(pathOperations: 2, text: 'Quick fox', startOffset: 15.0, style: PaintingStyle(), id: tp1)",
      );
    });

    test('should have correct default startOffset when omitted', () {
      // Arrange
      const command = DrawTextPath(
        pathOperations: <PathOperation>[
          MoveTo(10.0, 20.0),
        ],
        text: 'Path text',
        style: PaintingStyle(),
      );

      // Act & Assert
      expect(command.startOffset, 0.0);
      expect(command.text, 'Path text');
      expect(command.pathOperations.length, 1);
    });
  });
}
