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
      if (currentCommand == null) {
        if (params.isNotEmpty) {
          errorMessage = 'Expected path command, but found coordinates: ${params.join(", ")}';
        }
        return;
      }

      // Caller guarantees errorMessage is null
      assert(errorMessage == null);

      int i = 0;
      while (i < params.length || (currentCommand?.toUpperCase() == 'Z' && i == 0)) {
        final String? cmdName = currentCommand;
        assert(cmdName != null, 'currentCommand should not be null during command processing');
        if (cmdName == null) {
          break;
        }
        final bool isRelative = cmdName.toLowerCase() == cmdName;
        final String cmd = cmdName.toUpperCase();
        final int remaining = params.length - i;
        switch (cmd) {
          case 'M':
            if (remaining < 2) {
              errorMessage = 'Insufficient parameters for M command';
              return;
            }
            final double x = isRelative ? lastX + params[i++] : params[i++];
            final double y = isRelative ? lastY + params[i++] : params[i++];
            operations.add(MoveTo(x, y));
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
            operations.add(LineTo(x, y));
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
            operations.add(LineTo(x, lastY));
            lastX = x;
            lastControlX = null;
            lastControlY = null;
          case 'V':
            if (remaining < 1) {
              errorMessage = 'Insufficient parameters for V command';
              return;
            }
            final double y = isRelative ? lastY + params[i++] : params[i++];
            operations.add(LineTo(lastX, y));
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
            operations.add(CubicTo(x1, y1, x2, y2, x, y));
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
            final double? lcx = lastControlX;
            final double? lcy = lastControlY;
            if (lcx == null || lcy == null) {
              x1 = lastX;
              y1 = lastY;
            } else {
              x1 = 2 * lastX - lcx;
              y1 = 2 * lastY - lcy;
            }

            operations.add(CubicTo(x1, y1, x2, y2, x, y));
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
            operations.add(QuadraticTo(x1, y1, x, y));
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
            final double? lcx = lastControlX;
            final double? lcy = lastControlY;
            if (lcx == null || lcy == null) {
              x1 = lastX;
              y1 = lastY;
            } else {
              x1 = 2 * lastX - lcx;
              y1 = 2 * lastY - lcy;
            }

            operations.add(QuadraticTo(x1, y1, x, y));
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
            operations.add(ArcTo(rx, ry, xAxisRotation, largeArcFlag, sweepFlag, x, y));
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
      if (match.group(1) == null) {
        final String? param = match.group(2);
        if (param == null) {
          // Separator or whitespace
        } else {
          params.add(double.parse(param));
        }
      } else {
        // New command
        flushCommand();
        final String? err = errorMessage;
        if (err == null) {
          currentCommand = match.group(1);
        } else {
          return Failure<List<PathOperation>>(err);
        }
      }
    }
    flushCommand();

    final String? err = errorMessage;
    if (err == null) {
      return Success<List<PathOperation>>(operations);
    } else {
      return Failure<List<PathOperation>>(err);
    }
  }
}
