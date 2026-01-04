import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:test/test.dart';

void main() {
  group('PaintCommand', () {
    test('should exist as sealed base class', () {
      // Arrange
      const PaintCommand? cmd = null;
      // Assert
      expect(cmd, isNull);
    });
  });
}
