import '../../svg_model/_svg_model.dart';
import 'to_svg_length_percentage.dart';

/// Extension on [String] to convert it to [SvgLengthPercentageAuto].
extension ToSvgLengthPercentageAuto on String {
  /// Parses the string as an [SvgLengthPercentageAuto].
  SvgLengthPercentageAuto toSvgLengthPercentageAuto() {
    final String trimmed = trim();
    if (trimmed == 'auto') {
      return const SvgAuto();
    }
    return toSvgLengthPercentage();
  }
}
