import '../../svg_model/_svg_model.dart';

/// Extension on [String] to convert it to an [SvgStrokeLinejoin].
extension ToSvgStrokeLinejoin on String {
  /// Parses the string as an [SvgStrokeLinejoin].

  SvgStrokeLinejoin? toSvgStrokeLinejoin() {
    return SvgStrokeLinejoin.from(trim().toLowerCase());
  }
}
