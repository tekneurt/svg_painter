import 'package:svg_painter/src/generation/command_generator.dart';
import 'package:svg_painter/src/generation/generator_buffer.dart';
import 'package:svg_painter/src/generation/generators/pattern_generator.dart';
import 'package:svg_painter/src/generation/generators/rect_generator.dart';
import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/painting_model/styles/painting_style.dart';
import 'package:svg_painter/src/svg_model/attribute_groups/svg_transform_attributes.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('PatternGenerator', () {
    test(
      'should generate pattern creation method when objectBoundingBox and viewBox are provided',
      () {
        // Arrange
        const generator = PatternGenerator();
        final generators = <Type, CommandGenerator<PaintCommand>>{
          DrawRect: const RectGenerator(),
        };
        const command = DefinePattern(
          id: 'star',
          commands: <PaintCommand>[
            DrawRect(
              x: 1.0,
              y: 2.0,
              width: 8.0,
              height: 6.0,
              rx: 0.0,
              ry: 0.0,
              style: PaintingStyle(
                fill: PaintingFillStyle(colorArgb: 0xFF0000FF),
              ),
            ),
          ],
          x: SvgPercentage(5.0),
          y: SvgPercentage(10.0),
          width: SvgPercentage(20.0),
          height: SvgPercentage(30.0),
          viewBox: SvgViewBox(0.0, 0.0, 10.0, 10.0),
        );
        final buffer = GeneratorBuffer();

        // Act
        generator.generate(command, buffer, generators: generators);

        // Assert
        final output = buffer.toString();
        expect(output, contains('ImageShader? _createPattern_star(Rect targetBounds) {'));
        expect(output, contains('final double tileWidth = targetBounds.width * 0.2;'));
        expect(output, contains('final double tileHeight = targetBounds.height * 0.3;'));
        expect(output, contains('final double originX = targetBounds.left + targetBounds.width * 0.05;'));
        expect(output, contains('final double originY = targetBounds.top + targetBounds.height * 0.1;'));
        expect(output, contains('if (tileWidth <= 0.0 || tileHeight <= 0.0) {'));
        expect(output, contains('return null;'));
        expect(output, contains('final int imgWidth = tileWidth.round().clamp(1, 2048);'));
        expect(output, contains('final int imgHeight = tileHeight.round().clamp(1, 2048);'));
        expect(output, contains('final ui.PictureRecorder recorder = ui.PictureRecorder();'));
        expect(output, contains('final ui.Picture picture = recorder.endRecording();'));
        expect(output, contains('final image = picture.toImageSync(imgWidth, imgHeight);'));
        expect(output, contains('return ImageShader('));
      },
    );

    test(
      'should generate pattern creation method when userSpaceOnUse without viewBox is provided',
      () {
        // Arrange
        const generator = PatternGenerator();
        final generators = <Type, CommandGenerator<PaintCommand>>{
          DrawRect: const RectGenerator(),
        };
        const command = DefinePattern(
          id: 'grid',
          commands: <PaintCommand>[
            DrawRect(
              x: 0.0,
              y: 0.0,
              width: 20.0,
              height: 20.0,
              rx: 0.0,
              ry: 0.0,
              style: PaintingStyle(
                fill: PaintingFillStyle(colorArgb: 0xFFFF0000),
              ),
            ),
          ],
          x: SvgLength(4.0),
          y: SvgLength(5.0),
          width: SvgLength(20.0),
          height: SvgLength(30.0),
          patternUnits: SvgPatternUnits.userSpaceOnUse,
        );
        final buffer = GeneratorBuffer();

        // Act
        generator.generate(command, buffer, generators: generators);

        // Assert
        final output = buffer.toString();
        expect(output, contains('ImageShader? _createPattern_grid(Rect targetBounds) {'));
        expect(output, contains('final double tileWidth = 20.0;'));
        expect(output, contains('final double tileHeight = 30.0;'));
        expect(output, contains('final double originX = 4.0;'));
        expect(output, contains('final double originY = 5.0;'));
        expect(output, contains('return ImageShader('));
      },
    );

    test(
      'should emit objectBoundingBox length/percentage factors, slice viewBox, and patternTransform',
      () {
        // Arrange
        const generator = PatternGenerator();
        final generators = <Type, CommandGenerator<PaintCommand>>{
          DrawRect: const RectGenerator(),
        };
        const command = DefinePattern(
          id: 'slicedPat',
          x: SvgLength(0.2),
          y: SvgLength(0.1),
          width: SvgLength(0.5),
          height: SvgLength(0.4),
          patternContentUnits: .objectBoundingBox,
          viewBox: SvgViewBox(5.0, 10.0, 20.0, 40.0),
          preserveAspectRatio: SvgPreserveAspectRatio(scale: .slice),
          patternTransform: SvgTransformAttributes(<SvgTransformOperation>[
            SvgTranslate(3.0, 4.0),
          ]),
          commands: <PaintCommand>[],
        );
        final buffer = GeneratorBuffer();

        // Act
        generator.generate(command, buffer, generators: generators);

        // Assert
        final output = buffer.toString();
        expect(output, contains('final double originX = targetBounds.left + targetBounds.width * 0.2;'));
        expect(output, contains('final double originY = targetBounds.top + targetBounds.height * 0.1;'));
        expect(output, contains('final double s = scaleX > scaleY ? scaleX : scaleY;'));
        expect(output, contains('canvas.translate(-5.0, -10.0);'));
        expect(output, contains('final Matrix4 matrix = Matrix4.fromList(const <double>['));
      },
    );

    test(
      'should emit non-uniform scale when preserveAspectRatio is none and userSpaceOnUse uses percentages',
      () {
        // Arrange
        const generator = PatternGenerator();
        final generators = <Type, CommandGenerator<PaintCommand>>{};
        const command = DefinePattern(
          id: 'nonePat',
          x: SvgLength(0.0),
          y: SvgLength(0.0),
          width: SvgPercentage(50.0),
          height: SvgPercentage(25.0),
          patternUnits: .userSpaceOnUse,
          viewBox: SvgViewBox(0.0, 0.0, 10.0, 20.0),
          preserveAspectRatio: SvgPreserveAspectRatio(alignment: .none),
          commands: <PaintCommand>[],
        );
        final buffer = GeneratorBuffer();

        // Act
        generator.generate(command, buffer, generators: generators);

        // Assert
        final output = buffer.toString();
        expect(output, contains('final double tileWidth = 50.0;'));
        expect(output, contains('final double tileHeight = 25.0;'));
        expect(output, contains('canvas.scale(tileWidth / 10.0, tileHeight / 20.0);'));
      },
    );

    test('should scale content by targetBounds when viewBox is null and patternContentUnits is objectBoundingBox', () {
      // Arrange
      const generator = PatternGenerator();
      final generators = <Type, CommandGenerator<PaintCommand>>{};
      const command = DefinePattern(
        id: 'noVbObox',
        x: SvgLength(0.0),
        y: SvgLength(0.0),
        width: SvgLength(0.5),
        height: SvgLength(0.5),
        patternContentUnits: .objectBoundingBox,
        commands: <PaintCommand>[],
      );
      final buffer = GeneratorBuffer();

      // Act
      generator.generate(command, buffer, generators: generators);

      // Assert
      final output = buffer.toString();
      expect(output, contains('canvas.scale(targetBounds.width, targetBounds.height);'));
    });
  });
}
