import '../../svg_model/_svg_model.dart';
import '../converters/svg_painting_context.dart';
import 'svg_length_to_double.dart';
import 'svg_percentage_to_double.dart';

extension SvgLengthPercentageToValue on SvgLengthPercentage {
  double toDouble(SvgPaintingContext context, SvgOrientation orientation) {
    final SvgLengthPercentage self = this;
    return switch (self) {
      final SvgLength length => length.toDouble(),
      final SvgPercentage percentage => percentage.toDouble(context, orientation),
    };
  }
}
