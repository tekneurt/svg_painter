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
        cx: cx.resolve(context, .horizontal),
        cy: cy.resolve(context, .vertical),
        radius: r.resolve(context, .normalized),
        fx: fx.resolve(context, .horizontal),
        fy: fy.resolve(context, .vertical),
        focalRadius: fr.resolve(context, .normalized),
        stops: stops.map((SvgStop stop) {
          final double offset = stop.offset.resolve(context, .normalized);
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
        x1: x1.resolve(context, .horizontal),
        y1: y1.resolve(context, .vertical),
        x2: x2.resolve(context, .horizontal),
        y2: y2.resolve(context, .vertical),
        stops: stops.map((SvgStop stop) {
          final double offset = stop.offset.resolve(context, .normalized);
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
