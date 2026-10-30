part of 'painting_style.dart';

/// Enumeration of possible values for font weights in the painting model.
enum PaintingFontWeight {
  /// Thin weight.
  w100,

  /// Extra light weight.
  w200,

  /// Light weight.
  w300,

  /// Normal weight.
  normal,

  /// Alias for normal weight.
  w400,

  /// Medium weight.
  w500,

  /// Semi-bold weight.
  w600,

  /// Bold weight.
  bold,

  /// Alias for bold weight.
  w700,

  /// Extra-bold weight.
  w800,

  /// Black weight.
  w900
  ;

  /// Converts this font weight to its standard string representation.
  String toFlutterString() {
    return switch (this) {
      PaintingFontWeight.w100 => 'FontWeight.w100',
      PaintingFontWeight.w200 => 'FontWeight.w200',
      PaintingFontWeight.w300 => 'FontWeight.w300',
      PaintingFontWeight.normal || PaintingFontWeight.w400 => 'FontWeight.normal',
      PaintingFontWeight.w500 => 'FontWeight.w500',
      PaintingFontWeight.w600 => 'FontWeight.w600',
      PaintingFontWeight.bold || PaintingFontWeight.w700 => 'FontWeight.bold',
      PaintingFontWeight.w800 => 'FontWeight.w800',
      PaintingFontWeight.w900 => 'FontWeight.w900',
    };
  }
}

/// Enumeration of possible values for font styles in the painting model.
enum PaintingFontStyle {
  /// Use the normal font style.
  normal,

  /// Use the italic font style.
  italic
  ;

  /// Converts this font style to its standard string representation.
  String toFlutterString() {
    return switch (this) {
      PaintingFontStyle.normal => 'FontStyle.normal',
      PaintingFontStyle.italic => 'FontStyle.italic',
    };
  }
}

/// Enumeration of possible values for text alignment/anchor in the painting model.
enum PaintingTextAnchor {
  /// The start of the text is aligned to the anchor point.
  start,

  /// The middle of the text is aligned to the anchor point.
  middle,

  /// The end of the text is aligned to the anchor point.
  end,
}

/// Represents the text-specific styling for an SVG element.
@immutable
final class PaintingTextStyle {
  const PaintingTextStyle({
    required this.fontSize,
    required this.fontWeight,
    required this.fontStyle,
    required this.fontFamily,
    this.textAnchor = PaintingTextAnchor.start,
    this.fontPackage,
    this.fontFamilyFallback = const <String>[],
  });

  /// The size of the font in user units.
  final double fontSize;

  /// The weight of the font.
  final PaintingFontWeight fontWeight;

  /// The style of the font.
  final PaintingFontStyle fontStyle;

  /// The family of the font.
  final String fontFamily;

  /// The horizontal alignment / anchor of the text.
  final PaintingTextAnchor textAnchor;

  /// The package containing the font asset, or null if the font is in the app root.
  final String? fontPackage;

  /// The fallback families of the font.
  final List<String> fontFamilyFallback;

  @override
  String toString() {
    final buffer = StringBuffer('PaintingTextStyle(')
      ..write('size: $fontSize, ')
      ..write('weight: $fontWeight, ')
      ..write('style: $fontStyle, ')
      ..write('family: $fontFamily');
    if (textAnchor != PaintingTextAnchor.start) {
      buffer.write(', anchor: $textAnchor');
    }
    if (fontPackage != null) {
      buffer.write(', package: $fontPackage');
    }
    if (fontFamilyFallback.isNotEmpty) {
      buffer.write(', fallback: $fontFamilyFallback');
    }
    buffer.write(')');
    return buffer.toString();
  }
}

/// Represents a node in a hierarchical text structure (TextSpan-like).
@immutable
final class PaintingTextSpan {
  const PaintingTextSpan({
    this.text,
    this.style,
    this.children = const <PaintingTextSpan>[],
  });

  /// The raw text content of this span, or null if it only contains children.
  final String? text;

  /// The visual style applied to this span and its children.
  final PaintingStyle? style;

  /// The child spans contained within this span.
  final List<PaintingTextSpan> children;

  @override
  String toString() {
    return 'PaintingTextSpan(text: $text, children: ${children.length}, style: $style)';
  }
}
