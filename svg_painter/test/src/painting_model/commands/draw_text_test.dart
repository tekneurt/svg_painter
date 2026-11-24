import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/painting_model/styles/painting_style.dart';
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
        'DrawText(x: 10.0, y: 20.0, span: PaintingTextSpan(text: Hello, children: 0, style: null), style: PaintingStyle())',
      );
    });

    test('should include chunks count in toString when chunks are provided', () {
      // Arrange
      const command = DrawText(
        x: 15.0,
        y: 25.0,
        rootSpan: PaintingTextSpan(text: 'AB'),
        style: PaintingStyle(),
        chunks: <PaintingTextChunk>[
          PaintingTextChunk(text: 'A', x: 15.0, y: 25.0),
          PaintingTextChunk(text: 'B', x: 30.0, y: 25.0),
        ],
      );

      // Act
      final result = command.toString();

      // Assert
      expect(result, contains('chunks: 2'));
    });
  });
}
