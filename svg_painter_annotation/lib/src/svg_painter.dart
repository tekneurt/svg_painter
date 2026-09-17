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

/// Defines how color constants are emitted in the generated code.
enum SvgColorMapping {
  /// Uses Flutter's `Colors.*` constants (e.g., `Colors.red`, `Colors.black`)
  /// when a matching ARGB value exists in Flutter's color palette, falling back
  /// to `const Color(0xAARRGGBB)`. This is the default.
  material,

  /// Strictly emits `const Color(0xAARRGGBB)` for all colors.
  hex,
}

/// Annotation to mark a class for SVG code generation.
@immutable
sealed class SvgPainter {
  const SvgPainter({
    this.painterClassName,
    this.exposureMode = SvgExposureMode.none,
    this.propertyMapping = const <String, String>{},
    this.colorMapping = SvgColorMapping.material,
    this.tokenColors = false,
  });

  /// Creates an annotation from a file path.
  ///
  /// [path] should be the relative path to the SVG file from the package root
  /// or an absolute asset path (e.g., `package:my_package/assets/icon.svg`).
  const factory SvgPainter.file(
    String path, {
    String? painterClassName,
    SvgExposureMode exposureMode,
    Map<String, String> propertyMapping,
    SvgColorMapping colorMapping,
    bool tokenColors,
  }) = SvgFilePainter;

  /// Creates an annotation from raw SVG code.
  ///
  /// [code] should be the valid XML string of the SVG.
  const factory SvgPainter.code(
    String code, {
    String? painterClassName,
    SvgExposureMode exposureMode,
    Map<String, String> propertyMapping,
    SvgColorMapping colorMapping,
    bool tokenColors,
  }) = SvgCodePainter;

  /// The name of the generated CustomPainter class.
  /// If null, the generator will use `$[ClassName]Painter`.
  final String? painterClassName;

  /// The mode for exposing dynamic properties in the generated class.
  final SvgExposureMode exposureMode;

  /// A map to rename generated properties.
  /// Keys are the default generated names (e.g., 'fill1', 'myRectFill'),
  /// and values are the desired names (e.g., 'background', 'logoColor').
  final Map<String, String> propertyMapping;

  /// Defines how color constants are formatted in the generated code.
  final SvgColorMapping colorMapping;

  /// Whether to expose global color tokens (e.g., `red`, `black`) that override
  /// all occurrences of that color across the SVG (fills, strokes, and gradients).
  final bool tokenColors;
}

/// Annotation for SVG files.
final class SvgFilePainter extends SvgPainter {
  /// Creates a new [SvgFilePainter] instance.
  const SvgFilePainter(
    this.path, {
    super.painterClassName,
    super.exposureMode = SvgExposureMode.none,
    super.propertyMapping = const <String, String>{},
    super.colorMapping = SvgColorMapping.material,
    super.tokenColors = false,
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
    super.propertyMapping = const <String, String>{},
    super.colorMapping = SvgColorMapping.material,
    super.tokenColors = false,
  });

  /// The SVG code content.
  final String code;
}
