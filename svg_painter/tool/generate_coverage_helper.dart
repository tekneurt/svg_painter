import 'dart:io';
import 'package:path/path.dart' as p;

/// This tool generates `test/coverage_helper_test.dart` containing imports
/// for all library files. This ensures that the coverage report reflects
/// the true codebase size, including files that don't have direct tests.
void main() async {
  final libDir = Directory('lib');
  if (!libDir.existsSync()) {
    // ignore: avoid_print
    print('Error: lib directory not found.');
    exit(1);
  }

  final pubspecFile = File('pubspec.yaml');
  if (!pubspecFile.existsSync()) {
    // ignore: avoid_print
    print('Error: pubspec.yaml not found.');
    exit(1);
  }

  final String packageName = _extractPackageName(pubspecFile.readAsStringSync());
  final buffer = StringBuffer();

  buffer.writeln('// ignore_for_file: unused_import');
  buffer.writeln('// ignore_for_file: directives_ordering');
  buffer.writeln('// This file is generated. Do not edit by hand.');
  buffer.writeln();
  buffer.writeln("import 'package:test/test.dart';");

  final List<File> files = libDir.listSync(recursive: true).whereType<File>().where((File file) {
    final String path = file.path;
    return path.endsWith('.dart') &&
        !path.contains('.g.dart') &&
        !path.contains('.freezed.dart') &&
        !_isPartOf(file);
  }).toList();

  // Sort files for consistent output
  files.sort((File a, File b) => a.path.compareTo(b.path));

  for (final file in files) {
    final String relativePath = p.relative(file.path, from: 'lib');
    // Ensure we use forward slashes for imports
    final String importPath = relativePath.replaceAll(r'\', '/');
    buffer.writeln("import 'package:$packageName/$importPath';");
  }

  buffer.writeln();
  buffer.writeln('void main() {');
  buffer.writeln("  test('coverage helper', () {");
  buffer.writeln('    expect(true, isTrue);');
  buffer.writeln('  });');
  buffer.writeln('}');

  final output = File('test/coverage_helper_test.dart');
  await output.writeAsString(buffer.toString());
  // ignore: avoid_print
  print('Successfully generated ${output.path} with ${files.length} imports.');
}

String _extractPackageName(String pubspecContent) {
  final nameRegex = RegExp(r'^name:\s*([a-zA-Z0-9_]+)', multiLine: true);
  final Match? match = nameRegex.firstMatch(pubspecContent);
  if (match == null) {
    // ignore: avoid_print
    print('Error: Could not find package name in pubspec.yaml');
    exit(1);
  }
  return match.group(1)!;
}

bool _isPartOf(File file) {
  final String content = file.readAsStringSync();
  return content.contains(RegExp(r'^part of\s+', multiLine: true));
}
