import '../../base/_base.dart';
import '../../painting_model/_painting_model.dart';
import 'svg_painting_context.dart';

/// Parser for SVG path data ('d' attribute).
class PathDataParser {
  /// Parses the path data string into a list of [PathOperation]s.
  static Result<List<PathOperation>> parse(String d, SvgPaintingContext context) {
    final List<PathOperation> operations = <PathOperation>[];
    // Improved regex to handle commas, scientific notation, and multiple numbers
    final RegExp commandRegex = RegExp(r'([a-zA-Z])|(-?\d*\.?\d+(?:[eE][+-]?\d+)?)|[, \t\n\r]+');
    final Iterable<Match> matches = commandRegex.allMatches(d);

    String? currentCommand;
    final List<double> params = <double>[];

    double lastX = 0.0;
    double lastY = 0.0;
    double? lastControlX;
    double? lastControlY;
    double subpathStartX = 0.0;
    double subpathStartY = 0.0;

    String? errorMessage;

    void flushCommand() {
      if (currentCommand == null || errorMessage != null) {
        return;
      }

      final bool isRelative = currentCommand!.toLowerCase() == currentCommand;
      final String cmd = currentCommand!.toUpperCase();

      int i = 0;
      while (i < params.length || cmd == 'Z') {
        final int remaining = params.length - i;
        switch (cmd) {
          case 'M':
            if (remaining < 2) {
              errorMessage = 'Insufficient parameters for M command';
              return;
            }
            final double x = isRelative ? lastX + params[i++] : params[i++];
            final double y = isRelative ? lastY + params[i++] : params[i++];
            operations.add(MoveTo(context.transformX(x), context.transformY(y)));
            lastX = x;
            lastY = y;
            subpathStartX = x;
            subpathStartY = y;
            lastControlX = null;
            lastControlY = null;
            // After M, subsequent pairs are treated as L
            currentCommand = isRelative ? 'l' : 'L';
          case 'L':
            if (remaining < 2) {
              errorMessage = 'Insufficient parameters for L command';
              return;
            }
            final double x = isRelative ? lastX + params[i++] : params[i++];
            final double y = isRelative ? lastY + params[i++] : params[i++];
            operations.add(LineTo(context.transformX(x), context.transformY(y)));
            lastX = x;
            lastY = y;
            lastControlX = null;
            lastControlY = null;
          case 'H':
            if (remaining < 1) {
              errorMessage = 'Insufficient parameters for H command';
              return;
            }
            final double x = isRelative ? lastX + params[i++] : params[i++];
            operations.add(LineTo(context.transformX(x), context.transformY(lastY)));
            lastX = x;
            lastControlX = null;
            lastControlY = null;
          case 'V':
            if (remaining < 1) {
              errorMessage = 'Insufficient parameters for V command';
              return;
            }
            final double y = isRelative ? lastY + params[i++] : params[i++];
            operations.add(LineTo(context.transformX(lastX), context.transformY(y)));
            lastY = y;
            lastControlX = null;
            lastControlY = null;
          case 'C':
            if (remaining < 6) {
              errorMessage = 'Insufficient parameters for C command';
              return;
            }
            final double x1 = isRelative ? lastX + params[i++] : params[i++];
            final double y1 = isRelative ? lastY + params[i++] : params[i++];
            final double x2 = isRelative ? lastX + params[i++] : params[i++];
            final double y2 = isRelative ? lastY + params[i++] : params[i++];
            final double x = isRelative ? lastX + params[i++] : params[i++];
            final double y = isRelative ? lastY + params[i++] : params[i++];
            operations.add(
              CubicTo(
                context.transformX(x1),
                context.transformY(y1),
                context.transformX(x2),
                context.transformY(y2),
                context.transformX(x),
                context.transformY(y),
              ),
            );
            lastControlX = x2;
            lastControlY = y2;
            lastX = x;
            lastY = y;
          case 'S':
            if (remaining < 4) {
              errorMessage = 'Insufficient parameters for S command';
              return;
            }
            final double x2 = isRelative ? lastX + params[i++] : params[i++];
            final double y2 = isRelative ? lastY + params[i++] : params[i++];
            final double x = isRelative ? lastX + params[i++] : params[i++];
            final double y = isRelative ? lastY + params[i++] : params[i++];

            double x1, y1;
            if (lastControlX != null && lastControlY != null) {
              x1 = 2 * lastX - lastControlX!;
              y1 = 2 * lastY - lastControlY!;
            } else {
              x1 = lastX;
              y1 = lastY;
            }

            operations.add(
              CubicTo(
                context.transformX(x1),
                context.transformY(y1),
                context.transformX(x2),
                context.transformY(y2),
                context.transformX(x),
                context.transformY(y),
              ),
            );
            lastControlX = x2;
            lastControlY = y2;
            lastX = x;
            lastY = y;
          case 'Q':
            if (remaining < 4) {
              errorMessage = 'Insufficient parameters for Q command';
              return;
            }
            final double x1 = isRelative ? lastX + params[i++] : params[i++];
            final double y1 = isRelative ? lastY + params[i++] : params[i++];
            final double x = isRelative ? lastX + params[i++] : params[i++];
            final double y = isRelative ? lastY + params[i++] : params[i++];
            operations.add(
              QuadraticTo(
                context.transformX(x1),
                context.transformY(y1),
                context.transformX(x),
                context.transformY(y),
              ),
            );
            lastControlX = x1;
            lastControlY = y1;
            lastX = x;
            lastY = y;
          case 'T':
            if (remaining < 2) {
              errorMessage = 'Insufficient parameters for T command';
              return;
            }
            final double x = isRelative ? lastX + params[i++] : params[i++];
            final double y = isRelative ? lastY + params[i++] : params[i++];

            double x1, y1;
            if (lastControlX != null && lastControlY != null) {
              x1 = 2 * lastX - lastControlX!;
              y1 = 2 * lastY - lastControlY!;
            } else {
              x1 = lastX;
              y1 = lastY;
            }

            operations.add(
              QuadraticTo(
                context.transformX(x1),
                context.transformY(y1),
                context.transformX(x),
                context.transformY(y),
              ),
            );
            lastControlX = x1;
            lastControlY = y1;
            lastX = x;
            lastY = y;
          case 'A':
            if (remaining < 7) {
              errorMessage = 'Insufficient parameters for A command';
              return;
            }
            final double rx = params[i++];
            final double ry = params[i++];
            final double xAxisRotation = params[i++];
            final bool largeArcFlag = params[i++] != 0;
            final bool sweepFlag = params[i++] != 0;
            final double x = isRelative ? lastX + params[i++] : params[i++];
            final double y = isRelative ? lastY + params[i++] : params[i++];
            operations.add(
              ArcTo(
                context.scaleHorizontal(rx),
                context.scaleVertical(ry),
                xAxisRotation,
                largeArcFlag,
                sweepFlag,
                context.transformX(x),
                context.transformY(y),
              ),
            );
            lastX = x;
            lastY = y;
            lastControlX = null;
            lastControlY = null;
          case 'Z':
            operations.add(const ClosePath());
            lastX = subpathStartX;
            lastY = subpathStartY;
            lastControlX = null;
            lastControlY = null;
            if (params.isEmpty) {
              return; // Exit loop for Z
            }
            i = params.length; // Ensure exit if there are trailing params

          default:
            errorMessage = 'Unknown path command: $cmd';
            return;
        }
      }
      params.clear();
    }

    for (final Match match in matches) {
      if (match.group(1) != null) {
        // New command
        flushCommand();
        if (errorMessage != null) {
          return Failure<List<PathOperation>>(errorMessage!);
        }
        currentCommand = match.group(1);
      } else if (match.group(2) != null) {
        // Parameter
        params.add(double.parse(match.group(2)!));
      }
      // Ignore separators (match.group(0) where both are null)
    }
    flushCommand();

    if (errorMessage != null) {
      return Failure<List<PathOperation>>(errorMessage!);
    }

    return Success<List<PathOperation>>(operations);
  }
}
