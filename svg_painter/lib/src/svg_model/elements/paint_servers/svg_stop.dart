part of '../../svg_element.dart';

/// Represents a `<stop>` element within a gradient.
@immutable
final class SvgStop extends SvgDefinitionElement {
  const SvgStop({
    required this.offset,
    required this.stopColor,
    required this.stopOpacity,
    super.coreAttributes,
  });

  /// The location of the color stop (length or percentage).
  final SvgLengthPercentage offset;

  /// The color of the stop.
  final SvgColor stopColor;

  /// The opacity of the stop (0.0 to 1.0).
  final SvgLengthPercentage stopOpacity;

  @override
  String toString() => 'SvgStop(offset: $offset, color: $stopColor, id: $id)';
}
