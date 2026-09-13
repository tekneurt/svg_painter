import '../../svg_model/_svg_model.dart';

/// Extension on [String] to convert it to an [SvgPaintOrder].
extension ToSvgPaintOrder on String {
  /// Parses the string as an [SvgPaintOrder].
  ///
  /// Supports `normal` or a space/comma-separated list of keywords (`fill`, `stroke`, `markers`).
  /// Any omitted keywords are placed in their default order (`fill`, `stroke`, `markers`)
  /// after the specified keywords.
  SvgPaintOrder? toSvgPaintOrder() {
    final String trimmed = trim().toLowerCase();
    if (trimmed.isEmpty) {
      return null;
    }
    if (trimmed == 'normal') {
      return SvgPaintOrder.normal;
    }

    final List<String> tokens = trimmed.split(RegExp(r'[\s,]+'));
    final components = <SvgPaintOrderComponent>[];
    for (final token in tokens) {
      if (token.isEmpty) {
        continue;
      }
      final SvgPaintOrderComponent? component = SvgPaintOrderComponent.from(token);
      if (component == null) {
        return null;
      }
      if (!components.contains(component)) {
        components.add(component);
      }
    }

    if (components.isEmpty) {
      return null;
    }

    const defaultOrder = <SvgPaintOrderComponent>[
      SvgPaintOrderComponent.fill,
      SvgPaintOrderComponent.stroke,
      SvgPaintOrderComponent.markers,
    ];

    for (final defaultComponent in defaultOrder) {
      if (!components.contains(defaultComponent)) {
        components.add(defaultComponent);
      }
    }

    return SvgPaintOrder(components);
  }
}
