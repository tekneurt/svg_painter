import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/svg_conversion/converters/svg_painting_context.dart';

import 'package:svg_painter/src/svg_conversion/svg_element_extensions/svg_image_to_draw_image.dart';
import 'package:svg_painter/src/svg_model/_svg_model.dart';
import 'package:test/test.dart';

void main() {
  group('SvgImageToDrawImage', () {
    test('should convert SvgImage to DrawImage command when bytes are present', () {
      // Arrange
      final bytes = [1, 2, 3];
      final context = SvgPaintingContext(
        viewBoxWidth: 100,
        viewBoxHeight: 100,
        imageCache: {'img.png': bytes},
      );
      const image = SvgImage(
        href: 'img.png',
        x: SvgLength(0),
        y: SvgLength(0),
        width: SvgLength(10),
        height: SvgLength(10),
      );

      // Act
      final Result<List<PaintCommand>> result = image.toPaintCommands(context);

      // Assert
      expect(result.fold((f) => false, (s) => true), isTrue);
      expect(result.fold((f) => <PaintCommand>[], (s) => s).length, equals(1));
    });
  });
}
