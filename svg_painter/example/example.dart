import 'package:svg_painter_annotation/svg_painter_annotation.dart';

part 'example.g.dart';

/// Example: Generate a CustomPainter from inline SVG code.
///
/// 1. Annotate a class with `@SvgPainter.code()`:
@SvgPainter.code('''
<svg viewBox="0 0 100 100">
  <circle cx="50" cy="50" r="40" fill="blue"/>
</svg>
''')
class _CirclePainter {}

/// 2. Run `dart run build_runner build`
///
/// 3. Use the generated painter in a Flutter app:
/// ```dart
/// CustomPaint(
///   size: const Size(100, 100),
///   painter: CirclePainter(),
/// )
/// ```

/// You can also use `@SvgPainter.file()` for SVG files:
/// ```dart
/// @SvgPainter.file('assets/icons/star.svg')
/// class _StarPainter {}
/// ```
