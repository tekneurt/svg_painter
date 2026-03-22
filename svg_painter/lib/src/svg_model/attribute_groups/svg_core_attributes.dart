import 'package:meta/meta.dart';

/// Represents the global/core attributes shared by all SVG elements.
@immutable
final class SvgCoreAttributes {
  const SvgCoreAttributes({this.id, this.cssClass, this.inlineStyle});

  /// The unique identifier of the element (mapped from `id` attribute).
  final String? id;

  /// The CSS class(es) of the element (mapped from `class` attribute).
  final String? cssClass;

  /// Inline CSS style rules for the element (mapped from `style` attribute).
  final String? inlineStyle;

  @override
  String toString() {
    final parts = <String>[
      if (id != null) 'id: $id',
      if (cssClass != null) 'class: $cssClass',
      if (inlineStyle != null) 'style: $inlineStyle',
    ];
    return 'SvgCoreAttributes(${parts.join(', ')})';
  }
}
