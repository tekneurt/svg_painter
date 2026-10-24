part of '../../svg_element.dart';

/// Base class for all filter primitive elements inside an [SvgFilter].
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element#filter_primitive_elements
@immutable
sealed class SvgFilterPrimitive extends SvgElement {
  const SvgFilterPrimitive({
    this.inSource,
    this.result,
    super.coreAttributes,
  });

  /// The input for this filter primitive (e.g. SourceGraphic, SourceAlpha, or result name).
  final String? inSource;

  /// The assigned name for this filter primitive's result.
  final String? result;
}
