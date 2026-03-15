import 'package:svg_painter/src/generation/palette_analyzer.dart';
import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/painting_model/styles/painting_style.dart';
import 'package:svg_painter_annotation/svg_painter_annotation.dart';
import 'package:test/test.dart';

void main() {
  group('PaletteAnalyzer', () {
    const PaletteAnalyzer analyzer = PaletteAnalyzer();

    test('should identify unique strokes based on pathLength', () {
      final List<PaintCommand> commands = <PaintCommand>[
        const DrawLine(
          x1: 0, y1: 0, x2: 10, y2: 10,
          style: PaintingStyle(
            stroke: PaintingStrokeStyle(colorArgb: 0xFF000000, pathLength: 100.0),
          ),
        ),
        const DrawLine(
          x1: 0, y1: 0, x2: 10, y2: 10,
          style: PaintingStyle(
            stroke: PaintingStrokeStyle(colorArgb: 0xFF000000, pathLength: 200.0),
          ),
        ),
      ];

      final PaletteResult result = analyzer.analyze(commands, mode: SvgExposureMode.indexed);

      // Should have 2 unique stroke properties because pathLength differs
      expect(result.strokeAssignments.values.toSet().length, equals(2));
      expect(result.strokeAssignments[commands[0]], equals('stroke1'));
      expect(result.strokeAssignments[commands[1]], equals('stroke2'));
    });

    test('should identify unique strokes based on dashArray', () {
      final List<PaintCommand> commands = <PaintCommand>[
        const DrawLine(
          x1: 0, y1: 0, x2: 10, y2: 10,
          style: PaintingStyle(
            stroke: PaintingStrokeStyle(colorArgb: 0xFF000000, dashArray: <double>[5.0, 5.0]),
          ),
        ),
        const DrawLine(
          x1: 0, y1: 0, x2: 10, y2: 10,
          style: PaintingStyle(
            stroke: PaintingStrokeStyle(colorArgb: 0xFF000000, dashArray: <double>[10.0, 10.0]),
          ),
        ),
      ];

      final PaletteResult result = analyzer.analyze(commands, mode: SvgExposureMode.indexed);

      expect(result.strokeAssignments.values.toSet().length, equals(2));
    });

    test('should group identical implicit strokes under defaultStroke', () {
      final List<PaintCommand> commands = <PaintCommand>[
        const DrawLine(
          x1: 0, y1: 0, x2: 10, y2: 10,
          style: PaintingStyle(
            stroke: PaintingStrokeStyle(colorArgb: 0xFF000000, isExplicit: false),
          ),
        ),
        const DrawLine(
          x1: 10, y1: 10, x2: 20, y2: 20,
          style: PaintingStyle(
            stroke: PaintingStrokeStyle(colorArgb: 0xFF000000, isExplicit: false),
          ),
        ),
      ];

      final PaletteResult result = analyzer.analyze(commands, mode: SvgExposureMode.indexed);

      expect(result.strokeAssignments[commands[0]], equals('defaultStroke'));
      expect(result.strokeAssignments[commands[1]], equals('defaultStroke'));
    });

    test('should identify unique strokes based on dashArray values', () {
      final List<PaintCommand> commands = <PaintCommand>[
        const DrawLine(
          x1: 0, y1: 0, x2: 10, y2: 10,
          style: PaintingStyle(
            stroke: PaintingStrokeStyle(colorArgb: 0xFF000000, dashArray: <double>[5.0, 5.0]),
          ),
        ),
        const DrawLine(
          x1: 0, y1: 0, x2: 10, y2: 10,
          style: PaintingStyle(
            stroke: PaintingStrokeStyle(colorArgb: 0xFF000000, dashArray: <double>[5.0, 10.0]),
          ),
        ),
        const DrawLine(
          x1: 0, y1: 0, x2: 10, y2: 10,
          style: PaintingStyle(
            stroke: PaintingStrokeStyle(colorArgb: 0xFF000000, dashArray: <double>[5.0, 5.0, 5.0, 5.0]),
          ),
        ),
      ];

      final PaletteResult result = analyzer.analyze(commands, mode: SvgExposureMode.indexed);
      expect(result.strokeAssignments.values.toSet().length, equals(3));
    });
  });
}
