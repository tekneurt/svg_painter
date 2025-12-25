import '../../svg_model/_svg_model.dart';

extension StringToStrokeLinecap on String {
  /// Converts this string to an [SvgStrokeLinecap].
  SvgStrokeLinecap? toSvgStrokeLinecap() {
    return SvgStrokeLinecap.from(trim().toLowerCase());
  }
}
