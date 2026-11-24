import 'package:meta/meta.dart';

/// Defines ambient theme values for SVG code generation.
///
/// Used to resolve relative font units such as `em` and `ex` when no explicit
/// `font-size` attribute is specified in the SVG hierarchy.
@immutable
class SvgTheme {
  /// Creates an [SvgTheme] configuration.
  const SvgTheme({
    this.fontSize = 16.0,
    this.xHeight,
  });

  /// The default font size in logical pixels used to resolve `em` units
  /// when no `font-size` attribute is inherited in the SVG tree.
  ///
  /// Defaults to 16.0, which conforms to the W3C SVG/CSS `medium` standard.
  final double fontSize;

  /// The default x-height in logical pixels used to resolve `ex` units.
  ///
  /// If null, defaults to `fontSize * 0.5` per CSS/W3C guidelines.
  final double? xHeight;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    return other is SvgTheme && other.fontSize == fontSize && other.xHeight == xHeight;
  }

  @override
  int get hashCode => Object.hash(fontSize, xHeight);

  @override
  String toString() => 'SvgTheme(fontSize: $fontSize, xHeight: $xHeight)';
}
