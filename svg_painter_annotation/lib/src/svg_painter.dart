import 'package:meta/meta.dart';

/// Annotation to mark a class for SVG code generation.
@immutable
sealed class SvgPainter {
  const SvgPainter({this.painterClassName});

  /// Creates an annotation from a file path.
  ///
  /// [path] should be the relative path to the SVG file from the package root
  /// or an absolute asset path (e.g., `package:my_package/assets/icon.svg`).
  const factory SvgPainter.file(String path, {String? painterClassName}) = SvgFilePainter;

  /// Creates an annotation from raw SVG code.
  ///
  /// [code] should be the valid XML string of the SVG.
  const factory SvgPainter.code(String code, {String? painterClassName}) = SvgCodePainter;

  /// The name of the generated CustomPainter class.
  /// If null, the generator will use `$[ClassName]Painter`.
  final String? painterClassName;
}

/// Annotation for SVG files.
final class SvgFilePainter extends SvgPainter {
  /// Creates a new [SvgFilePainter] instance.
  const SvgFilePainter(this.path, {super.painterClassName});

  /// The path to the SVG file.
  final String path;
}

/// Annotation for inline SVG code.
final class SvgCodePainter extends SvgPainter {
  /// Creates a new [SvgCodePainter] instance.
  const SvgCodePainter(this.code, {super.painterClassName});

  /// The SVG code content.
  final String code;
}
