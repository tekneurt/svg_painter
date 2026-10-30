import 'package:svg_painter/src/generation/generator_buffer.dart';
import 'package:svg_painter/src/generation/generators/radial_gradient_generator.dart';
import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/svg_model/attribute_groups/svg_transform_attributes.dart';
import 'package:test/test.dart';

void main() {
  group('RadialGradientGenerator', () {
    test('should generate RadialGradient when valid command is provided', () {
      // Arrange
      const cmd = DefineRadialGradient(
        id: 'grad1',
        cx: 0.25,
        cy: 0.75,
        radius: 0.5,
        fx: 0.125,
        fy: 0.625,
        focalRadius: 0.0,
        stops: <GradientStop>[
          GradientStop(offset: 0.125, colorArgb: 4294901760),
          GradientStop(offset: 0.875, colorArgb: 4278190335),
        ],
      );

      final buffer = GeneratorBuffer();

      // Act
      const RadialGradientGenerator().generate(cmd, buffer, painterClassName: 'TestPainter');
      final result = buffer.toString();

      // Assert
      expect(result, contains('RadialGradient('));
      expect(result, contains('center: Alignment(-0.5, 0.5)'));
      expect(result, contains('radius: 0.5'));
      expect(result, contains('focal: Alignment(-0.75, 0.25)'));
      expect(result, contains('colors: <Color>['));
      expect(result, contains('const Color(0xFFFF0000),'));
      expect(result, contains('const Color(0xFF0000FF),'));
      expect(result, contains('stops: <double>['));
      expect(result, contains('0.125,'));
      expect(result, contains('0.875,'));
    });

    test('should generate RadialGradient with focalRadius when focalRadius is non-zero', () {
      // Arrange
      const cmd = DefineRadialGradient(
        id: 'grad2',
        cx: 0.4,
        cy: 0.7,
        radius: 0.35,
        fx: 0.3,
        fy: 0.65,
        focalRadius: 0.15,
        stops: <GradientStop>[GradientStop(offset: 0.2, colorArgb: 0xFFFF0000)],
      );

      final buffer = GeneratorBuffer();

      // Act
      const RadialGradientGenerator().generate(cmd, buffer, painterClassName: 'TestPainter');
      final result = buffer.toString();

      // Assert
      expect(result, contains('focalRadius: 0.15'));
    });

    test('should handle elliptical gradients when gradient needs stretch', () {
      // Arrange
      const cmd = DefineRadialGradient(
        id: 'g',
        cx: 0.35,
        cy: 0.65,
        radius: 0.45,
        fx: 0.35,
        fy: 0.65,
        focalRadius: 0.0,
        stops: <GradientStop>[],
      );
      final buffer = GeneratorBuffer();

      // Act
      const RadialGradientGenerator().generate(
        cmd,
        buffer,
        painterClassName: 'StretchPainter',
        gradientsNeedingStretch: <String>{'g'},
      );
      final result = buffer.toString();

      // Assert
      expect(result, contains('isElliptical: true, centerX: 0.35, centerY: 0.65'));
    });

    test('should generate transform matrix when transformAttributes is provided', () {
      // Arrange
      const cmd = DefineRadialGradient(
        id: 'transGrad',
        cx: 0.3,
        cy: 0.6,
        radius: 0.4,
        fx: 0.3,
        fy: 0.6,
        focalRadius: 0.0,
        stops: <GradientStop>[],
        transformAttributes: SvgTransformAttributes(<SvgTransformOperation>[
          SvgTranslate(14.0, 28.0),
        ]),
      );
      final buffer = GeneratorBuffer();

      // Act
      const RadialGradientGenerator().generate(cmd, buffer, painterClassName: 'TransPainter');
      final result = buffer.toString();

      // Assert
      expect(result, contains('transform: _SvgGradientTransform_TransPainter(matrix: <double>['));
      expect(result, contains('isObjectBoundingBox: true'));
    });

    test('should generate transform with elliptical stretch when transformAttributes and needsStretch are both specified', () {
      // Arrange
      const cmd = DefineRadialGradient(
        id: 'comboGrad',
        cx: 0.35,
        cy: 0.65,
        radius: 0.45,
        fx: 0.35,
        fy: 0.65,
        focalRadius: 0.0,
        stops: <GradientStop>[],
        transformAttributes: SvgTransformAttributes(<SvgTransformOperation>[
          SvgRotate(30.0),
          SvgTranslate(10.0, 20.0),
        ]),
      );
      final buffer = GeneratorBuffer();

      // Act
      const RadialGradientGenerator().generate(
        cmd,
        buffer,
        painterClassName: 'ComboPainter',
        gradientsNeedingStretch: <String>{'comboGrad'},
      );
      final result = buffer.toString();

      // Assert
      expect(result, contains('matrix: <double>['));
      expect(result, contains('isObjectBoundingBox: true'));
      expect(result, contains('isElliptical: true, centerX: 0.35, centerY: 0.65'));
    });
  });
}
