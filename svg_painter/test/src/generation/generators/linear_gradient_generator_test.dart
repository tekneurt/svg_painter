import 'package:svg_painter/src/generation/_generation.dart';
import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/painting_model/styles/painting_style.dart';
import 'package:svg_painter/src/svg_model/_svg_model.dart';
import 'package:test/test.dart';

void main() {
  group('LinearGradientGenerator', () {
    test('should generate LinearGradient properly', () {
      const cmd = DefineLinearGradient(
        id: 'grad1',
        x1: 0,
        y1: 0,
        x2: 1,
        y2: 0,
        stops: <GradientStop>[
          GradientStop(offset: 0, colorArgb: 4294901760),
          GradientStop(offset: 1, colorArgb: 4278190335),
        ],
      );

      final buffer = GeneratorBuffer();
      const LinearGradientGenerator().generate(cmd, buffer, painterClassName: 'TestPainter');
      final result = buffer.toString();

      expect(result, contains('LinearGradient('));
      expect(result, contains('begin: Alignment(-1.0, -1.0)'));
      expect(result, contains('end: Alignment(1.0, -1.0)'));
      expect(result, contains('colors: <Color>['));
      expect(result, contains('const Color(0xFFFF0000),'));
      expect(result, contains('const Color(0xFF0000FF),'));
      expect(result, contains('stops: <double>['));
      expect(result, contains('0.0,'));
      expect(result, contains('1.0,'));
    });

    test('should handle spread methods and transform', () {
      final buffer = GeneratorBuffer();
      const command = DefineLinearGradient(
        id: 'g',
        x1: 0, y1: 0, x2: 1, y2: 0,
        stops: [],
        spreadMethod: PaintingSpreadMethod.reflect,
        transformAttributes: SvgTransformAttributes([SvgTranslate(10, 10)]),
      );
      
      const LinearGradientGenerator().generate(command, buffer, painterClassName: 'MyPainter');
      final result = buffer.toString();
      
      expect(result, contains('tileMode: TileMode.mirror'));
      expect(result, contains('transform: _SvgGradientTransform_MyPainter'));
    });
  });
}
