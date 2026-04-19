import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/svg_conversion/converters/svg_painting_context.dart';
import 'package:svg_painter/src/svg_conversion/converters/svg_root_to_painting.dart';
import 'package:svg_painter/src/svg_model/_svg_model.dart';
import 'package:test/test.dart';

void main() {
  group('SvgRootToPaintCommands', () {
    test('should resolve viewBox and children correctly', () {
      // Arrange
      const context = SvgPaintingContext(viewBoxWidth: 100, viewBoxHeight: 100);
      const svg = SvgSvg(
        viewportAttributes: SvgViewportAttributes(
          viewBox: SvgViewBox(0, 0, 200, 200),
        ),
        children: <SvgElement>[
          SvgCircle(cx: SvgLength(50), cy: SvgLength(50), r: SvgLength(10)),
        ],
      );

      // Act
      final Result<List<PaintCommand>> result = svg.toPaintCommandsSvg(context);

      // Assert
      expect(result.fold((Failure<List<PaintCommand>> f) => false, (List<PaintCommand> s) => true), isTrue);
      expect(result.fold((Failure<List<PaintCommand>> f) => <PaintCommand>[], (List<PaintCommand> s) => s).length, equals(1));
    });
  });
}
