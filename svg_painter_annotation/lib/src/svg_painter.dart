import 'package:meta/meta.dart';

/// Defines which properties are exposed in the generated CustomPainter.
enum SvgExposureMode {
  /// No properties are exposed. The painter is static.
  /// This is the default.
  none,

  /// Only properties for elements with an `id` are exposed (e.g., `myRectFill`).
  id,

  /// Only generic properties are exposed based on color grouping (e.g., `fill1`, `stroke1`).
  indexed,

  /// Both ID-based and indexed properties are exposed.
  /// ID-based properties take precedence for specific elements.
  mixed,
}

/// Annotation to mark a class for SVG code generation.
@immutable
sealed class SvgPainter {
  const SvgPainter({this.painterClassName, this.exposureMode = SvgExposureMode.none});

  /// Creates an annotation from a file path.
  ///
  /// [path] should be the relative path to the SVG file from the package root
  /// or an absolute asset path (e.g., `package:my_package/assets/icon.svg`).
  const factory SvgPainter.file(
    String path, {
    String? painterClassName,
    SvgExposureMode exposureMode,
  }) = SvgFilePainter;

  /// Creates an annotation from raw SVG code.
  ///
  /// [code] should be the valid XML string of the SVG.
  const factory SvgPainter.code(
    String code, {
    String? painterClassName,
    SvgExposureMode exposureMode,
  }) = SvgCodePainter;

  /// The name of the generated CustomPainter class.
  /// If null, the generator will use `$[ClassName]Painter`.
  final String? painterClassName;

  /// The mode for exposing dynamic properties in the generated class.
  final SvgExposureMode exposureMode;
}

/// Annotation for SVG files.
final class SvgFilePainter extends SvgPainter {
  /// Creates a new [SvgFilePainter] instance.
  const SvgFilePainter(
    this.path, {
    super.painterClassName,
    super.exposureMode = SvgExposureMode.none,
  });

  /// The path to the SVG file.
  final String path;
}

/// Annotation for inline SVG code.
final class SvgCodePainter extends SvgPainter {
  /// Creates a new [SvgCodePainter] instance.
  const SvgCodePainter(
    this.code, {
    super.painterClassName,
    super.exposureMode = SvgExposureMode.none,
  });

  /// The SVG code content.
  final String code;
}
