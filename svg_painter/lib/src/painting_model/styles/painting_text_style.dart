part of 'painting_style.dart';

/// Represents the text style for an SVG element.
@immutable
final class PaintingTextStyle {
  const PaintingTextStyle({
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.fontFamily,
  });

  /// The size of the font.
  final double? fontSize;

  /// The weight of the font (e.g., 'bold').
  final String? fontWeight;

  /// The style of the font (e.g., 'italic').
  final String? fontStyle;

  /// The family of the font.
  final String? fontFamily;

  @override
  String toString() => 'PaintingTextStyle($fontStyle $fontWeight $fontSize $fontFamily)';
}
