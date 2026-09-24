import 'dart:io';

import 'package:path/path.dart' as p;

import '../base/result.dart';

/// Font definition entry for pubspec.yaml generation.
final class FontAssetDefinition {
  const FontAssetDefinition({
    required this.assetPath,
    this.weight,
    this.style,
  });

  final String assetPath;
  final int? weight;
  final String? style;
}

/// Utility for discovering, exporting bundled SVG fonts, and generating pubspec configuration.
class AssetExporter {
  const AssetExporter({this.packageAssetsDir});

  /// The root directory of bundled assets within `svg_painter`.
  /// Defaults to resolving `assets/fonts` relative to the package location.
  final Directory? packageAssetsDir;

  /// Bundled font families supported by `svg_painter`.
  static const Set<String> bundledFamilies = <String>{
    'Roboto',
    'Tinos',
    'Noto Serif',
    'Roboto Mono',
  };

  /// Maps font family name to its subdirectory in `assets/fonts/`.
  static String familyToDirectoryName(String family) {
    return switch (family) {
      'Roboto' => 'roboto',
      'Tinos' => 'tinos',
      'Noto Serif' => 'noto_serif',
      'Roboto Mono' => 'roboto_mono',
      _ => family.toLowerCase().replaceAll(' ', '_'),
    };
  }

  /// Locates the package font source directory for a given [family].
  Directory resolveFontSourceDir(String family) {
    final String dirName = familyToDirectoryName(family);
    if (packageAssetsDir != null) {
      return Directory(p.join(packageAssetsDir!.path, dirName));
    } else {
      return Directory(p.join('assets', 'fonts', dirName));
    }
  }

  /// Exports the font files for [families] to [destinationDir].
  ///
  /// If [families] is null or empty, all [bundledFamilies] are exported.
  /// Returns a [Result] with the list of copied [File]s or a [Failure].
  Result<List<File>> exportFonts({
    required Directory destinationDir,
    Set<String>? families,
  }) {
    final Set<String> targetFamilies = (families == null || families.isEmpty)
        ? bundledFamilies
        : families;

    final copiedFiles = <File>[];

    for (final family in targetFamilies) {
      final Directory sourceDir = resolveFontSourceDir(family);
      if (sourceDir.existsSync()) {
        final familyDestDir = Directory(
          p.join(destinationDir.path, familyToDirectoryName(family)),
        );
        if (!familyDestDir.existsSync()) {
          familyDestDir.createSync(recursive: true);
        }

        final List<FileSystemEntity> entities = sourceDir.listSync();
        for (final entity in entities) {
          if (entity is File && entity.path.endsWith('.ttf')) {
            final String fileName = p.basename(entity.path);
            final String destPath = p.join(familyDestDir.path, fileName);
            final File copiedFile = entity.copySync(destPath);
            copiedFiles.add(copiedFile);
          }
        }
      } else {
        return Failure<List<File>>(
          'Source directory for font family "$family" does not exist at: ${sourceDir.path}',
        );
      }
    }

    return Success<List<File>>(copiedFiles);
  }

  /// Generates the YAML declaration snippet suitable for pasting into `pubspec.yaml`
  /// under `flutter: fonts:`.
  ///
  /// [assetPrefix] defaults to `assets/fonts`.
  String generatePubspecFontSnippet(
    Set<String> families, {
    String assetPrefix = 'assets/fonts',
  }) {
    final buffer = StringBuffer();
    buffer.writeln('flutter:');
    buffer.writeln('  fonts:');

    final List<String> sortedFamilies = families.toList()..sort();
    for (final family in sortedFamilies) {
      final String subDir = familyToDirectoryName(family);
      final Directory sourceDir = resolveFontSourceDir(family);

      buffer.writeln('    - family: $family');
      buffer.writeln('      fonts:');

      if (sourceDir.existsSync()) {
        final List<File> fontFiles = sourceDir
            .listSync()
            .whereType<File>()
            .where((File f) => f.path.endsWith('.ttf'))
            .toList()
          ..sort((File a, File b) => a.path.compareTo(b.path));

        for (final file in fontFiles) {
          final String fileName = p.basename(file.path);
          buffer.writeln('        - asset: $assetPrefix/$subDir/$fileName');

          final FontAssetDefinition def = _parseFontAsset(fileName);
          if (def.weight != null) {
            buffer.writeln('          weight: ${def.weight}');
          }
          if (def.style != null) {
            buffer.writeln('          style: ${def.style}');
          }
        }
      } else {
        // Fallback standard entry when source files cannot be inspected directly
        buffer.writeln('        - asset: $assetPrefix/$subDir/${subDir}_400.ttf');
      }
    }

    return buffer.toString();
  }

  static FontAssetDefinition _parseFontAsset(String fileName) {
    final String nameWithoutExt = p.basenameWithoutExtension(fileName);
    final List<String> parts = nameWithoutExt.split('_');

    int? weight;
    String? style;

    for (final part in parts) {
      final int? parsedWeight = int.tryParse(part);
      if (parsedWeight != null && parsedWeight >= 100 && parsedWeight <= 900) {
        weight = parsedWeight;
      } else if (part == 'italic') {
        style = 'italic';
      }
    }

    return FontAssetDefinition(
      assetPath: fileName,
      weight: weight,
      style: style,
    );
  }
}
