import '../../svg_model/_svg_model.dart';
import '../svg_value_extensions/svg_auto_to_double.dart';
import 'svg_painting_context.dart';

/// Resolves the horizontal and vertical radii for elements like <rect> and <ellipse>.
///
/// Follows SVG rules:
/// 1. If both are 'auto', both are 0.
/// 2. If one is 'auto', it takes the value of the other.
/// 3. If both are values, they use their respective values.
(double, double) resolveRadii(
  SvgLengthPercentageAuto rx,
  SvgLengthPercentageAuto ry,
  SvgPaintingContext context,
) {
  final double? x = rx.resolveOrNull(context, .horizontal);
  final double? y = ry.resolveOrNull(context, .vertical);

  return switch ((x, y)) {
    (null, null) => (0.0, 0.0),
    (null, final double val) => (val, val),
    (final double val, null) => (val, val),
    (final double vx, final double vy) => (vx, vy),
  };
}
