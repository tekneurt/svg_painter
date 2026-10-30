import 'package:svg_painter/src/generation/generator_buffer.dart';
import 'package:svg_painter/src/generation/generators/linear_gradient_generator.dart';
import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/painting_model/styles/painting_style.dart';
import 'package:svg_painter/src/svg_model/attribute_groups/svg_transform_attributes.dart';
import 'package:test/test.dart';

void main() {
  group('LinearGradientGenerator', () {
    test('should generate LinearGradient when valid command is provided', () {
      // Arrange
      const cmd = DefineLinearGradient(
        id: 'grad1',
        x1: 0.25,
        y1: 0.125,
        x2: 0.75,
        y2: 0.875,
        stops: <GradientStop>[
          GradientStop(offset: 0.125, colorArgb: 4294901760),
          GradientStop(offset: 0.875, colorArgb: 4278190335),
        ],
      );

      final buffer = GeneratorBuffer();

      // Act
      const LinearGradientGenerator().generate(cmd, buffer, painterClassName: 'TestPainter');
      final result = buffer.toString();

      // Assert
      expect(result, contains('LinearGradient('));
      expect(result, contains('begin: Alignment(-0.5, -0.75)'));
      expect(result, contains('end: Alignment(0.5, 0.75)'));
      expect(result, contains('colors: <Color>['));
      expect(result, contains('const Color(0xFFFF0000),'));
      expect(result, contains('const Color(0xFF0000FF),'));
      expect(result, contains('stops: <double>['));
      expect(result, contains('0.125,'));
      expect(result, contains('0.875,'));
    });

    test('should handle spread methods and transform when attributes are specified', () {
      // Arrange
      final buffer = GeneratorBuffer();
      const command = DefineLinearGradient(
        id: 'g',
        x1: 0.1,
        y1: 0.2,
        x2: 0.8,
        y2: 0.9,
        stops: <GradientStop>[],
        spreadMethod: PaintingSpreadMethod.reflect,
        transformAttributes: SvgTransformAttributes(<SvgTransformOperation>[SvgTranslate(12.0, 18.0)]),
      );

      // Act
      const LinearGradientGenerator().generate(command, buffer, painterClassName: 'MyPainter');
      final result = buffer.toString();

      // Assert
      expect(result, contains('tileMode: TileMode.mirror'));
      expect(result, contains('transform: _SvgGradientTransform_MyPainter'));
      expect(result, contains('isObjectBoundingBox: true'));
    });

    test('should generate transform matrix when complex nested transformations are provided', () {
      // Arrange
      final buffer = GeneratorBuffer();
      const command = DefineLinearGradient(
        id: 'nestedGrad',
        x1: 0.1,
        y1: 0.2,
        x2: 0.8,
        y2: 0.9,
        stops: <GradientStop>[],
        units: PaintingGradientUnits.userSpaceOnUse,
        spreadMethod: PaintingSpreadMethod.repeat,
        transformAttributes: SvgTransformAttributes(<SvgTransformOperation>[
          SvgRotate(45.0),
          SvgTranslate(15.0, 25.0),
          SvgScale(1.5, 2.5),
        ]),
      );

      // Act
      const LinearGradientGenerator().generate(command, buffer, painterClassName: 'NestedPainter');
      final result = buffer.toString();

      // Assert
      expect(result, contains('tileMode: TileMode.repeated'));
      expect(result, contains('transform: _SvgGradientTransform_NestedPainter'));
      expect(result, contains('matrix: <double>['));
      expect(result, isNot(contains('isObjectBoundingBox: true')));
    });
  });
}
