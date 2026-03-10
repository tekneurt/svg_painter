part of 'painting_style.dart';

/// Enumeration of possible values for font weights.
enum PaintingFontWeight {
  /// Normal font weight (400).
  normal,

  /// Bold font weight (700).
  bold,

  /// Specific numeric weight (100-900).
  w100,
  w200,
  w300,
  w400,
  w500,
  w600,
  w700,
  w800,
  w900;

  /// Returns the Flutter-compatible string for this weight.
  String toFlutterString() {
    return switch (this) {
      PaintingFontWeight.normal || PaintingFontWeight.w400 => 'FontWeight.normal',
      PaintingFontWeight.bold || PaintingFontWeight.w700 => 'FontWeight.bold',
      PaintingFontWeight.w100 => 'FontWeight.w100',
      PaintingFontWeight.w200 => 'FontWeight.w200',
      PaintingFontWeight.w300 => 'FontWeight.w300',
      PaintingFontWeight.w500 => 'FontWeight.w500',
      PaintingFontWeight.w600 => 'FontWeight.w600',
      PaintingFontWeight.w800 => 'FontWeight.w800',
      PaintingFontWeight.w900 => 'FontWeight.w900',
    };
  }
}

/// Enumeration of possible values for font styles.
enum PaintingFontStyle {
  /// Normal (upright) font style.
  normal,

  /// Italic font style.
  italic;

  /// Returns the Flutter-compatible string for this style.
  String toFlutterString() {
    return switch (this) {
      PaintingFontStyle.normal => 'FontStyle.normal',
      PaintingFontStyle.italic => 'FontStyle.italic',
    };
  }
}

/// Represents the text style for an SVG element.
@immutable
final class PaintingTextStyle {
  const PaintingTextStyle({
    required this.fontSize,
    required this.fontWeight,
    required this.fontStyle,
    required this.fontFamily,
  });

  /// The size of the font.
  final double fontSize;

  /// The weight of the font.
  final PaintingFontWeight fontWeight;

  /// The style of the font (e.g., 'italic').
  final PaintingFontStyle fontStyle;

  /// The family of the font.
  final String fontFamily;

  @override
  String toString() =>
      'PaintingTextStyle(size: $fontSize, weight: $fontWeight, style: $fontStyle, family: $fontFamily)';
}
