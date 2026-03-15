import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/painting_model/styles/painting_style.dart';
import 'package:test/test.dart';

void main() {
  group('DrawOval', () {
    test('should return correct string representation when toString() is called', () {
      // Arrange
      const DrawOval command = DrawOval(
        cx: 50.0,
        cy: 60.0,
        rx: 30.0,
        ry: 20.0,
        style: PaintingStyle(),
      );

      // Act
      final String result = command.toString();

      // Assert
      expect(
        result,
        'DrawOval(cx: 50.0, cy: 60.0, rx: 30.0, ry: 20.0, style: PaintingStyle(fill: null, stroke: null, text: null, groupOpacity: 1.0, transform: null), id: null)',
      );
    });
  });
}
