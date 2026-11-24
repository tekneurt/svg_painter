import '../../svg_model/svg_value.dart';

/// Extension on [String] to convert it to an [SvgOverflow].
extension ToSvgOverflow on String {
  /// Parses the string as an [SvgOverflow].
  SvgOverflow? toSvgOverflow() {
    return SvgOverflow.from(this);
  }
}
