import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/svg_conversion/converters/defs_to_painting.dart';
import 'package:svg_painter/src/svg_conversion/converters/svg_painting_context.dart';
import 'package:svg_painter/src/svg_model/_svg_model.dart';
import 'package:test/test.dart';

void main() {
  group('SvgDefsToPaintCommands', () {
    test('should only return definition commands from children', () {
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
          SvgClipPath(
            coreAttributes: SvgCoreAttributes(id: 'clip1'),
            children: <SvgElement>[
              SvgCircle(cx: SvgLength(5), cy: SvgLength(5), r: SvgLength(5)),
            ],
          ),
          SvgCircle(cx: SvgLength(10), cy: SvgLength(20), r: SvgLength(30)),
        ],
      );

      // Act
      final Result<List<PaintCommand>> result = defs.toPaintCommandsDefs(context);

      // Assert
      expect(
        result.fold((Failure<List<PaintCommand>> f) => false, (List<PaintCommand> s) => true),
        isTrue,
      );
      final List<PaintCommand> commands = result.fold(
        (Failure<List<PaintCommand>> f) => <PaintCommand>[],
        (List<PaintCommand> s) => s,
      );
      expect(commands.length, equals(2));
      expect(commands[0], isA<DefineLinearGradient>());
      expect(commands[1], isA<DefineClipPath>());
    });
  });
}
