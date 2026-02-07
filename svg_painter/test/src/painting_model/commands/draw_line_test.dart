import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/painting_model/styles/painting_style.dart';
import 'package:test/test.dart';

void main() {
  group('DrawLine', () {
    test('should return correct string representation when toString() is called', () {
      // Arrange
      const DrawLine command = DrawLine(
        x1: 10.0,
        y1: 20.0,
        x2: 100.0,
        y2: 200.0,
        style: PaintingStyle(),
      );

      // Act
      final String result = command.toString();

      // Assert
      expect(
        result,
        'DrawLine(x1: 10.0, y1: 20.0, x2: 100.0, y2: 200.0, style: PaintingStyle(fill: null, stroke: null, text: null, groupOpacity: 1.0, transform: null), id: null)',
      );
    });
  });
}
