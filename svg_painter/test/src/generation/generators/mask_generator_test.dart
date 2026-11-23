import 'package:svg_painter/src/generation/command_generator.dart';
import 'package:svg_painter/src/generation/generator_buffer.dart';
import 'package:svg_painter/src/generation/generators/circle_generator.dart';
import 'package:svg_painter/src/generation/generators/mask_generator.dart';
import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/painting_model/styles/painting_style.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('MaskGenerator', () {
    const generator = MaskGenerator();

    final generators = <Type, CommandGenerator<PaintCommand>>{
      DrawCircle: const CircleGenerator(),
    };

    test('should return early when generators map is null', () {
      // Arrange
      const command = DefineMask(
        id: 'mask-1',
        x: SvgLength(10.0),
        y: SvgLength(20.0),
        width: SvgLength(100.0),
        height: SvgLength(200.0),
        commands: <PaintCommand>[
          DrawCircle(cx: 50.0, cy: 60.0, radius: 15.0, style: PaintingStyle()),
        ],
      );
      final buffer = GeneratorBuffer();

      // Act
      generator.generate(command, buffer);

      // Assert
      expect(buffer.toString(), isEmpty);
    });

    test(
      'should emit objectBoundingBox region and scaled content when both units are objectBoundingBox',
      () {
        // Arrange
        const command = DefineMask(
          id: 'my-mask.1',
          x: SvgPercentage(10.0),
          y: SvgPercentage(20.0),
          width: SvgPercentage(80.0),
          height: SvgPercentage(60.0),
          maskContentUnits: .objectBoundingBox,
          commands: <PaintCommand>[
            DrawCircle(
              cx: 0.5,
              cy: 0.4,
              radius: 0.25,
              style: PaintingStyle(fill: PaintingFillStyle(colorArgb: 0xFFFFFFFF)),
            ),
          ],
        );
        final buffer = GeneratorBuffer();

        // Act
        generator.generate(command, buffer, generators: generators);

        // Assert
        final output = buffer.toString();
        expect(output, contains('void _mask_my_mask_1(Canvas canvas, Size size, Rect targetBounds) {'));
        expect(
          output,
          contains(
            'canvas.clipRect(Rect.fromLTWH('
            'targetBounds.left + (0.1 * targetBounds.width), '
            'targetBounds.top + (0.2 * targetBounds.height), '
            '(0.8 * targetBounds.width), '
            '(0.6 * targetBounds.height)));',
          ),
        );
        expect(output, contains('canvas.save();'));
        expect(output, contains('canvas.translate(targetBounds.left, targetBounds.top);'));
        expect(output, contains('canvas.scale(targetBounds.width, targetBounds.height);'));
        expect(output, contains('canvas.drawCircle(const Offset(0.5, 0.4), 0.25, paint);'));
        expect(output, contains('canvas.restore();'));
      },
    );

    test(
      'should resolve percentages against viewBox and skip content scaling when userSpaceOnUse',
      () {
        // Arrange
        const command = DefineMask(
          id: 'userMask',
          x: SvgPercentage(15.0),
          y: SvgPercentage(25.0),
          width: SvgLength(120.0),
          height: SvgPercentage(50.0),
          maskUnits: .userSpaceOnUse,
          commands: <PaintCommand>[
            DrawCircle(
              cx: 30.0,
              cy: 40.0,
              radius: 10.0,
              style: PaintingStyle(fill: PaintingFillStyle(colorArgb: 0xFF112233)),
            ),
          ],
        );
        final buffer = GeneratorBuffer();

        // Act
        generator.generate(command, buffer, generators: generators);

        // Assert
        final output = buffer.toString();
        expect(output, contains('void _mask_userMask(Canvas canvas, Size size, Rect targetBounds) {'));
        expect(
          output,
          contains(
            'canvas.clipRect(Rect.fromLTWH('
            '(0.15 * viewBox.width), '
            '(0.25 * viewBox.height), '
            '120.0, '
            '(0.5 * viewBox.height)));',
          ),
        );
        expect(output, isNot(contains('canvas.scale(targetBounds.width, targetBounds.height);')));
        expect(output, contains('canvas.drawCircle(const Offset(30.0, 40.0), 10.0, paint);'));
      },
    );
  });
}
