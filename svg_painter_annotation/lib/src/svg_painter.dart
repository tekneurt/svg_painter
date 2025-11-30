/// Annotation to generate a CustomPainter from an SVG.
///
/// Use either [filePath] to reference an external SVG file,
/// or [code] to provide inline SVG content. Exactly one must be provided.
///
/// Example with file path:
/// ```dart
/// @SvgPainter(filePath: 'assets/icon.svg')
/// class MyIcon extends _$MyIcon {}
/// ```
///
/// Example with inline SVG:
/// ```dart
/// @SvgPainter(code: '<svg viewBox="0 0 100 100"><circle cx="50" cy="50" r="40"/></svg>')
/// class MyCircle extends _$MyCircle {}
/// ```
class SvgPainter {
  /// Creates an [SvgPainter] annotation.
  ///
  /// Exactly one of [filePath] or [code] must be provided.
  const SvgPainter({this.filePath, this.code})
      : assert(
          (filePath != null) || (code != null),
          'Either filePath or code must be provided',
        ),
        assert(
          (filePath == null) || (code == null),
          'Only one of filePath or code can be provided',
        );

  /// Path to the SVG file, relative to the annotated file.
  final String? filePath;

  /// Inline SVG content.
  final String? code;
}
