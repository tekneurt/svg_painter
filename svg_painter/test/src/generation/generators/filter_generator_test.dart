import 'package:svg_painter/src/generation/generator_buffer.dart';
import 'package:svg_painter/src/generation/generators/filter_generator.dart';
import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('FilterGenerator', () {
    test('should generate blur layer when feGaussianBlur primitive is provided', () {
      // Arrange
      const generator = FilterGenerator();
      const command = DefineFilter(
        id: 'blur1',
        primitives: <SvgFilterPrimitive>[
          SvgFeGaussianBlur(stdDeviationX: 3.5, stdDeviationY: 7.5),
        ],
      );
      final buffer = GeneratorBuffer();

      // Act
      generator.generate(command, buffer);

      // Assert
      final output = buffer.toString();
      expect(output, contains('void _filter_blur1(Canvas canvas, void Function() drawGraphic) {'));
      expect(output, contains('canvas.saveLayer(null, Paint()..imageFilter = ui.ImageFilter.blur(sigmaX: 3.5, sigmaY: 7.5));'));
      expect(output, contains('drawGraphic();'));
      expect(output, contains('canvas.restore();'));
    });

    test('should generate offset translation when feOffset primitive is provided', () {
      // Arrange
      const generator = FilterGenerator();
      const command = DefineFilter(
        id: 'offset1',
        primitives: <SvgFilterPrimitive>[
          SvgFeOffset(dx: 25.0, dy: 35.0),
        ],
      );
      final buffer = GeneratorBuffer();

      // Act
      generator.generate(command, buffer);

      // Assert
      final output = buffer.toString();
      expect(output, contains('void _filter_offset1(Canvas canvas, void Function() drawGraphic) {'));
      expect(output, contains('canvas.save();'));
      expect(output, contains('canvas.translate(25.0, 35.0);'));
      expect(output, contains('drawGraphic();'));
      expect(output, contains('canvas.restore();'));
    });

    test('should generate drop shadow pipeline when feMerge combines shadow and SourceGraphic', () {
      // Arrange
      const generator = FilterGenerator();
      const command = DefineFilter(
        id: 'dropShadow1',
        primitives: <SvgFilterPrimitive>[
          SvgFeGaussianBlur(inSource: 'SourceAlpha', stdDeviationX: 4.0, stdDeviationY: 4.0),
          SvgFeOffset(dx: 3.0, dy: 5.0),
          SvgFeMerge(
            nodes: <SvgFeMergeNode>[
              SvgFeMergeNode(),
              SvgFeMergeNode(inSource: 'SourceGraphic'),
            ],
          ),
        ],
      );
      final buffer = GeneratorBuffer();

      // Act
      generator.generate(command, buffer);

      // Assert
      final output = buffer.toString();
      expect(output, contains('void _filter_dropShadow1(Canvas canvas, void Function() drawGraphic) {'));
      expect(output, contains('canvas.save();'));
      expect(output, contains('canvas.translate(3.0, 5.0);'));
      expect(
        output,
        contains(
          'canvas.saveLayer(null, Paint()..imageFilter = ui.ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0)..colorFilter = const ColorFilter.mode(Color(0xFF000000), BlendMode.srcIn));',
        ),
      );
      expect(output, contains('drawGraphic();'));
      expect(output, contains('canvas.restore();'));
    });

    test('should invoke drawGraphic directly when filter has no primitives', () {
      // Arrange
      const generator = FilterGenerator();
      const command = DefineFilter(
        id: 'emptyFilter',
        primitives: <SvgFilterPrimitive>[],
      );
      final buffer = GeneratorBuffer();

      // Act
      generator.generate(command, buffer);

      // Assert
      final output = buffer.toString();
      expect(output, contains('void _filter_emptyFilter(Canvas canvas, void Function() drawGraphic) {'));
      expect(output, contains('drawGraphic();'));
    });

    test('should generate color filter matrix layer when feComponentTransfer primitive is provided', () {
      // Arrange
      const generator = FilterGenerator();
      const command = DefineFilter(
        id: 'componentTransfer1',
        primitives: <SvgFilterPrimitive>[
          SvgFeComponentTransfer(
            funcR: SvgFeFuncR(type: SvgComponentTransferType.linear, slope: 2.0, intercept: 0.1),
            funcG: SvgFeFuncG(type: SvgComponentTransferType.gamma, amplitude: 3.0, offset: 0.2),
            funcB: SvgFeFuncB(),
            funcA: SvgFeFuncA(type: SvgComponentTransferType.table, tableValues: <double>[0.0, 1.0]),
          ),
        ],
      );
      final buffer = GeneratorBuffer();

      // Act
      generator.generate(command, buffer);

      // Assert
      final output = buffer.toString();
      expect(output, contains('void _filter_componentTransfer1(Canvas canvas, void Function() drawGraphic) {'));
      expect(
        output,
        contains(
          'canvas.saveLayer(null, Paint()..colorFilter = const ColorFilter.matrix(<double>[2.0, 0.0, 0.0, 0.0, 25.5, 0.0, 3.0, 0.0, 0.0, 51.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0]));',
        ),
      );
      expect(output, contains('drawGraphic();'));
      expect(output, contains('canvas.restore();'));
    });
  });
}
