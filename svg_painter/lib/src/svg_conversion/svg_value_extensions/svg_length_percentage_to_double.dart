import '../../svg_model/_svg_model.dart';
import '../converters/svg_painting_context.dart';
import 'svg_length_to_double.dart';
import 'svg_percentage_to_double.dart';

extension SvgLengthPercentageToDouble on SvgLengthPercentage {
  double resolve(SvgPaintingContext context, SvgOrientation orientation) {
    final SvgLengthPercentage self = this;
    return switch (self) {
      final SvgLength length => length.toDouble(context),
      final SvgPercentage percentage => percentage.resolve(context, orientation),
    };
  }

  double toPosition(SvgPaintingContext context, SvgOrientation orientation) {
    return resolve(context, orientation);
  }
}
