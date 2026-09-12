import '../../painting_model/_painting_model.dart';
import '../command_generator.dart';
import '../generator_buffer.dart';
import '../models.dart';
import '../palette_analyzer.dart';

/// Generator for [DefineClipPath] commands.
class ClipPathGenerator extends CommandGenerator<DefineClipPath> {
  const ClipPathGenerator();

  @override
  void generate(
    DefineClipPath command,
    GeneratorBuffer buffer, {
    Map<Type, CommandGenerator<PaintCommand>>? generators,
    PaletteResult? palette,
    Map<String, String>? activeFillProperties,
    Map<String, String>? activeStrokeProperties,
    List<InheritedProperty>? inheritedFills,
    List<InheritedProperty>? inheritedStrokes,
    String? painterClassName,
    Set<String>? gradientsNeedingStretch,
  }) {
    buffer.writeBlock(
      'void _clipPath_${command.id}(Canvas canvas, Size size, Rect targetBounds) {',
      () {
        final isOBox =
            command.clipPathUnits == PaintingGradientUnits.objectBoundingBox;
        buffer.writeln('final Path path = Path();');

        for (final PaintCommand child in command.commands) {
          _generateChildPath(child, buffer);
        }

        if (isOBox) {
          buffer.writeBlock('{', () {
            buffer.writeln('final Matrix4 matrix = Matrix4.identity()');
            buffer.indent();
            buffer.writeln('..translate(targetBounds.left, targetBounds.top)');
            buffer.writeln('..scale(targetBounds.width, targetBounds.height);');
            buffer.outdent();
            buffer.writeln('canvas.clipPath(path.transform(matrix.storage));');
          });
        } else {
          buffer.writeln('canvas.clipPath(path);');
        }
      },
    );
  }

  void _generateChildPath(PaintCommand child, GeneratorBuffer buffer) {
    switch (child) {
      case DrawCircle(:final double cx, :final double cy, :final double radius):
        buffer.writeln(
          'path.addOval(Rect.fromCircle(center: const Offset($cx, $cy), radius: $radius));',
        );
      case DrawOval(:final double cx, :final double cy, :final double rx, :final double ry):
        buffer.writeln(
          'path.addOval(Rect.fromLTWH(${cx - rx}, ${cy - ry}, ${rx * 2}, ${ry * 2}));',
        );
      case DrawRect(
        :final double x,
        :final double y,
        :final double width,
        :final double height,
        :final double rx,
        :final double ry,
      ):
        if (rx == 0.0 && ry == 0.0) {
          buffer.writeln('path.addRect(Rect.fromLTWH($x, $y, $width, $height));');
        } else {
          buffer.writeln(
            'path.addRRect(RRect.fromRectAndRadius(Rect.fromLTWH($x, $y, $width, $height), const Radius.elliptical($rx, $ry)));',
          );
        }
      case DrawLine(:final double x1, :final double y1, :final double x2, :final double y2):
        buffer.writeln('path.moveTo($x1, $y1);');
        buffer.writeln('path.lineTo($x2, $y2);');
      case DrawPolygon(:final List<double> points):
        if (points.isNotEmpty) {
          buffer.writeBlock('{', () {
            buffer.writeln('final Path polyPath = Path()');
            buffer.indent();
            buffer.writeln('..moveTo(${points[0]}, ${points[1]})');
            for (var i = 2; i < points.length; i += 2) {
              buffer.writeln('..lineTo(${points[i]}, ${points[i + 1]})');
            }
            buffer.writeln('..close();');
            buffer.outdent();
            buffer.writeln('path.addPath(polyPath, Offset.zero);');
          });
        }
      case DrawPolyline(:final List<double> points):
        if (points.isNotEmpty) {
          buffer.writeBlock('{', () {
            buffer.writeln('final Path polyPath = Path()');
            buffer.indent();
            buffer.writeln('..moveTo(${points[0]}, ${points[1]})');
            for (var i = 2; i < points.length; i += 2) {
              buffer.writeln('..lineTo(${points[i]}, ${points[i + 1]})');
            }
            buffer.writeln(';');
            buffer.outdent();
            buffer.writeln('path.addPath(polyPath, Offset.zero);');
          });
        }
      case DrawPath(:final List<PathOperation> operations):
        buffer.writeBlock('{', () {
          buffer.writeln('final Path subPath = Path()');
          buffer.indent();
          for (final op in operations) {
            switch (op) {
              case MoveTo(:final double x, :final double y):
                buffer.writeln('..moveTo($x, $y)');
              case LineTo(:final double x, :final double y):
                buffer.writeln('..lineTo($x, $y)');
              case CubicTo(
                :final double x1,
                :final double y1,
                :final double x2,
                :final double y2,
                :final double x3,
                :final double y3,
              ):
                buffer.writeln('..cubicTo($x1, $y1, $x2, $y2, $x3, $y3)');
              case QuadraticTo(
                :final double x1,
                :final double y1,
                :final double x2,
                :final double y2,
              ):
                buffer.writeln('..quadraticBezierTo($x1, $y1, $x2, $y2)');
              case ArcTo(
                :final double rx,
                :final double ry,
                :final double xAxisRotation,
                :final bool largeArcFlag,
                :final bool sweepFlag,
                :final double x,
                :final double y,
              ):
                buffer.writeln(
                  '..arcToPoint(const Offset($x, $y), radius: const Radius.elliptical($rx, $ry), rotation: $xAxisRotation, largeArc: $largeArcFlag, clockwise: $sweepFlag)',
                );
              case ClosePath():
                buffer.writeln('..close()');
            }
          }
          buffer.outdent();
          buffer.writeln(';');
          buffer.writeln('path.addPath(subPath, Offset.zero);');
        });
      case DrawGroup(:final List<PaintCommand> commands):
        for (final subCmd in commands) {
          _generateChildPath(subCmd, buffer);
        }
      case _:
        // Non-path / unsupported clip commands are skipped safely
        break;
    }
  }
}
