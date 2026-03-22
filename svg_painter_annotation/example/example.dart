import 'package:svg_painter_annotation/svg_painter_annotation.dart';

/// Example showing how to use the `@SvgPainter` annotation.
///
/// ## From an SVG file:
/// ```dart
/// @SvgPainter.file('assets/icons/star.svg')
/// class _StarPainter {}
/// ```
///
/// ## From inline SVG code:
/// ```dart
/// @SvgPainter.code('<svg viewBox="0 0 24 24"><circle cx="12" cy="12" r="10"/></svg>')
/// class _DotPainter {}
/// ```
///
/// Then run: `dart run build_runner build`
///
/// The generated `StarPainter` and `DotPainter` classes extend Flutter's `CustomPainter`.
///
/// See the `svg_painter` package documentation for complete usage examples.
void main() {
  // Demonstrate the annotation constructors
  // ignore: unused_local_variable
  const fileBased = SvgPainter.file('assets/icon.svg');
  // ignore: unused_local_variable
  const codeBased = SvgPainter.code('<svg></svg>');
}
