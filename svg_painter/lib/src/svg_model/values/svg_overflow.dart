part of '../svg_value.dart';

/// Specifies whether content of a block-level element is clipped when it overflows the element's box.
///
/// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/overflow
enum SvgOverflow with SvgBaseValue {
  /// The overflow content is not clipped and may be rendered outside the element's box.
  visible('visible'),

  /// The overflow content is clipped and the rest of the content will be invisible.
  hidden('hidden'),

  /// In SVG, behaves the same as [hidden].
  scroll('scroll'),

  /// In SVG, behaves the same as [hidden].
  auto('auto'),
  ;

  const SvgOverflow(this.value);

  /// The string value as it appears in SVG XML.
  final String value;

  /// Whether this overflow value causes content to be clipped to the viewport.
  bool get isClipped {
    if (this == SvgOverflow.visible || this == SvgOverflow.auto) {
      return false;
    } else {
      return true;
    }
  }

  /// Parses a string into an [SvgOverflow], or returns null if unknown.
  static SvgOverflow? from(String? value) {
    if (value == null) {
      return null;
    }
    final String normalized = value.trim().toLowerCase();
    for (final SvgOverflow overflow in SvgOverflow.values) {
      if (overflow.value == normalized) {
        return overflow;
      }
    }
    return null;
  }
}
