import 'dart:io';

import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/generation/asset_exporter.dart';

void main(List<String> args) {
  if (args.contains('--help') || args.contains('-h')) {
    stdout.writeln('svg_painter Asset Exporter');
    stdout.writeln();
    stdout.writeln('Exports bundled SVG fonts (Roboto, Noto Serif, Roboto Mono) to your project.');
    stdout.writeln();
    stdout.writeln('Usage: dart run svg_painter:export_assets [destination_directory]');
    stdout.writeln('Default destination: assets/fonts');
    return;
  }

  final String targetPath = args.isNotEmpty ? args.first : 'assets/fonts';
  final destDir = Directory(targetPath);

  stdout.writeln('Exporting bundled fonts to ${destDir.path}...');
  const exporter = AssetExporter();
  final Result<List<File>> result = exporter.exportFonts(destinationDir: destDir);

  result.fold(
    (Failure<List<File>> failure) {
      stderr.writeln('Error exporting fonts: ${failure.message}');
      exit(1);
    },
    (List<File> files) {
      stdout.writeln('Successfully exported ${files.length} font files.');
      stdout.writeln();
      stdout.writeln('Add the following to your pubspec.yaml:');
      stdout.writeln('----------------------------------------');
      stdout.write(exporter.generatePubspecFontSnippet(AssetExporter.bundledFamilies, assetPrefix: targetPath));
      stdout.writeln('----------------------------------------');
    },
  );
}
