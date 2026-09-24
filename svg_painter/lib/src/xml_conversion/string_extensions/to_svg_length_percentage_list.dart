import '../../svg_model/_svg_model.dart';
import 'to_svg_length_percentage.dart';

/// Extension on [String] to convert it to [SvgLengthPercentageList].
extension ToSvgLengthPercentageList on String {
  /// Parses the string as an [SvgLengthPercentageList].
  SvgLengthPercentageList toSvgLengthPercentageList() {
    final List<String> tokens = trim().split(RegExp(r'[\s,]+'));
    final values = <SvgLengthPercentage>[];

    for (final token in tokens) {
      final String trimmed = token.trim();
      if (trimmed.isNotEmpty) {
        values.add(trimmed.toSvgLengthPercentage());
      }
    }

    return SvgLengthPercentageList(values);
  }

  /// Parses the string as an [SvgLengthPercentageOrList].
  ///
  /// Returns an [SvgLengthPercentage] directly if only a single coordinate is present,
  /// or an [SvgLengthPercentageList] if multiple coordinates (or none) are present.
  SvgLengthPercentageOrList toSvgLengthPercentageOrList() {
    final SvgLengthPercentageList list = toSvgLengthPercentageList();
    if (list.values.length == 1) {
      return list.values.first;
    } else {
      return list;
    }
  }
}
