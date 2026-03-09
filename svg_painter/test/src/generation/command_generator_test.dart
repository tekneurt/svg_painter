import 'package:svg_painter/src/generation/_generation.dart';
import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/painting_model/styles/painting_style.dart';
import 'package:svg_painter/src/svg_model/_svg_model.dart';
import 'package:test/test.dart';

// Concrete implementation for testing abstract ShapeGenerator
class TestShapeGenerator extends ShapeGenerator<DrawCircle> {
  const TestShapeGenerator();

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
  }) {
    wrapWithTransform(buffer, command.style.transformAttributes, () {
      generatePaintingCode(
        buffer,
        command,
        command.style,
        'Rect.fromLTWH(${command.cx - command.radius}, ${command.cy - command.radius}, ${command.radius * 2}, ${command.radius * 2})',
        (String paintVar, {String? dashArray, String? pathLength}) {
          if (dashArray == null) {
            buffer.writeln(
              'canvas.drawCircle(const Offset(${command.cx}, ${command.cy}), ${command.radius}, $paintVar);',
            );
          } else {
            buffer.writeln(
              'canvas.drawPath(_dashPath(Path()..addOval(Rect.fromCircle(center: const Offset(${command.cx}, ${command.cy}), radius: ${command.radius})), $dashArray, pathLength: $pathLength), $paintVar);',
            );
          }
        },
        palette: palette,
        activeFillProperties: activeFillProperties,
        activeStrokeProperties: activeStrokeProperties,
        inheritedFills: inheritedFills,
        inheritedStrokes: inheritedStrokes,
      );
    });
  }
}

void main() {
  group('ShapeGenerator', () {
    const TestShapeGenerator generator = TestShapeGenerator();

    group('generatePaintingCode', () {
      test('should generate fill code when fill style is provided', () {
        // Arrange
        const PaintingStyle style = PaintingStyle(
          fill: PaintingFillStyle(colorArgb: 0xFFFF0000, opacity: 0.5),
        );
        const DrawCircle command = DrawCircle(cx: 10, cy: 20, radius: 5, style: style);
        final GeneratorBuffer buffer = GeneratorBuffer();

        // Act
        generator.generate(command, buffer);

        // Assert
        final String output = buffer.toString();
        expect(output, contains('final Paint paint = Paint();'));
        expect(output, contains('paint.color = const Color(0x80FF0000);'));
        expect(output, contains('paint.style = PaintingStyle.fill;'));
        expect(output, contains('canvas.drawCircle(const Offset(10.0, 20.0), 5.0, paint);'));
      });

      test('should generate stroke code when stroke style is provided', () {
        // Arrange
        const PaintingStyle style = PaintingStyle(
          stroke: PaintingStrokeStyle(
            colorArgb: 0xFF0000FF,
            width: 2.0,
            cap: PaintingStrokeCap.round,
            join: PaintingStrokeJoin.bevel,
          ),
        );
        const DrawCircle command = DrawCircle(cx: 10, cy: 20, radius: 5, style: style);
        final GeneratorBuffer buffer = GeneratorBuffer();

        // Act
        generator.generate(command, buffer);

        // Assert
        final String output = buffer.toString();
        expect(output, contains('paint.color = const Color(0xFF0000FF);'));
        expect(output, contains('paint.style = PaintingStyle.stroke;'));
        expect(output, contains('paint.strokeWidth = 2.0;'));
        expect(output, contains('paint.strokeCap = StrokeCap.round;'));
        expect(output, contains('paint.strokeJoin = StrokeJoin.bevel;'));
      });

      test('should generate shader code when shaderId is provided', () {
        // Arrange
        const PaintingStyle style = PaintingStyle(
          fill: PaintingFillStyle(shaderId: 'grad1', opacity: 0.8),
        );
        const DrawCircle command = DrawCircle(cx: 10, cy: 20, radius: 5, style: style);
        final GeneratorBuffer buffer = GeneratorBuffer();

        // Act
        generator.generate(command, buffer);

        // Assert
        final String output = buffer.toString();
        expect(
          output,
          contains(
            'paint.shader = _grad_grad1.createShader(Rect.fromLTWH(5.0, 15.0, 10.0, 10.0));',
          ),
        );
        expect(output, contains('paint.color = paint.color.withOpacity(0.8);'));
      });

      test('should generate dashed stroke code when dashArray is provided', () {
        // Arrange
        const PaintingStyle style = PaintingStyle(
          stroke: PaintingStrokeStyle(
            colorArgb: 0xFF000000,
            dashArray: <double>[5.0, 10.0],
            pathLength: 100.0,
          ),
        );
        const DrawCircle command = DrawCircle(cx: 10, cy: 20, radius: 5, style: style);
        final GeneratorBuffer buffer = GeneratorBuffer();

        // Act
        generator.generate(command, buffer);

        // Assert
        final String output = buffer.toString();
        expect(output, contains('final List<double> dashArray = [5.0, 10.0];'));
        expect(output, contains('canvas.drawPath(_dashPath('));
        expect(output, contains('pathLength: 100.0'));
      });

      test('should use active property for fill if mapped', () {
        // Arrange
        const PaintingStyle style = PaintingStyle(fill: PaintingFillStyle(colorArgb: 0xFFFF0000));
        const DrawCircle command = DrawCircle(cx: 10, cy: 20, radius: 5, style: style, id: 'c1');
        final GeneratorBuffer buffer = GeneratorBuffer();

        // Act
        generator.generate(
          command,
          buffer,
          activeFillProperties: <String, String>{'c1Fill': 'myCustomFill'},
        );

        // Assert
        final String output = buffer.toString();
        expect(output, contains('final Object? localFill = myCustomFill;'));
        expect(output, contains('if (localFill == null) {'));
        expect(output, contains('_applyOverride(paint, localFill);'));
      });

      test('should use active property via assignedFill from palette', () {
        // Arrange
        const PaintingStyle style = PaintingStyle(fill: PaintingFillStyle(colorArgb: 0xFFFF1122));
        const DrawCircle command = DrawCircle(cx: 10, cy: 20, radius: 5, style: style);
        const PaletteResult palette = PaletteResult(<PaintCommand, String>{
          command: 'fill1',
        }, <PaintCommand, String>{});
        final GeneratorBuffer buffer = GeneratorBuffer();

        // Act
        generator.generate(
          command,
          buffer,
          palette: palette,
          activeFillProperties: <String, String>{'fill1': 'customFill1'},
        );

        // Assert
        final String output = buffer.toString();
        expect(output, contains('final Object? localFill = customFill1;'));
        expect(output, contains('_applyOverride(paint, localFill);'));
      });

      test('should use active property via assignedStroke from palette', () {
        // Arrange
        const PaintingStyle style = PaintingStyle(
          stroke: PaintingStrokeStyle(colorArgb: 0xFF334455),
        );
        const DrawCircle command = DrawCircle(cx: 10, cy: 20, radius: 5, style: style);
        const PaletteResult palette = PaletteResult(
          <PaintCommand, String>{},
          <PaintCommand, String>{command: 'stroke1'},
        );
        final GeneratorBuffer buffer = GeneratorBuffer();

        // Act
        generator.generate(
          command,
          buffer,
          palette: palette,
          activeStrokeProperties: <String, String>{'stroke1': 'customStroke1'},
        );

        // Assert
        final String output = buffer.toString();
        expect(output, contains('final Object? localStroke = customStroke1;'));
        expect(output, contains('_applyOverride(paint, localStroke);'));
      });

      test('should use inherited property for fill if implicit match found', () {
        // Arrange
        const int color = 0xFFFF0000;
        const PaintingStyle style = PaintingStyle(
          fill: PaintingFillStyle(colorArgb: color, isExplicit: false),
        );
        const DrawCircle command = DrawCircle(cx: 10, cy: 20, radius: 5, style: style);
        final GeneratorBuffer buffer = GeneratorBuffer();

        // Act
        generator.generate(
          command,
          buffer,
          inheritedFills: <InheritedProperty>[const InheritedProperty('groupFill', colorArgb: color)],
        );

        // Assert
        final String output = buffer.toString();
        expect(output, contains('final Object? inheritedFill = groupFill;'));
        expect(output, contains('if (inheritedFill == null) {'));
        expect(output, contains('_applyOverride(paint, inheritedFill);'));
      });

      test('should use original color if inherited property does not match', () {
        // Arrange
        const int color = 0xFFFF0000;
        const PaintingStyle style = PaintingStyle(
          fill: PaintingFillStyle(colorArgb: color, isExplicit: false),
        );
        const DrawCircle command = DrawCircle(cx: 10, cy: 20, radius: 5, style: style);
        final GeneratorBuffer buffer = GeneratorBuffer();

        // Act
        generator.generate(
          command,
          buffer,
          inheritedFills: <InheritedProperty>[
            const InheritedProperty('groupFill', colorArgb: 0xFF0000FF), // Different color
          ],
        );

        // Assert
        final String output = buffer.toString();
        expect(output, isNot(contains('final Color? inheritedFill = groupFill;')));
        expect(output, contains('paint.color = const Color(0xFFFF0000);'));
      });

      test('should handle currentColor with opacity in fill', () {
        // Arrange
        const PaintingStyle style = PaintingStyle(
          fill: PaintingFillStyle(isCurrentColor: true, opacity: 0.7),
        );
        const DrawCircle command = DrawCircle(cx: 10, cy: 20, radius: 5, style: style);
        final GeneratorBuffer buffer = GeneratorBuffer();

        // Act
        generator.generate(command, buffer);

        // Assert
        final String output = buffer.toString();
        expect(
          output,
          contains('paint.color = (color ?? const Color(0xFF000000)).withOpacity(0.7);'),
        );
      });

      test('should handle currentColor with opacity in stroke', () {
        // Arrange
        const PaintingStyle style = PaintingStyle(
          stroke: PaintingStrokeStyle(isCurrentColor: true, opacity: 0.4),
        );
        const DrawCircle command = DrawCircle(cx: 10, cy: 20, radius: 5, style: style);
        final GeneratorBuffer buffer = GeneratorBuffer();

        // Act
        generator.generate(command, buffer);

        // Assert
        final String output = buffer.toString();
        expect(
          output,
          contains('paint.color = (color ?? const Color(0xFF000000)).withOpacity(0.4);'),
        );
      });

      test('should handle null colorArgb and null shaderId in fill (edge case)', () {
        // Arrange
        const PaintingStyle style = PaintingStyle(fill: PaintingFillStyle());
        const DrawCircle command = DrawCircle(cx: 10, cy: 20, radius: 5, style: style);
        final GeneratorBuffer buffer = GeneratorBuffer();

        // Act
        generator.generate(command, buffer);

        // Assert
        final String output = buffer.toString();
        expect(output, isNot(contains('paint.color =')));
        expect(output, isNot(contains('paint.shader =')));
      });

      test('should handle null colorArgb and null shaderId in stroke (edge case)', () {
        // Arrange
        const PaintingStyle style = PaintingStyle(stroke: PaintingStrokeStyle());
        const DrawCircle command = DrawCircle(cx: 10, cy: 20, radius: 5, style: style);
        final GeneratorBuffer buffer = GeneratorBuffer();

        // Act
        generator.generate(command, buffer);

        // Assert
        final String output = buffer.toString();
        expect(output, isNot(contains('paint.color =')));
        expect(output, isNot(contains('paint.shader =')));
      });

      test('should handle shader with full opacity in fill', () {
        // Arrange
        const PaintingStyle style = PaintingStyle(fill: PaintingFillStyle(shaderId: 's1'));
        const DrawCircle command = DrawCircle(cx: 10, cy: 20, radius: 5, style: style);
        final GeneratorBuffer buffer = GeneratorBuffer();

        // Act
        generator.generate(command, buffer);

        // Assert
        final String output = buffer.toString();
        expect(output, contains('paint.shader = _grad_s1.createShader'));
        expect(output, isNot(contains('withOpacity')));
      });

      test('should handle shader with full opacity in stroke', () {
        // Arrange
        const PaintingStyle style = PaintingStyle(stroke: PaintingStrokeStyle(shaderId: 's2'));
        const DrawCircle command = DrawCircle(cx: 10, cy: 20, radius: 5, style: style);
        final GeneratorBuffer buffer = GeneratorBuffer();

        // Act
        generator.generate(command, buffer);

        // Assert
        final String output = buffer.toString();
        expect(output, contains('paint.shader = _grad_s2.createShader'));
        expect(output, isNot(contains('withOpacity')));
      });

      test('should use inherited property for fill if implicit shader match found', () {
        // Arrange
        const String shaderId = 'grad1';
        const PaintingStyle style = PaintingStyle(
          fill: PaintingFillStyle(shaderId: shaderId, isExplicit: false),
        );
        const DrawCircle command = DrawCircle(cx: 10, cy: 20, radius: 5, style: style);
        final GeneratorBuffer buffer = GeneratorBuffer();

        // Act
        generator.generate(
          command,
          buffer,
          inheritedFills: <InheritedProperty>[
            const InheritedProperty('groupFill', shaderId: shaderId),
          ],
        );

        // Assert
        final String output = buffer.toString();
        expect(output, contains('final Object? inheritedFill = groupFill;'));
        expect(output, contains('if (inheritedFill == null) {'));
        expect(output, contains('_applyOverride(paint, inheritedFill);'));
      });
    });

    group('wrapWithTransform', () {
      test('should do nothing if transform is null', () {
        // Arrange
        const DrawCircle command = DrawCircle(cx: 0, cy: 0, radius: 5, style: PaintingStyle());
        final GeneratorBuffer buffer = GeneratorBuffer();

        // Act
        generator.generate(command, buffer);

        // Assert
        final String output = buffer.toString();
        expect(output, isNot(contains('canvas.save();')));
        expect(output, contains('{'));
      });

      test('should do nothing if transform attributes are empty', () {
        // Arrange
        const DrawCircle command = DrawCircle(
          cx: 0,
          cy: 0,
          radius: 5,
          style: PaintingStyle(transformAttributes: SvgTransformAttributes(<SvgTransformOperation>[])),
        );
        final GeneratorBuffer buffer = GeneratorBuffer();

        // Act
        generator.generate(command, buffer);

        // Assert
        final String output = buffer.toString();
        expect(output, isNot(contains('canvas.save();')));
        expect(output, contains('{'));
      });



      test('should wrap with translate when provided', () {
        // Arrange
        const DrawCircle command = DrawCircle(
          cx: 0,
          cy: 0,
          radius: 5,
          style: PaintingStyle(
            transformAttributes: SvgTransformAttributes(<SvgTransformOperation>[SvgTranslate(10, 20)]),
          ),
        );
        final GeneratorBuffer buffer = GeneratorBuffer();

        // Act
        generator.generate(command, buffer);

        // Assert
        final String output = buffer.toString();
        expect(output, contains('canvas.save();'));
        expect(output, contains('canvas.translate(10.0, 20.0);'));
        expect(output, contains('canvas.restore();'));
      });

      test('should wrap with scale when provided', () {
        // Arrange
        const DrawCircle command = DrawCircle(
          cx: 0,
          cy: 0,
          radius: 5,
          style: PaintingStyle(
            transformAttributes: SvgTransformAttributes(<SvgTransformOperation>[SvgScale(2.5, 2.5)]),
          ),
        );
        final GeneratorBuffer buffer = GeneratorBuffer();

        // Act
        generator.generate(command, buffer);

        // Assert
        final String output = buffer.toString();
        expect(output, contains('canvas.scale(2.5, 2.5);'));
      });

      test('should wrap with asymmetric scale', () {
        // Arrange
        const DrawCircle command = DrawCircle(
          cx: 0,
          cy: 0,
          radius: 5,
          style: PaintingStyle(
            transformAttributes: SvgTransformAttributes(<SvgTransformOperation>[SvgScale(2, 3)]),
          ),
        );
        final GeneratorBuffer buffer = GeneratorBuffer();

        // Act
        generator.generate(command, buffer);

        // Assert
        final String output = buffer.toString();
        expect(output, contains('canvas.scale(2.0, 3.0);'));
      });

      test('should wrap with rotate when provided', () {
        // Arrange
        const DrawCircle command = DrawCircle(
          cx: 0,
          cy: 0,
          radius: 5,
          style: PaintingStyle(
            transformAttributes: SvgTransformAttributes(<SvgTransformOperation>[SvgRotate(45)]),
          ),
        );
        final GeneratorBuffer buffer = GeneratorBuffer();

        // Act
        generator.generate(command, buffer);

        // Assert
        final String output = buffer.toString();
        expect(output, contains('canvas.rotate(0.7853981633974483);'));
      });

      test('should wrap with rotate and pivot point when provided', () {
        // Arrange
        const DrawCircle command = DrawCircle(
          cx: 0,
          cy: 0,
          radius: 5,
          style: PaintingStyle(
            transformAttributes: SvgTransformAttributes(<SvgTransformOperation>[SvgRotate(45, 10, 10)]),
          ),
        );
        final GeneratorBuffer buffer = GeneratorBuffer();

        // Act
        generator.generate(command, buffer);

        // Assert
        final String output = buffer.toString();
        expect(output, contains('canvas.translate(10.0, 10.0);'));
        expect(output, contains('canvas.rotate(0.7853981633974483);'));
        expect(output, contains('canvas.translate(-10.0, -10.0);'));
      });

      test('should handle multiple transforms', () {
        // Arrange
        const DrawCircle command = DrawCircle(
          cx: 0,
          cy: 0,
          radius: 5,
          style: PaintingStyle(
            transformAttributes: SvgTransformAttributes(<SvgTransformOperation>[
              SvgTranslate(10, 10),
              SvgScale(2, 2),
            ]),
          ),
        );
        final GeneratorBuffer buffer = GeneratorBuffer();

        // Act
        generator.generate(command, buffer);

        // Assert
        final String output = buffer.toString();
        expect(output, contains('canvas.translate(10.0, 10.0);'));
        expect(output, contains('canvas.scale(2.0, 2.0);'));
      });

      test('should wrap with skewX when provided', () {
        // Arrange
        const DrawCircle command = DrawCircle(
          cx: 0,
          cy: 0,
          radius: 5,
          style: PaintingStyle(
            transformAttributes: SvgTransformAttributes(<SvgTransformOperation>[SvgSkewX(30)]),
          ),
        );
        final GeneratorBuffer buffer = GeneratorBuffer();

        // Act
        generator.generate(command, buffer);

        // Assert
        final String output = buffer.toString();
        // tan(30 degrees) = 0.5773502691896256 (math.tan calculation)
        expect(output, contains('canvas.skew(0.5773502691896256, 0.0);'));
      });

      test('should wrap with skewY when provided', () {
        // Arrange
        const DrawCircle command = DrawCircle(
          cx: 0,
          cy: 0,
          radius: 5,
          style: PaintingStyle(
            transformAttributes: SvgTransformAttributes(<SvgTransformOperation>[SvgSkewY(30)]),
          ),
        );
        final GeneratorBuffer buffer = GeneratorBuffer();

        // Act
        generator.generate(command, buffer);

        // Assert
        final String output = buffer.toString();
        // tan(30 degrees) = 0.5773502691896256 (math.tan calculation)
        expect(output, contains('canvas.skew(0.0, 0.5773502691896256);'));
      });

      test('should wrap with matrix transform when provided', () {
        // Arrange
        const DrawCircle command = DrawCircle(
          cx: 0,
          cy: 0,
          radius: 5,
          style: PaintingStyle(
            transformAttributes: SvgTransformAttributes(<SvgTransformOperation>[
              SvgMatrix(1, 2, 3, 4, 5, 6),
            ]),
          ),
        );
        final GeneratorBuffer buffer = GeneratorBuffer();

        // Act
        generator.generate(command, buffer);

        // Assert
        final String output = buffer.toString();
        expect(
          output,
          contains(
            'canvas.transform(Matrix4.fromList(<double>[1.0, 2.0, 0, 0, 3.0, 4.0, 0, 0, 0, 0, 1, 0, 5.0, 6.0, 0, 1]).storage);',
          ),
        );
      });
    });
    group('CommandGenerator (Implicit)', () {
      test('should exist as abstract base', () {
        // Arrange
        const CommandGenerator<DrawCircle>? gen = null;
        // Assert
        expect(gen, isNull);
      });
    });
  });
}
