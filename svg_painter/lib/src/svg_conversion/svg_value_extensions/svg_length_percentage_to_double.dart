import '../../svg_model/_svg_model.dart';
import '_svg_value_extensions.dart';

extension SvgLengthPercentageToValue on SvgLengthPercentage {
  double toDouble() {
    final SvgLengthPercentage self = this;
    return switch (self) {
      SvgLength() => self.toDouble(),
      SvgPercentage() => self.toDouble(),
    };
  }
}
