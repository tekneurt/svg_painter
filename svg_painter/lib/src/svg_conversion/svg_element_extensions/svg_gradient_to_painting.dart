import '../../base/_base.dart';
import '../../painting_model/_painting_model.dart';
import '../../svg_model/_svg_model.dart';
import '../converters/svg_painting_context.dart';
import '../svg_value_extensions/svg_color_to_int.dart';
import '../svg_value_extensions/svg_length_percentage_to_double.dart';
import '../svg_value_extensions/svg_percentage_to_double.dart';

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
      return GradientStop(
        stop.offset.toDouble(fractionContext, SvgOrientation.normalized),
        stop.stopColor.toFillArgb(), // stop-color defaults to black
      );
    }).toList();

    return Success<DefineRadialGradient>(
      DefineRadialGradient(
        id: id!,
        cx: cx.toDouble(fractionContext, SvgOrientation.horizontal),
        cy: cy.toDouble(fractionContext, SvgOrientation.vertical),
        radius: r.toDouble(fractionContext, SvgOrientation.normalized),
        fx: fx.toDouble(fractionContext, SvgOrientation.horizontal),
        fy: fy.toDouble(fractionContext, SvgOrientation.vertical),
        focalRadius: fr.toDouble(fractionContext, SvgOrientation.normalized),
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
      return GradientStop(
        stop.offset.toDouble(fractionContext, SvgOrientation.normalized),
        stop.stopColor.toFillArgb(),
      );
    }).toList();

    return Success<DefineLinearGradient>(
      DefineLinearGradient(
        id: id!,
        x1: x1.toDouble(fractionContext, SvgOrientation.horizontal),
        y1: y1.toDouble(fractionContext, SvgOrientation.vertical),
        x2: x2.toDouble(fractionContext, SvgOrientation.horizontal),
        y2: y2.toDouble(fractionContext, SvgOrientation.vertical),
        stops: paintStops,
        transform: gradientTransform,
      ),
    );
  }
}
