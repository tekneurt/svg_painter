import '../../svg_model/_svg_model.dart';
import '../svg_value_extensions/_svg_value_extensions.dart';
import 'svg_painting_context.dart';

/// Resolves the horizontal and vertical radii for elements like `<rect>` and `<ellipse>`.
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
  final double? rxVal = rx.resolveOrNull(context, .horizontal);
  final double? ryVal = ry.resolveOrNull(context, .vertical);

  return switch ((rxVal, ryVal)) {
    (null, null) => (0.0, 0.0),
    (final double r, null) => (r, r),
    (null, final double r) => (r, r),
    (final double x, final double y) => (x, y),
  };
}
