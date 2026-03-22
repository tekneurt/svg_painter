import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/painting_model/styles/painting_style.dart';
import 'package:test/test.dart';

void main() {
  group('DrawCircle', () {
    test('should return correct string representation when toString() is called', () {
      // Arrange
      const command = DrawCircle(
        cx: 10.0,
        cy: 20.0,
        radius: 5.0,
        style: PaintingStyle(),
      );

      // Act
      final result = command.toString();

      // Assert
      expect(
        result,
        'DrawCircle(cx: 10.0, cy: 20.0, radius: 5.0, style: PaintingStyle(fill: null, stroke: null, text: null, groupOpacity: 1.0, transform: null, clipRect: null), id: null)',
      );
    });
  });
}
