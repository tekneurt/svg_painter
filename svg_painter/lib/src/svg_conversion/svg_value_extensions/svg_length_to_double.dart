import '../../svg_model/_svg_model.dart';

extension SvgLengthToValue on SvgLength {
  double toDouble() {
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
    }
  }
}
