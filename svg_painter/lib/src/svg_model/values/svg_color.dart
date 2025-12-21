part of '../svg_value.dart';

/// Represents a color in SVG.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/CSS/color_value
@immutable
sealed class SvgColor extends SvgValue with SvgBaseValue {
  const SvgColor();
}
