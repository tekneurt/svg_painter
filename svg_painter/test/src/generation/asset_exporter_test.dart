import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/generation/asset_exporter.dart';
import 'package:test/test.dart';

void main() {
  group('AssetExporter', () {
    late Directory tempSourceDir;
    late Directory tempDestDir;

    setUp(() {
      tempSourceDir = Directory.systemTemp.createTempSync('svg_font_source_test_');
      tempDestDir = Directory.systemTemp.createTempSync('svg_font_dest_test_');

      // Populate dummy font files in source directory
      final robotoDir = Directory(p.join(tempSourceDir.path, 'roboto'))..createSync();
      File(p.join(robotoDir.path, 'roboto_400.ttf')).writeAsStringSync('dummy roboto 400');
      File(p.join(robotoDir.path, 'roboto_700_italic.ttf')).writeAsStringSync('dummy roboto 700 italic');

      final tinosDir = Directory(p.join(tempSourceDir.path, 'tinos'))..createSync();
      File(p.join(tinosDir.path, 'tinos_400.ttf')).writeAsStringSync('dummy tinos 400');

      final notoDir = Directory(p.join(tempSourceDir.path, 'noto_serif'))..createSync();
      File(p.join(notoDir.path, 'noto_serif_500.ttf')).writeAsStringSync('dummy noto 500');

      final monoDir = Directory(p.join(tempSourceDir.path, 'roboto_mono'))..createSync();
      File(p.join(monoDir.path, 'roboto_mono_300.ttf')).writeAsStringSync('dummy mono 300');
    });

    tearDown(() {
      if (tempSourceDir.existsSync()) {
        tempSourceDir.deleteSync(recursive: true);
      }
      if (tempDestDir.existsSync()) {
        tempDestDir.deleteSync(recursive: true);
      }
    });

    test('should map family name to snake_case directory name', () {
      // Arrange & Act & Assert
      expect(AssetExporter.familyToDirectoryName('Roboto'), equals('roboto'));
      expect(AssetExporter.familyToDirectoryName('Tinos'), equals('tinos'));
      expect(AssetExporter.familyToDirectoryName('Noto Serif'), equals('noto_serif'));
      expect(AssetExporter.familyToDirectoryName('Roboto Mono'), equals('roboto_mono'));
      expect(AssetExporter.familyToDirectoryName('Custom Display Font'), equals('custom_display_font'));
    });

    test('should export all bundled fonts when no specific families are requested', () {
      // Arrange
      final exporter = AssetExporter(packageAssetsDir: tempSourceDir);

      // Act
      final Result<List<File>> result = exporter.exportFonts(destinationDir: tempDestDir);

      // Assert
      expect(result, isA<Success<List<File>>>());
      final List<File> files = (result as Success<List<File>>).value;
      expect(files.length, equals(5));

      final robotoFile = File(p.join(tempDestDir.path, 'roboto', 'roboto_400.ttf'));
      final robotoBoldFile = File(p.join(tempDestDir.path, 'roboto', 'roboto_700_italic.ttf'));
      final tinosFile = File(p.join(tempDestDir.path, 'tinos', 'tinos_400.ttf'));
      final notoFile = File(p.join(tempDestDir.path, 'noto_serif', 'noto_serif_500.ttf'));
      final monoFile = File(p.join(tempDestDir.path, 'roboto_mono', 'roboto_mono_300.ttf'));

      expect(robotoFile.existsSync(), isTrue);
      expect(robotoBoldFile.existsSync(), isTrue);
      expect(tinosFile.existsSync(), isTrue);
      expect(notoFile.existsSync(), isTrue);
      expect(monoFile.existsSync(), isTrue);
    });

    test('should export only requested families when subset is specified', () {
      // Arrange
      final exporter = AssetExporter(packageAssetsDir: tempSourceDir);

      // Act
      final Result<List<File>> result = exporter.exportFonts(
        destinationDir: tempDestDir,
        families: const <String>{'Noto Serif'},
      );

      // Assert
      expect(result, isA<Success<List<File>>>());
      final List<File> files = (result as Success<List<File>>).value;
      expect(files.length, equals(1));
      expect(p.basename(files.first.path), equals('noto_serif_500.ttf'));

      final notoFile = File(p.join(tempDestDir.path, 'noto_serif', 'noto_serif_500.ttf'));
      final robotoDir = Directory(p.join(tempDestDir.path, 'roboto'));

      expect(notoFile.existsSync(), isTrue);
      expect(robotoDir.existsSync(), isFalse);
    });

    test('should return Failure when source directory does not exist', () {
      // Arrange
      final nonExistentDir = Directory(p.join(tempSourceDir.path, 'non_existent'));
      final exporter = AssetExporter(packageAssetsDir: nonExistentDir);

      // Act
      final Result<List<File>> result = exporter.exportFonts(destinationDir: tempDestDir);

      // Assert
      expect(result, isA<Failure<List<File>>>());
      final failure = result as Failure<List<File>>;
      expect(failure.message, contains('does not exist'));
    });

    test('should generate valid pubspec yaml snippet with weights and styles', () {
      // Arrange
      final exporter = AssetExporter(packageAssetsDir: tempSourceDir);

      // Act
      final String yaml = exporter.generatePubspecFontSnippet(
        const <String>{'Roboto'},
        assetPrefix: 'my_assets/fonts',
      );

      // Assert
      expect(yaml, contains('flutter:'));
      expect(yaml, contains('  fonts:'));
      expect(yaml, contains('    - family: Roboto'));
      expect(yaml, contains('        - asset: my_assets/fonts/roboto/roboto_400.ttf'));
      expect(yaml, contains('          weight: 400'));
      expect(yaml, contains('        - asset: my_assets/fonts/roboto/roboto_700_italic.ttf'));
      expect(yaml, contains('          weight: 700'));
      expect(yaml, contains('          style: italic'));
    });

    test('should generate fallback pubspec entry when source directory is absent', () {
      // Arrange
      final nonExistentDir = Directory(p.join(tempSourceDir.path, 'empty'));
      final exporter = AssetExporter(packageAssetsDir: nonExistentDir);

      // Act
      final String yaml = exporter.generatePubspecFontSnippet(
        const <String>{'Roboto'},
        assetPrefix: 'custom/fonts',
      );

      // Assert
      expect(yaml, contains('    - family: Roboto'));
      expect(yaml, contains('        - asset: custom/fonts/roboto/roboto_400.ttf'));
    });
  });
}
