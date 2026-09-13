import '../../svg_model/svg_value.dart';

/// Extension on [String] to facilitate conversion to [SvgImageDecoding].
extension ToSvgImageDecoding on String {
  /// Parses the string as an [SvgImageDecoding].
  ///
  /// Defaults to [SvgImageDecoding.auto] if the string is unknown.
  SvgImageDecoding toSvgImageDecoding() {
    return switch (trim().toLowerCase()) {
      'sync' => SvgImageDecoding.sync,
      'async' => SvgImageDecoding.async,
      'auto' || _ => SvgImageDecoding.auto,
    };
  }
}
