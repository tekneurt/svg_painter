import '../../svg_model/_svg_model.dart';

/// Extension on [String] to convert it to an [SvgStrokeLinecap].
extension ToSvgStrokeLinecap on String {
  /// Parses the string as an [SvgStrokeLinecap].
  SvgStrokeLinecap? toSvgStrokeLinecap() {
    return SvgStrokeLinecap.from(trim().toLowerCase());
  }
}
