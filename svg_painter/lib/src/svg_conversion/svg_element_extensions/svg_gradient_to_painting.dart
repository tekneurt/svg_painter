import '../../base/_base.dart';
import '../../painting_model/_painting_model.dart';
import '../../svg_model/_svg_model.dart';
import '../converters/svg_painting_context.dart';
import '../svg_value_extensions/_svg_value_extensions.dart';

extension SvgRadialGradientToPaintCommand on SvgRadialGradient {
  /// Converts this [SvgRadialGradient] to a [DefineRadialGradient] command.
  Result<DefineRadialGradient> toPaintCommand(SvgPaintingContext context) {
    return Success<DefineRadialGradient>(
      DefineRadialGradient(
        id: id!,
        cx: cx.resolve(context, .unit),
        cy: cy.resolve(context, .unit),
        radius: r.resolve(context, .unit),
        fx: fx.resolve(context, .unit),
        fy: fy.resolve(context, .unit),
        focalRadius: fr.resolve(context, .unit),
        stops: stops.map((SvgStop stop) {
          final double offset = stop.offset.resolve(context, .unit);
          final int baseColor = stop.stopColor.toFillArgb();
          final double opacity = stop.stopOpacity.resolve(context, .unit);
          final int alpha = (((baseColor >> 24) & 0xFF) * opacity).round().clamp(0, 255);
          final int finalColor = (baseColor & 0x00FFFFFF) | (alpha << 24);
          return GradientStop(offset, finalColor);
        }).toList(),
        transform: gradientTransform,
      ),
    );
  }
}

extension SvgLinearGradientToPaintCommand on SvgLinearGradient {
  /// Converts this [SvgLinearGradient] to a [DefineLinearGradient] command.
  Result<DefineLinearGradient> toPaintCommand(SvgPaintingContext context) {
    return Success<DefineLinearGradient>(
      DefineLinearGradient(
        id: id!,
        x1: x1.resolve(context, .unit),
        y1: y1.resolve(context, .unit),
        x2: x2.resolve(context, .unit),
        y2: y2.resolve(context, .unit),
        stops: stops.map((SvgStop stop) {
          final double offset = stop.offset.resolve(context, .unit);
          final int baseColor = stop.stopColor.toFillArgb();
          final double opacity = stop.stopOpacity.resolve(context, .unit);
          final int alpha = (((baseColor >> 24) & 0xFF) * opacity).round().clamp(0, 255);
          final int finalColor = (baseColor & 0x00FFFFFF) | (alpha << 24);
          return GradientStop(offset, finalColor);
        }).toList(),
        transform: gradientTransform,
      ),
    );
  }
}
