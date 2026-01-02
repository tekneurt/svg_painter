import 'dart:math';
import '../../svg_model/_svg_model.dart';
import '../converters/svg_painting_context.dart';

extension SvgLengthToDouble on SvgLength {
  double toDouble([SvgPaintingContext? context]) {
    const double dpi = 96.0;

    switch (unit) {
      case .none:
      case .px:
        return value;
      case .inUnit:
        return value * dpi;
      case .cm:
        return value * dpi / 2.54;
      case .mm:
        return value * dpi / 2.54 / 10;
      case .q:
        return value * dpi / 2.54 / 40;
      case .pc:
        return value * dpi / 6.0;
      case .pt:
        return value * dpi / 72.0;
      case .vw:
        return value * (context?.viewBoxWidth ?? 100.0) / 100.0;
      case .vh:
        return value * (context?.viewBoxHeight ?? 100.0) / 100.0;
      case .vmin:
        final double w = context?.viewBoxWidth ?? 100.0;
        final double h = context?.viewBoxHeight ?? 100.0;
        return value * min(w, h) / 100.0;
      case .vmax:
        final double w = context?.viewBoxWidth ?? 100.0;
        final double h = context?.viewBoxHeight ?? 100.0;
        return value * max(w, h) / 100.0;
    }
  }
}
