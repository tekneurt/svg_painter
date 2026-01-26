// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:svg_painter_annotation/svg_painter_annotation.dart';

part 'example.g.dart';

/// Example: Generate a CustomPainter from an SVG file.
///
/// 1. Annotate a private class with `@SvgPainter.file()`:
@SvgPainter.file('assets/icons/my_icon.svg')
class _MyIconPainter {}

/// 2. Run `dart run build_runner build`
///
/// 3. Use the generated painter:
/// ```dart
/// CustomPaint(
///   size: const Size(48, 48),
///   painter: MyIconPainter(),
/// )
/// ```

/// Example: Generate from inline SVG code.
@SvgPainter.code('''
<svg viewBox="0 0 100 100">
  <circle cx="50" cy="50" r="40" fill="blue"/>
</svg>
''')
class _CirclePainter {}

/// The generated `CirclePainter` can be used like any CustomPainter:
///
/// ```dart
/// class MyWidget extends StatelessWidget {
///   @override
///   Widget build(BuildContext context) {
///     return CustomPaint(
///       size: const Size(100, 100),
///       painter: CirclePainter(),
///     );
///   }
/// }
/// ```
