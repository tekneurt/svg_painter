import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/painting_model/styles/painting_style.dart';
import 'package:test/test.dart';

void main() {
  group('DrawText', () {
    test('should return correct string representation when toString() is called', () {
      // Arrange
      const DrawText command = DrawText(x: 10.0, y: 20.0, text: 'Hello', style: PaintingStyle());

      // Act
      final String result = command.toString();

      // Assert
      expect(
        result,
        'DrawText(x: 10.0, y: 20.0, text: Hello, style: PaintingStyle(fill: null, stroke: null, text: null, groupOpacity: 1.0), transform: null)',
      );
    });
  });
}
