import '../../base/_base.dart';
import '../../painting_model/_painting_model.dart';
import 'svg_painting_context.dart';

/// Parser for SVG path data ('d' attribute).
class PathDataParser {
  /// Parses the path data string into a list of [PathOperation]s.
  static Result<List<PathOperation>> parse(String d, SvgPaintingContext context) {
    final operations = <PathOperation>[];
    final scanner = _PathScanner(d);

    var lastX = 0.0;
    var lastY = 0.0;
    double? lastControlX;
    double? lastControlY;
    var subpathStartX = 0.0;
    var subpathStartY = 0.0;

    scanner.skipWhitespaceAndCommas();
    if (scanner.isDone) {
      return Success<List<PathOperation>>(operations);
    }
    if (!scanner.isCommandChar()) {
      return const Failure<List<PathOperation>>('Expected path command, but found coordinates');
    }

    while (!scanner.isDone) {
      final String? cmd = scanner.readCommand();
      if (cmd == null) {
        if (!scanner.isDone) {
          if (operations.isNotEmpty) {
            return Success<List<PathOperation>>(operations);
          }
          return const Failure<List<PathOperation>>('Expected path command');
        } else {
          break;
        }
      }
      final isRelative = cmd.toLowerCase() == cmd;
      String commandType = cmd.toUpperCase();

      if (commandType == 'Z') {
        operations.add(const ClosePath());
        lastX = subpathStartX;
        lastY = subpathStartY;
        lastControlX = null;
        lastControlY = null;
        while (true) {
          scanner.skipWhitespaceAndCommas();
          if (scanner.isDone || scanner.isCommandChar()) {
            break;
          }
          final double? n = scanner.readNumber();
          if (n == null) {
            break;
          }
        }
        continue;
      }

      var hasProcessedAtLeastOne = false;

      parameterLoop:
      while (true) {
        scanner.skipWhitespaceAndCommas();
        if (scanner.isDone || scanner.isCommandChar()) {
          break parameterLoop;
        }
        switch (commandType) {
          case 'M':
            final double? xRaw = scanner.readNumber();
            final double? yRaw = scanner.readNumber();
            if (xRaw == null || yRaw == null) {
              if (hasProcessedAtLeastOne) {
                break parameterLoop;
              }
              return const Failure<List<PathOperation>>('Insufficient parameters for M command');
            }
            final double x = isRelative ? lastX + xRaw : xRaw;
            final double y = isRelative ? lastY + yRaw : yRaw;
            operations.add(MoveTo(x, y));
            lastX = x;
            lastY = y;
            subpathStartX = x;
            subpathStartY = y;
            lastControlX = null;
            lastControlY = null;
            commandType = 'L';
            hasProcessedAtLeastOne = true;

          case 'L':
            final double? xRaw = scanner.readNumber();
            final double? yRaw = scanner.readNumber();
            if (xRaw == null || yRaw == null) {
              if (hasProcessedAtLeastOne) {
                break parameterLoop;
              }
              return const Failure<List<PathOperation>>('Insufficient parameters for L command');
            }
            final double x = isRelative ? lastX + xRaw : xRaw;
            final double y = isRelative ? lastY + yRaw : yRaw;
            operations.add(LineTo(x, y));
            lastX = x;
            lastY = y;
            lastControlX = null;
            lastControlY = null;
            hasProcessedAtLeastOne = true;

          case 'H':
            final double? xRaw = scanner.readNumber();
            if (xRaw == null) {
              if (hasProcessedAtLeastOne) {
                break parameterLoop;
              }
              return const Failure<List<PathOperation>>('Insufficient parameters for H command');
            }
            final double x = isRelative ? lastX + xRaw : xRaw;
            operations.add(LineTo(x, lastY));
            lastX = x;
            lastControlX = null;
            lastControlY = null;
            hasProcessedAtLeastOne = true;

          case 'V':
            final double? yRaw = scanner.readNumber();
            if (yRaw == null) {
              if (hasProcessedAtLeastOne) {
                break parameterLoop;
              }
              return const Failure<List<PathOperation>>('Insufficient parameters for V command');
            }
            final double y = isRelative ? lastY + yRaw : yRaw;
            operations.add(LineTo(lastX, y));
            lastY = y;
            lastControlX = null;
            lastControlY = null;
            hasProcessedAtLeastOne = true;

          case 'C':
            final double? x1Raw = scanner.readNumber();
            final double? y1Raw = scanner.readNumber();
            final double? x2Raw = scanner.readNumber();
            final double? y2Raw = scanner.readNumber();
            final double? xRaw = scanner.readNumber();
            final double? yRaw = scanner.readNumber();
            if (x1Raw == null ||
                y1Raw == null ||
                x2Raw == null ||
                y2Raw == null ||
                xRaw == null ||
                yRaw == null) {
              if (hasProcessedAtLeastOne) {
                break parameterLoop;
              }
              return const Failure<List<PathOperation>>('Insufficient parameters for C command');
            }
            final double x1 = isRelative ? lastX + x1Raw : x1Raw;
            final double y1 = isRelative ? lastY + y1Raw : y1Raw;
            final double x2 = isRelative ? lastX + x2Raw : x2Raw;
            final double y2 = isRelative ? lastY + y2Raw : y2Raw;
            final double x = isRelative ? lastX + xRaw : xRaw;
            final double y = isRelative ? lastY + yRaw : yRaw;
            operations.add(CubicTo(x1, y1, x2, y2, x, y));
            lastControlX = x2;
            lastControlY = y2;
            lastX = x;
            lastY = y;
            hasProcessedAtLeastOne = true;

          case 'S':
            final double? x2Raw = scanner.readNumber();
            final double? y2Raw = scanner.readNumber();
            final double? xRaw = scanner.readNumber();
            final double? yRaw = scanner.readNumber();
            if (x2Raw == null || y2Raw == null || xRaw == null || yRaw == null) {
              if (hasProcessedAtLeastOne) {
                break parameterLoop;
              }
              return const Failure<List<PathOperation>>('Insufficient parameters for S command');
            }
            final double x2 = isRelative ? lastX + x2Raw : x2Raw;
            final double y2 = isRelative ? lastY + y2Raw : y2Raw;
            final double x = isRelative ? lastX + xRaw : xRaw;
            final double y = isRelative ? lastY + yRaw : yRaw;
            final double x1;
            final double y1;
            final lcx = lastControlX;
            final lcy = lastControlY;
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
            hasProcessedAtLeastOne = true;

          case 'Q':
            final double? x1Raw = scanner.readNumber();
            final double? y1Raw = scanner.readNumber();
            final double? xRaw = scanner.readNumber();
            final double? yRaw = scanner.readNumber();
            if (x1Raw == null || y1Raw == null || xRaw == null || yRaw == null) {
              if (hasProcessedAtLeastOne) {
                break parameterLoop;
              }
              return const Failure<List<PathOperation>>('Insufficient parameters for Q command');
            }
            final double x1 = isRelative ? lastX + x1Raw : x1Raw;
            final double y1 = isRelative ? lastY + y1Raw : y1Raw;
            final double x = isRelative ? lastX + xRaw : xRaw;
            final double y = isRelative ? lastY + yRaw : yRaw;
            operations.add(QuadraticTo(x1, y1, x, y));
            lastControlX = x1;
            lastControlY = y1;
            lastX = x;
            lastY = y;
            hasProcessedAtLeastOne = true;

          case 'T':
            final double? xRaw = scanner.readNumber();
            final double? yRaw = scanner.readNumber();
            if (xRaw == null || yRaw == null) {
              if (hasProcessedAtLeastOne) {
                break parameterLoop;
              }
              return const Failure<List<PathOperation>>('Insufficient parameters for T command');
            }
            final double x = isRelative ? lastX + xRaw : xRaw;
            final double y = isRelative ? lastY + yRaw : yRaw;
            final double x1;
            final double y1;
            final lcx = lastControlX;
            final lcy = lastControlY;
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
            hasProcessedAtLeastOne = true;

          case 'A':
            final double? rx = scanner.readNumber();
            final double? ry = scanner.readNumber();
            final double? xAxisRotation = scanner.readNumber();
            final bool? largeArcFlag = scanner.readFlag(requireLeadingSeparator: true);
            final bool? sweepFlag = scanner.readFlag(requireLeadingSeparator: false);
            final double? xRaw = scanner.readNumber();
            final double? yRaw = scanner.readNumber();
            if (rx == null ||
                ry == null ||
                xAxisRotation == null ||
                largeArcFlag == null ||
                sweepFlag == null ||
                xRaw == null ||
                yRaw == null) {
              if (hasProcessedAtLeastOne) {
                break parameterLoop;
              }
              return const Failure<List<PathOperation>>('Insufficient parameters for A command');
            }

            final double x = isRelative ? lastX + xRaw : xRaw;
            final double y = isRelative ? lastY + yRaw : yRaw;
            operations.add(ArcTo(rx, ry, xAxisRotation, largeArcFlag, sweepFlag, x, y));
            lastX = x;
            lastY = y;
            lastControlX = null;
            lastControlY = null;
            hasProcessedAtLeastOne = true;

          default:
            return Failure<List<PathOperation>>('Unknown path command: $commandType');
        }
      }

      if (!hasProcessedAtLeastOne) {
        return Failure<List<PathOperation>>('Insufficient parameters for $commandType command');
      }
    }

    return Success<List<PathOperation>>(operations);
  }
}

class _PathScanner {
  _PathScanner(this.source);
  final String source;
  int index = 0;

  bool get isDone => index >= source.length;

  bool skipWhitespaceAndCommas() {
    var skipped = false;
    while (!isDone) {
      final int c = source.codeUnitAt(index);
      if (c == 0x20 || c == 0x09 || c == 0x0A || c == 0x0D || c == 0x2C) {
        index++;
        skipped = true;
      } else {
        break;
      }
    }
    return skipped;
  }

  bool isCommandChar() {
    skipWhitespaceAndCommas();
    if (isDone) {
      return false;
    }
    final int c = source.codeUnitAt(index);
    return (c >= 0x41 && c <= 0x5A) || (c >= 0x61 && c <= 0x7A);
  }

  String? readCommand() {
    skipWhitespaceAndCommas();
    if (isDone || !isCommandChar()) {
      return null;
    }
    final String cmd = source[index];
    index++;
    return cmd;
  }

  double? readNumber() {
    skipWhitespaceAndCommas();
    if (isDone) {
      return null;
    }
    final int start = index;
    int c = source.codeUnitAt(index);
    if (c == 0x2B || c == 0x2D) {
      index++;
      if (isDone) {
        index = start;
        return null;
      }
      c = source.codeUnitAt(index);
    }
    var hasDigits = false;
    while (!isDone && (source.codeUnitAt(index) >= 0x30 && source.codeUnitAt(index) <= 0x39)) {
      hasDigits = true;
      index++;
    }
    if (!isDone && source.codeUnitAt(index) == 0x2E) {
      index++;
      while (!isDone && (source.codeUnitAt(index) >= 0x30 && source.codeUnitAt(index) <= 0x39)) {
        hasDigits = true;
        index++;
      }
    }
    if (!hasDigits) {
      index = start;
      return null;
    }
    if (!isDone && (source.codeUnitAt(index) == 0x65 || source.codeUnitAt(index) == 0x45)) {
      final int expStart = index;
      index++;
      if (!isDone && (source.codeUnitAt(index) == 0x2B || source.codeUnitAt(index) == 0x2D)) {
        index++;
      }
      var hasExpDigits = false;
      while (!isDone && (source.codeUnitAt(index) >= 0x30 && source.codeUnitAt(index) <= 0x39)) {
        hasExpDigits = true;
        index++;
      }
      if (!hasExpDigits) {
        index = expStart;
      }
    }
    final String numStr = source.substring(start, index);
    return double.tryParse(numStr);
  }

  bool? readFlag({required bool requireLeadingSeparator}) {
    final bool hadSep = skipWhitespaceAndCommas();
    if (requireLeadingSeparator && !hadSep) {
      return null;
    }
    if (isDone) {
      return null;
    }
    final int c = source.codeUnitAt(index);
    if (c == 0x30) {
      index++;
      return false;
    } else if (c == 0x31) {
      index++;
      return true;
    } else {
      return null;
    }
  }
}
