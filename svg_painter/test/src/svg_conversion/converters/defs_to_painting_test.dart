import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/svg_conversion/converters/defs_to_painting.dart';
import 'package:svg_painter/src/svg_conversion/converters/svg_painting_context.dart';
import 'package:svg_painter/src/svg_model/_svg_model.dart';
import 'package:test/test.dart';

void main() {
  group('SvgDefsToPaintCommands', () {
    test('should only return gradient definitions from children', () {
      // Arrange
      const context = SvgPaintingContext(viewBoxWidth: 100, viewBoxHeight: 100);
      const defs = SvgDefs(
        children: <SvgElement>[
          SvgLinearGradient(
            coreAttributes: SvgCoreAttributes(id: 'grad1'),
            stops: <SvgStop>[],
            x1: SvgLength(0),
            y1: SvgLength(0),
            x2: SvgLength(1),
            y2: SvgLength(0),
          ),
          SvgCircle(cx: SvgLength(0), cy: SvgLength(0), r: SvgLength(10)),
        ],
      );

      // Act
      final Result<List<PaintCommand>> result = defs.toPaintCommandsDefs(context);

      // Assert
      expect(
        result.fold((Failure<List<PaintCommand>> f) => false, (List<PaintCommand> s) => true),
        isTrue,
      );
      expect(
        result
            .fold((Failure<List<PaintCommand>> f) => <PaintCommand>[], (List<PaintCommand> s) => s)
            .length,
        equals(1),
      );
    });
  });
}
