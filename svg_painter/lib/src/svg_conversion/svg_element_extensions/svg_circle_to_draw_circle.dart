import '../../base/_base.dart';
import '../../painting_model/_painting_model.dart';
import '../../svg_model/_svg_model.dart';
import '../svg_value_extensions/svg_length_percentage_to_double.dart';

/// Extension to convert [SvgCircle] to [DrawCircle].
extension SvgCircleToPainting on SvgCircle {
  /// Converts this [SvgCircle] to a [DrawCircle].
  Result<DrawCircle> toDrawCircle() {
    return Success<DrawCircle>(
      DrawCircle(cx: cx.toDouble(), cy: cy.toDouble(), radius: r.toDouble(), colorHex: 0xFF000000),
    );
  }
}
