import 'package:svg_painter/src/generation/_generation.dart';
import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:test/test.dart';

void main() {
  group('RadialGradientGenerator', () {
    test('should generate RadialGradient properly', () {
      const DefineRadialGradient cmd = DefineRadialGradient(
        id: 'grad1',
        cx: 0.5,
        cy: 0.5,
        radius: 0.5,
        fx: 0.5,
        fy: 0.5,
        focalRadius: 0,
        stops: <GradientStop>[
          GradientStop(offset: 0, colorArgb: 4294901760),
          GradientStop(offset: 1, colorArgb: 4278190335),
        ],
      );

      final GeneratorBuffer buffer = GeneratorBuffer();
      const RadialGradientGenerator().generate(cmd, buffer);
      final String result = buffer.toString();

      expect(result, contains('RadialGradient('));
      expect(result, contains('center: Alignment(0.0, 0.0)'));
      expect(result, contains('radius: 0.5'));
      expect(result, contains('colors: <Color>['));
      expect(result, contains('const Color(0xFFFF0000),'));
      expect(result, contains('const Color(0xFF0000FF),'));
      expect(result, contains('stops: <double>['));
      expect(result, contains('0.0,'));
      expect(result, contains('1.0,'));
    });

    test('should generate RadialGradient with focalRadius properly', () {
      const DefineRadialGradient cmd = DefineRadialGradient(
        id: 'grad2',
        cx: 0.5,
        cy: 0.5,
        radius: 0.5,
        fx: 0.5,
        fy: 0.5,
        focalRadius: 0.1,
        stops: <GradientStop>[
          GradientStop(offset: 0, colorArgb: 0xFFFF0000),
        ],
      );

      final GeneratorBuffer buffer = GeneratorBuffer();
      const RadialGradientGenerator().generate(cmd, buffer);
      final String result = buffer.toString();

      expect(result, contains('focalRadius: 0.1'));
    });
  });
}
