import '../../svg_model/_svg_model.dart';

/// Extension on [String] to convert it to an [SvgViewBox].
extension ToSvgViewBox on String {
  /// Parses the string as an [SvgViewBox].
  SvgViewBox? toSvgViewBox() {
    final List<String> parts = trim().split(RegExp(r'[\s,]+'));
    if (parts.length != 4) {
      return null;
    }

    final double? minX = double.tryParse(parts[0]);
    final double? minY = double.tryParse(parts[1]);
    final double? width = double.tryParse(parts[2]);
    final double? height = double.tryParse(parts[3]);

    if (minX == null || minY == null || width == null || height == null) {
      return null;
    }

    return SvgViewBox(minX, minY, width, height);
  }
}
