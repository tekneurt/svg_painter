import 'package:meta/meta.dart';

import 'svg_value.dart';

part 'elements/svg_circle.dart';
part 'elements/svg_svg.dart';

/// The base class for all SVG elements in the domain model.
@immutable
sealed class SvgElement {
  const SvgElement();
}
