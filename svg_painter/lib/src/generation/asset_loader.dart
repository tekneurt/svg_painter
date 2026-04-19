import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import '../base/result.dart';

/// Helper class to load SVG content from annotations.
class AssetLoader {
  const AssetLoader({
    required this.fileChecker,
    required this.codeChecker,
  });

  /// Checker for SvgFilePainter.
  final TypeChecker fileChecker;

  /// Checker for SvgCodePainter.
  final TypeChecker codeChecker;

  /// Loads SVG content from the given annotation.
  Future<Result<String>> loadSvgContent(
    ConstantReader annotation,
    BuildStep buildStep,
  ) async {
    final DartType? type = annotation.objectValue.type;
    if (type == null) {
      return const Failure<String>('Annotation object has no type.');
    }

    if (fileChecker.isExactlyType(type)) {
      return loadFromFile(annotation, buildStep);
    } else if (codeChecker.isExactlyType(type)) {
      return Success<String>(annotation.read('code').stringValue);
    }

    return const Failure<String>(
      'Unknown SvgPainter type. Must be SvgFilePainter or SvgCodePainter.',
    );
  }

  /// Loads SVG content from a file asset.
  Future<Result<String>> loadFromFile(
    ConstantReader annotation,
    BuildStep buildStep,
  ) async {
    final String path = annotation.read('path').stringValue;
    if (!path.startsWith('package:')) {
      return const Failure<String>('Only package: URIs are supported for file assets.');
    }

    final Uri uri = Uri.parse(path);
    final assetId = AssetId(
      uri.pathSegments.first,
      'lib/${uri.pathSegments.skip(1).join('/')}',
    );

    try {
      final String content = await buildStep.readAsString(assetId);
      return Success<String>(content);
    } catch (e) {
      return Failure<String>('Failed to read asset $path: $e');
    }
  }
}
