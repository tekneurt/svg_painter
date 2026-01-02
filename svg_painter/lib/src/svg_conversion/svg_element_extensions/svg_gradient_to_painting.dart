import '../../base/_base.dart';
import '../../painting_model/_painting_model.dart';
import '../../svg_model/_svg_model.dart';
import '../converters/svg_painting_context.dart';
import '../svg_value_extensions/svg_color_to_int.dart';
import '../svg_value_extensions/svg_length_percentage_to_double.dart';

extension SvgRadialGradientToPainting on SvgRadialGradient {
  Result<DefineRadialGradient> toPaintCommand(SvgPaintingContext context) {
    if (id == null) {
      return const Failure<DefineRadialGradient>(
        'RadialGradient must have an ID to be referenced.',
      );
    }

    const SvgPaintingContext fractionContext = SvgPaintingContext(
      viewBoxWidth: 1.0,
      viewBoxHeight: 1.0,
    );

    final List<GradientStop> paintStops = stops.map((SvgStop stop) {
      int argb = stop.stopColor.toFillArgb();
      final double opacity = stop.stopOpacity.toDouble(fractionContext, .unit);
      if (opacity < 1.0) {
        int alpha = (argb >> 24) & 0xFF;
        alpha = (alpha * opacity).round().clamp(0, 255);
        argb = (argb & 0x00FFFFFF) | (alpha << 24);
      }
      return GradientStop(
        stop.offset.toDouble(fractionContext, .normalized),
        argb,
      );
    }).toList();

    return Success<DefineRadialGradient>(
      DefineRadialGradient(
        id: id!,
        cx: cx.toDouble(fractionContext, .horizontal),
        cy: cy.toDouble(fractionContext, .vertical),
        radius: r.toDouble(fractionContext, .normalized),
        fx: fx.toDouble(fractionContext, .horizontal),
        fy: fy.toDouble(fractionContext, .vertical),
        focalRadius: fr.toDouble(fractionContext, .normalized),
        stops: paintStops,
        transform: gradientTransform,
      ),
    );
  }
}

extension SvgLinearGradientToPainting on SvgLinearGradient {
  Result<DefineLinearGradient> toPaintCommand(SvgPaintingContext context) {
    if (id == null) {
      return const Failure<DefineLinearGradient>(
        'LinearGradient must have an ID to be referenced.',
      );
    }

    const SvgPaintingContext fractionContext = SvgPaintingContext(
      viewBoxWidth: 1.0,
      viewBoxHeight: 1.0,
    );

    final List<GradientStop> paintStops = stops.map((SvgStop stop) {
      int argb = stop.stopColor.toFillArgb();
      final double opacity = stop.stopOpacity.toDouble(fractionContext, .unit);
      if (opacity < 1.0) {
        int alpha = (argb >> 24) & 0xFF;
        alpha = (alpha * opacity).round().clamp(0, 255);
        argb = (argb & 0x00FFFFFF) | (alpha << 24);
      }
      return GradientStop(
        stop.offset.toDouble(fractionContext, .normalized),
        argb,
      );
    }).toList();

    return Success<DefineLinearGradient>(
      DefineLinearGradient(
        id: id!,
        x1: x1.toDouble(fractionContext, .horizontal),
        y1: y1.toDouble(fractionContext, .vertical),
        x2: x2.toDouble(fractionContext, .horizontal),
        y2: y2.toDouble(fractionContext, .vertical),
        stops: paintStops,
        transform: gradientTransform,
      ),
    );
  }
}
