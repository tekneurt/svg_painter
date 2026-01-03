import '../painting_model/_painting_model.dart';

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
