import 'dart:math' as math;
import '../painting_model/_painting_model.dart';
import '../svg_model/_svg_model.dart';

/// Extensions on [PaintingStrokeCap] to facilitate code generation.
extension PaintingStrokeCapToFlutterString on PaintingStrokeCap {
  /// Returns the Flutter [StrokeCap] representation as a string.
  String toFlutterString() {
    return switch (this) {
      .butt => 'StrokeCap.butt',
      .round => 'StrokeCap.round',
      .square => 'StrokeCap.square',
    };
  }
}

/// Extensions on [PaintingStrokeJoin] to facilitate code generation.
extension PaintingStrokeJoinToFlutterString on PaintingStrokeJoin {
  /// Returns the Flutter [StrokeJoin] representation as a string.
  String toFlutterString() {
    return switch (this) {
      .miter => 'StrokeJoin.miter',
      .round => 'StrokeJoin.round',
      .bevel => 'StrokeJoin.bevel',
    };
  }
}

/// Extensions on [SvgTransformAttributes] to facilitate code generation.
extension SvgTransformToFlutterMatrix on SvgTransformAttributes {
  /// Converts the transform operations to a 16-element Matrix4 storage list.
  List<double> toFlutterMatrix() {
    // Start with identity matrix
    var matrix = <double>[
      1, 0, 0, 0,
      0, 1, 0, 0,
      0, 0, 1, 0,
      0, 0, 0, 1,
    ];

    for (final SvgTransformOperation op in operations) {
      final List<double> next = _opToMatrix(op);
      matrix = _multiply(matrix, next);
    }

    return matrix;
  }

  List<double> _opToMatrix(SvgTransformOperation op) {
    switch (op) {
      case SvgMatrix(:final double a, :final double b, :final double c, :final double d, :final double e, :final double f):
        return <double>[
          a, b, 0, 0,
          c, d, 0, 0,
          0, 0, 1, 0,
          e, f, 0, 1,
        ];
      case SvgTranslate(:final double x, :final double y):
        return <double>[
          1, 0, 0, 0,
          0, 1, 0, 0,
          0, 0, 1, 0,
          x, y, 0, 1,
        ];
      case SvgScale(:final double x, :final double y):
        return <double>[
          x, 0, 0, 0,
          0, y, 0, 0,
          0, 0, 1, 0,
          0, 0, 0, 1,
        ];
      case SvgRotate(:final double angle, :final double? cx, :final double? cy):
        final double rad = angle * (math.pi / 180.0);
        final double cos = math.cos(rad);
        final double sin = math.sin(rad);
        
        final rotate = <double>[
          cos, sin, 0, 0,
          -sin, cos, 0, 0,
          0, 0, 1, 0,
          0, 0, 0, 1,
        ];

        if (cx != null && cy != null) {
          final List<double> pre = _opToMatrix(SvgTranslate(cx, cy));
          final List<double> post = _opToMatrix(SvgTranslate(-cx, -cy));
          return _multiply(pre, _multiply(rotate, post));
        }
        return rotate;
      case SvgSkewX(:final double angle):
        final double tan = math.tan(angle * (math.pi / 180.0));
        return <double>[
          1, 0, 0, 0,
          tan, 1, 0, 0,
          0, 0, 1, 0,
          0, 0, 0, 1,
        ];
      case SvgSkewY(:final double angle):
        final double tan = math.tan(angle * (math.pi / 180.0));
        return <double>[
          1, tan, 0, 0,
          0, 1, 0, 0,
          0, 0, 1, 0,
          0, 0, 0, 1,
        ];
    }
  }

  List<double> _multiply(List<double> a, List<double> b) {
    final result = List<double>.filled(16, 0.0);
    for (var i = 0; i < 4; i++) {
      for (var j = 0; j < 4; j++) {
        var sum = 0.0;
        for (var k = 0; k < 4; k++) {
          sum += a[i + k * 4] * b[k + j * 4];
        }
        result[i + j * 4] = sum;
      }
    }
    return result;
  }
}
