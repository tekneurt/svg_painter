import '../../svg_model/_svg_model.dart';

extension StringToStrokeLinejoin on String {
  /// Converts this string to an [SvgStrokeLinejoin].
  SvgStrokeLinejoin? toSvgStrokeLinejoin() {
    return SvgStrokeLinejoin.from(trim().toLowerCase());
  }
}
