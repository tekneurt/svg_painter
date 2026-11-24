part of '../svg_value.dart';

/// Specifies whether an element is visible.
///
/// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/visibility
enum SvgVisibility with SvgBaseValue {
  /// The element is visible and painted.
  visible('visible'),

  /// The element is invisible (not painted), but still takes up space in layout.
  hidden('hidden'),

  /// Equal to [hidden] for SVG elements.
  collapse('collapse')
  ;

  const SvgVisibility(this.value);

  /// The string value as it appears in SVG XML.
  final String value;

  /// Whether this visibility value causes the element to be rendered.
  bool get isRendered {
    if (this == SvgVisibility.hidden || this == SvgVisibility.collapse) {
      return false;
    } else {
      return true;
    }
  }

  /// Parses a string into an [SvgVisibility], or returns null if unknown.
  static SvgVisibility? from(String? value) {
    if (value == null) {
      return null;
    }
    final String normalized = value.trim().toLowerCase();
    for (final SvgVisibility visibility in SvgVisibility.values) {
      if (visibility.value == normalized) {
        return visibility;
      }
    }
    return null;
  }
}
