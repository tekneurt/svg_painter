import 'package:meta/meta.dart';

part 'elements/svg_circle.dart';
part 'elements/svg_root.dart';

/// The base class for all SVG elements in the domain model.
@immutable
sealed class SvgElement {
  const SvgElement();
}
