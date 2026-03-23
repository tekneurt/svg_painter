import 'package:svg_painter/src/painting_model/_painting_model.dart';
import 'package:test/test.dart';

void main() {
  group('DrawText', () {
    test('should return correct string representation when toString() is called', () {
      // Arrange
      const command = DrawText(
        x: 10.0,
        y: 20.0,
        rootSpan: PaintingTextSpan(text: 'Hello'),
        style: PaintingStyle(),
      );

      // Act
      final result = command.toString();

      // Assert
      expect(
        result,
        'DrawText(x: 10.0, y: 20.0, span: PaintingTextSpan(text: Hello, children: 0, style: null), style: PaintingStyle(fill: null, stroke: null, text: null, groupOpacity: 1.0, transform: null, clipRect: null), id: null)',
      );
    });
  });
}
