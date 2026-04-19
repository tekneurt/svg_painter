import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/svg_conversion/converters/svg_painting_context.dart';
import 'package:svg_painter/src/svg_conversion/converters/symbol_to_painting.dart';
import 'package:svg_painter/src/svg_model/_svg_model.dart';
import 'package:test/test.dart';

void main() {
  group('SvgSymbolToPaintCommands', () {
    test('should resolve symbol viewport correctly', () {
      // Arrange
      const context = SvgPaintingContext(viewBoxWidth: 100, viewBoxHeight: 100);
      const symbol = SvgSymbol(
        viewportAttributes: SvgViewportAttributes(
          viewBox: SvgViewBox(0, 0, 50, 50),
        ),
        children: <SvgElement>[
          SvgCircle(cx: SvgLength(25), cy: SvgLength(25), r: SvgLength(10)),
        ],
      );

      // Act
      final Result<List<PaintCommand>> result = symbol.toPaintCommandsSymbol(
        context,
        width: const SvgLength(50),
        height: const SvgLength(50),
      );

      // Assert
      expect(result.fold((Failure<List<PaintCommand>> f) => false, (List<PaintCommand> s) => true), isTrue);
      expect(result.fold((Failure<List<PaintCommand>> f) => <PaintCommand>[], (List<PaintCommand> s) => s).length, equals(1));
    });
  });
}
