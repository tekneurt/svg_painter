import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'test_utils.dart';

/// This test ensures that platform-specific golden files (e.g., `name.mac_os.png`)
/// are actually different from their base counterparts (`name.png`).
///
/// If both files are identical, the platform override is unnecessary and should
/// be removed to avoid confusion and wasted storage.
void main() {
  test('Platform-specific goldens must differ from base goldens', () {
    final List<String> duplicates = <String>[];
    final Directory testDir = Directory('test');

    // Find all golden directories
    final List<FileSystemEntity> allFiles = testDir.listSync(recursive: true);
    final List<File> goldenFiles = allFiles
        .whereType<File>()
        .where((File f) => f.path.endsWith('.png'))
        .toList();

    // Build platform suffixes from the TargetPlatform enum
    final Map<String, TargetPlatform> suffixToPlatform = <String, TargetPlatform>{
      for (final TargetPlatform platform in TargetPlatform.values)
        '.${platformToFileSuffix(platform)}.png': platform,
    };

    for (final File platformFile in goldenFiles) {
      // Check if this is a platform-specific golden
      String? matchedSuffix;
      for (final String suffix in suffixToPlatform.keys) {
        if (platformFile.path.endsWith(suffix)) {
          matchedSuffix = suffix;
          break;
        }
      }

      if (matchedSuffix == null) {
        continue; // Not a platform-specific golden
      }

      // Find the corresponding base golden
      final String basePath = platformFile.path.replaceAll(matchedSuffix, '.png');
      final File baseFile = File(basePath);

      if (!baseFile.existsSync()) {
        // Base file doesn't exist - this is fine, might be platform-only
        continue;
      }

      // Compare file contents
      final Uint8List platformBytes = platformFile.readAsBytesSync();
      final Uint8List baseBytes = baseFile.readAsBytesSync();

      if (listEquals(platformBytes, baseBytes)) {
        // Extract relative paths for clearer error message
        final String platformRelative = platformFile.path.replaceFirst('test/', '');
        final String baseRelative = baseFile.path.replaceFirst('test/', '');
        duplicates.add('  - $platformRelative is identical to $baseRelative');
      }
    }

    if (duplicates.isNotEmpty) {
      fail(
        'Found ${duplicates.length} unnecessary platform-specific golden(s).\n'
        'These files are identical to their base counterparts and should be removed:\n'
        '${duplicates.join('\n')}\n\n'
        'To fix:\n'
        '1. Remove the platform-specific golden file(s)\n'
        '2. Remove the platform override from the test configuration\n'
        '   (change `<TargetPlatform>{TargetPlatform.macOS}` to `null`)',
      );
    }
  });
}
