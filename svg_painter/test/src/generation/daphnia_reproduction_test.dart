import 'package:svg_painter/src/generation/palette_analyzer.dart';
import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/painting_model/styles/painting_style.dart';
import 'package:svg_painter_annotation/svg_painter_annotation.dart';
import 'package:test/test.dart';

void main() {
  test('PaletteAnalyzer should identify multiple unique implicit colors', () {
    const PaletteAnalyzer analyzer = PaletteAnalyzer();

    // Simulating 3 unique colors from Daphnia, but as IMPLICIT (isExplicit: false)
    final List<PaintCommand> commands = <PaintCommand>[
      const DrawCircle(
        cx: 0,
        cy: 0,
        radius: 1,
        style: PaintingStyle(
          fill: PaintingFillStyle(colorArgb: 0xFFFFFFFF, isExplicit: false),
        ), // #fff
      ),
      const DrawCircle(
        cx: 0,
        cy: 0,
        radius: 1,
        style: PaintingStyle(
          fill: PaintingFillStyle(colorArgb: 0xFF2B2727, isExplicit: false),
        ), // #2b2727
      ),
      const DrawCircle(
        cx: 0,
        cy: 0,
        radius: 1,
        style: PaintingStyle(
          fill: PaintingFillStyle(colorArgb: 0xEF7B51FF, isExplicit: false),
        ), // #ef7b51
      ),
    ];

    final PaletteResult result = analyzer.analyze(commands, mode: SvgExposureMode.indexed);

    expect(
      result.fillAssignments.values.toSet().length,
      equals(3),
      reason: 'Should have found 3 unique defaultFill properties',
    );
    expect(result.fillAssignments.values.first, startsWith('defaultFill'));
  });
}
