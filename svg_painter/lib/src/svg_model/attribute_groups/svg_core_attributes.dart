import 'package:meta/meta.dart';

/// Represents the global/core attributes shared by all SVG elements.
@immutable
final class SvgCoreAttributes {
  const SvgCoreAttributes({
    this.id,
    this.cssClass,
    this.inlineStyle,
    this.systemLanguage,
    this.requiredExtensions,
    this.requiredFeatures,
  });

  /// The unique identifier of the element (mapped from `id` attribute).
  final String? id;

  /// The CSS class(es) of the element (mapped from `class` attribute).
  final String? cssClass;

  /// Inline CSS style rules for the element (mapped from `style` attribute).
  final String? inlineStyle;

  /// A list of supported language tags for conditional processing.
  final List<String>? systemLanguage;

  /// A list of required language extensions for conditional processing.
  final List<String>? requiredExtensions;

  /// A list of required SVG features for conditional processing.
  final List<String>? requiredFeatures;

  @override
  String toString() {
    final parts = <String>[
      if (id != null) 'id: $id',
      if (cssClass != null) 'class: $cssClass',
      if (inlineStyle != null) 'style: $inlineStyle',
      if (systemLanguage != null) 'systemLanguage: $systemLanguage',
      if (requiredExtensions != null) 'requiredExtensions: $requiredExtensions',
      if (requiredFeatures != null) 'requiredFeatures: $requiredFeatures',
    ];
    return 'SvgCoreAttributes(${parts.join(', ')})';
  }
}
