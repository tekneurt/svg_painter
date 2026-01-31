import '../../svg_model/_svg_model.dart';

/// Extension on [String] to convert it to an [SvgViewBox].
extension ToSvgViewBox on String {
  /// Parses the string as an [SvgViewBox].
  SvgViewBox? toSvgViewBox() {
    final List<String> parts = trim().split(RegExp(r'[\s,]+'));
    if (parts.length == 4) {
      return parts.toSvgViewBox();
    } else {
      return null;
    }
  }
}

/// Extension on [List<String>] to convert it to an [SvgViewBox].
extension ToSvgViewBoxList on List<String> {
  /// Parses the list of strings as an [SvgViewBox].
  SvgViewBox? toSvgViewBox() {
    assert(length == 4, 'SvgViewBox requires exactly 4 values');
    try {
      final double minX = double.parse(this[0]);
      final double minY = double.parse(this[1]);
      final double width = double.parse(this[2]);
      final double height = double.parse(this[3]);

      return SvgViewBox(minX, minY, width, height);
    } on FormatException {
      return null;
    }
  }
}
