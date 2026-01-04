import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/painting_model/styles/painting_style.dart';
import 'package:test/test.dart';

void main() {
  group('DrawPolygon', () {
    test('should return correct string representation when toString() is called', () {
      // Arrange
      const DrawPolygon command = DrawPolygon(
        points: <double>[10.0, 20.0, 30.0, 40.0],
        style: PaintingStyle(),
      );

      // Act
      final String result = command.toString();

      // Assert
      expect(
        result,
        'DrawPolygon(points: 4, style: PaintingStyle(fill: null, stroke: null, text: null, groupOpacity: 1.0), transform: null)',
      );
    });
  });
}
