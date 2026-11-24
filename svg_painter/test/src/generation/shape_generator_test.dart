import 'package:svg_painter/src/generation/command_generator.dart';
import 'package:svg_painter/src/generation/generator_buffer.dart';
import 'package:svg_painter/src/generation/models.dart';
import 'package:svg_painter/src/generation/palette_analyzer.dart';
import 'package:svg_painter/src/generation/shape_generator.dart';
import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/painting_model/styles/painting_style.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:svg_painter_annotation/svg_painter_annotation.dart';
import 'package:test/test.dart';

class _TestShapeGenerator extends ShapeGenerator<DrawCircle> {
  const _TestShapeGenerator();

  @override
  void generate(
    DrawCircle command,
    GeneratorBuffer buffer, {
    Map<Type, CommandGenerator<PaintCommand>>? generators,
    PaletteResult? palette,
    Map<String, String>? activeFillProperties,
    Map<String, String>? activeStrokeProperties,
    List<InheritedProperty>? inheritedFills,
    List<InheritedProperty>? inheritedStrokes,
    String? painterClassName,
    Set<String>? gradientsNeedingStretch,
    SvgColorMapping colorMapping = SvgColorMapping.material,
    bool isInsideMarker = false,
  }) {}
}

void main() {
  group('ShapeGenerator', () {
    const generator = _TestShapeGenerator();

    test(
      'should emit fillPaint, strokePaint, dashArray, and marker callback when hasMarkers is true',
      () {
        // Arrange
        const command = DrawCircle(
          cx: 10.0,
          cy: 20.0,
          radius: 30.0,
          style: PaintingStyle(
            fill: PaintingFillStyle(colorArgb: 0xFF112233),
            stroke: PaintingStrokeStyle(
              colorArgb: 0xFF445566,
              width: 2.5,
              dashArray: <double>[4.0, 2.0],
              pathLength: 100.0,
              dashOffset: 1.5,
            ),
            markerStartId: 'arrowStart',
            paintOrder: SvgPaintOrder(<SvgPaintOrderComponent>[.stroke, .fill, .markers]),
          ),
        );
        final buffer = GeneratorBuffer();
        String? capturedFillVar;
        String? capturedStrokeVar;

        // Act
        generator.generatePaintingCode(
          buffer,
          command,
          command.style,
          'boundsRect',
          (
            String paintVar, {
            String? dashArray,
            String? pathLength,
            String? dashOffset,
          }) {
            buffer.writeln(
              'draw($paintVar, dash=$dashArray, len=$pathLength, off=$dashOffset);',
            );
          },
          drawMarkersCall: (String? fillPaintVar, String? strokePaintVar) {
            capturedFillVar = fillPaintVar;
            capturedStrokeVar = strokePaintVar;
            buffer.writeln('markers($fillPaintVar, $strokePaintVar);');
          },
        );

        // Assert
        final output = buffer.toString();
        expect(output, contains('final Paint fillPaint = Paint();'));
        expect(output, contains('final Paint strokePaint = Paint();'));
        expect(output, contains('final List<double> dashArray = [4.0, 2.0];'));
        expect(output, contains('draw(fillPaint, dash=null, len=null, off=null);'));
        expect(output, contains('draw(strokePaint, dash=dashArray, len=100.0, off=1.5);'));
        expect(output, contains('markers(fillPaint, strokePaint);'));
        expect(capturedFillVar, 'fillPaint');
        expect(capturedStrokeVar, 'strokePaint');
      },
    );

    test('should emit non-dashed stroke call when hasMarkers is true and dashArray is null', () {
      // Arrange
      const command = DrawCircle(
        cx: 10.0,
        cy: 20.0,
        radius: 30.0,
        style: PaintingStyle(
          stroke: PaintingStrokeStyle(colorArgb: 0xFF445566, width: 2.0),
          markerEndId: 'arrowEnd',
        ),
      );
      final buffer = GeneratorBuffer();

      // Act
      generator.generatePaintingCode(
        buffer,
        command,
        command.style,
        'boundsRect',
        (String paintVar, {String? dashArray, String? pathLength, String? dashOffset}) {},
        drawStrokeCall:
            (String paintVar, {String? dashArray, String? pathLength, String? dashOffset}) {
              buffer.writeln('stroke($paintVar);');
            },
        drawMarkersCall: (String? fillPaintVar, String? strokePaintVar) {
          buffer.writeln('markers($fillPaintVar, $strokePaintVar);');
        },
      );

      // Assert
      final output = buffer.toString();
      expect(output, contains('stroke(strokePaint);'));
      expect(output, contains('markers(null, strokePaint);'));
    });

    test('should emit contextFill and contextStroke colors inside and outside markers', () {
      // Arrange
      const command = DrawCircle(
        cx: 10.0,
        cy: 20.0,
        radius: 30.0,
        style: PaintingStyle(
          fill: PaintingFillStyle(isContextFill: true, opacity: 0.5),
          stroke: PaintingStrokeStyle(isContextStroke: true, opacity: 0.25),
        ),
      );
      final insideBuffer = GeneratorBuffer();
      final outsideBuffer = GeneratorBuffer();

      // Act
      generator.generatePaintingCode(
        insideBuffer,
        command,
        command.style,
        'boundsRect',
        (String paintVar, {String? dashArray, String? pathLength, String? dashOffset}) {},
        isInsideMarker: true,
      );
      generator.generatePaintingCode(
        outsideBuffer,
        command,
        command.style,
        'boundsRect',
        (String paintVar, {String? dashArray, String? pathLength, String? dashOffset}) {},
      );

      // Assert
      final inside = insideBuffer.toString();
      expect(inside, contains('if (contextFill != null) {'));
      expect(inside, contains('paint.color = contextFill.color;'));
      expect(inside, contains('paint.shader = contextFill.shader;'));
      expect(inside, contains('paint.color = paint.color.withValues(alpha: paint.color.a * 0.5);'));
      expect(inside, contains('if (contextStroke != null) {'));
      expect(inside, contains('paint.color = contextStroke.color;'));
      expect(inside, contains('paint.shader = contextStroke.shader;'));
      expect(
        inside,
        contains('paint.color = paint.color.withValues(alpha: paint.color.a * 0.25);'),
      );
      expect(inside, contains('paint.color = const Color(0x00000000);'));

      final outside = outsideBuffer.toString();
      expect(outside, isNot(contains('contextFill != null')));
      expect(outside, contains('paint.color = const Color(0x00000000);'));
    });

    test('should emit pattern shader with opacity and token color with opacity', () {
      // Arrange
      const command = DrawCircle(
        cx: 15.0,
        cy: 25.0,
        radius: 10.0,
        style: PaintingStyle(
          fill: PaintingFillStyle(patternId: 'pat-1', opacity: 0.6),
          stroke: PaintingStrokeStyle(colorArgb: 0xFF123456, opacity: 0.4),
        ),
      );
      const palette = PaletteResult(
        <PaintCommand, String>{},
        <PaintCommand, String>{},
        colorTokens: <int, String>{0xFF123456: 'primaryColor'},
      );
      final buffer = GeneratorBuffer();

      // Act
      generator.generatePaintingCode(
        buffer,
        command,
        command.style,
        'boundsRect',
        (String paintVar, {String? dashArray, String? pathLength, String? dashOffset}) {},
        palette: palette,
      );

      // Assert
      final output = buffer.toString();
      expect(output, contains('paint.shader = _createPattern_pat_1(boundsRect);'));
      expect(output, contains('paint.color = paint.color.withValues(alpha: 0.6);'));
      expect(output, contains('paint.color = localPrimaryColor.withValues(alpha: 0.4);'));
    });

    test('should emit inverted CTM transform when vectorEffect is nonScalingStroke', () {
      // Arrange
      const style = PaintingStyle(vectorEffect: .nonScalingStroke);
      final buffer = GeneratorBuffer();

      // Act
      generator.emitDrawStrokePath(buffer, 'myPath', 'myPaint', style: style);

      // Assert
      final output = buffer.toString();
      expect(output, contains('final Matrix4 ctm = Matrix4.fromFloat64List(canvas.getTransform());'));
      expect(output, contains('final Path nonScalingPath = myPath.transform(ctm.storage);'));
      expect(output, contains('canvas.save();'));
      expect(output, contains('canvas.transform(Matrix4.inverted(ctm).storage);'));
      expect(output, contains('canvas.drawPath(nonScalingPath, myPaint);'));
      expect(output, contains('canvas.restore();'));
    });
  });
}
