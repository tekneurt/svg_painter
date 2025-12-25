import '../../painting_model/_painting_model.dart';
import 'svg_painting_context.dart';

/// Parser for SVG path data ('d' attribute).
class PathDataParser {
  /// Parses the path data string into a list of [PathOperation]s.
  static List<PathOperation> parse(String d, SvgPaintingContext context) {
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

    void flushCommand() {
      if (currentCommand == null) {
        return;
      }

      final bool isRelative = currentCommand!.toLowerCase() == currentCommand;
      final String cmd = currentCommand!.toUpperCase();

      int i = 0;
      while (i < params.length || cmd == 'Z') {
        switch (cmd) {
          case 'M':
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
            final double x = isRelative ? lastX + params[i++] : params[i++];
            final double y = isRelative ? lastY + params[i++] : params[i++];
            operations.add(LineTo(context.transformX(x), context.transformY(y)));
            lastX = x;
            lastY = y;
            lastControlX = null;
            lastControlY = null;
          case 'H':
            final double x = isRelative ? lastX + params[i++] : params[i++];
            operations.add(LineTo(context.transformX(x), context.transformY(lastY)));
            lastX = x;
            lastControlX = null;
            lastControlY = null;
          case 'V':
            final double y = isRelative ? lastY + params[i++] : params[i++];
            operations.add(LineTo(context.transformX(lastX), context.transformY(y)));
            lastY = y;
            lastControlX = null;
            lastControlY = null;
          case 'C':
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
            i = params.length; // Skip unknown
        }
      }
      params.clear();
    }

    for (final Match match in matches) {
      if (match.group(1) != null) {
        // New command
        flushCommand();
        currentCommand = match.group(1);
      } else if (match.group(2) != null) {
        // Parameter
        params.add(double.parse(match.group(2)!));
      }
      // Ignore separators (match.group(0) where both are null)
    }
    flushCommand();

    return operations;
  }
}
