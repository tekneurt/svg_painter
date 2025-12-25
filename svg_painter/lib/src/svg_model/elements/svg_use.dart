part of '../svg_element.dart';

/// Represents a <use> element in SVG.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/use
@immutable
final class SvgUse extends SvgGraphicsElement {
  const SvgUse({
    required this.href,
    required this.x,
    required this.y,
    required this.width,
    required this.height,
    super.id,
    super.fill,
    super.stroke,
    super.strokeWidth,
    super.strokeLinecap,
    super.strokeLinejoin,
    super.opacity,
    super.transform,
  });

  /// The URI reference to the element to be cloned.
  final String href;

  /// The x-axis coordinate of the element.
  final SvgLengthPercentage x;

  /// The y-axis coordinate of the element.
  final SvgLengthPercentage y;

  /// The width of the element.
  final SvgLengthPercentageAuto width;

  /// The height of the element.
  final SvgLengthPercentageAuto height;
}
