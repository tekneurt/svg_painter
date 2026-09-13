import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/svg_conversion/converters/svg_painting_context.dart';
import 'package:svg_painter/src/svg_conversion/converters/use_to_painting.dart';
import 'package:svg_painter/src/svg_model/_svg_model.dart';
import 'package:test/test.dart';

void main() {
  group('SvgUseToPaintCommands', () {
    test('should resolve target definition correctly', () {
      // Arrange
      const circle = SvgCircle(
        cx: SvgLength(0),
        cy: SvgLength(0),
        r: SvgLength(10),
        coreAttributes: SvgCoreAttributes(id: 'c1'),
      );
      const context = SvgPaintingContext(
        viewBoxWidth: 100,
        viewBoxHeight: 100,
        definitions: <String, SvgElement>{'c1': circle},
      );
      const use = SvgUse(
        href: '#c1',
        x: SvgLength(0),
        y: SvgLength(0),
      );

      // Act
      final Result<List<PaintCommand>> result = use.toPaintCommandsUse(context);

      // Assert
      expect(result.fold((f) => false, (s) => true), isTrue);
      expect(result.fold((f) => <PaintCommand>[], (s) => s).length, equals(1));
    });

    test('should return Failure when target definition is missing', () {
      // Arrange
      const context = SvgPaintingContext(viewBoxWidth: 100, viewBoxHeight: 100);
      const use = SvgUse(
        href: '#missing',
        x: SvgLength(0),
        y: SvgLength(0),
      );

      // Act
      final Result<List<PaintCommand>> result = use.toPaintCommandsUse(context);

      // Assert
      expect(result.fold((f) => true, (s) => false), isTrue);
      expect(
        result.fold((f) => f.message, (s) => ''),
        contains('Could not find definition'),
      );
    });
  });
}
