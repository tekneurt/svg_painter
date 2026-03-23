import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/painting_model/styles/painting_style.dart';
import 'package:test/test.dart';

void main() {
  group('DrawRect', () {
    test('should return correct string representation when toString() is called', () {
      // Arrange
      const command = DrawRect(
        x: 10.0,
        y: 20.0,
        width: 100.0,
        height: 50.0,
        rx: 5.0,
        ry: 8.0,
        style: PaintingStyle(),
      );

      // Act
      final result = command.toString();

      // Assert
      expect(
        result,
        'DrawRect(x: 10.0, y: 20.0, w: 100.0, h: 50.0, rx: 5.0, ry: 8.0, style: PaintingStyle(fill: null, stroke: null, text: null, groupOpacity: 1.0, transform: null, clipRect: null), id: null)',
      );
    });
  });
}
