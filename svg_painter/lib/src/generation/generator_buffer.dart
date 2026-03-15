/// Utility to handle code indentation and emission for SVG generators.
class GeneratorBuffer {
  GeneratorBuffer({int initialIndent = 0}) : _indent = initialIndent;

  final StringBuffer _buffer = StringBuffer();
  int _indent;

  /// Increases the current indentation level.
  void indent() => _indent++;

  /// Decreases the current indentation level.
  void outdent() => _indent--;

  /// Writes a line of text with current indentation.
  void writeln([String? text]) {
    if (text == null || text.trim().isEmpty) {
      _buffer.writeln();
      return;
    }

    final String prefix = '  ' * _indent;
    // For multi-line strings, indent each line
    final List<String> lines = text.split('\n');
    for (final String line in lines) {
      final String trimmed = line.trim();
      if (trimmed.isEmpty) {
        _buffer.writeln();
      } else {
        _buffer.writeln('$prefix$trimmed');
      }
    }
  }

  /// Writes a scoped block (e.g., `{ ... }`) and manages indentation automatically.
  void writeBlock(String header, void Function() body, {String footer = '}'}) {
    writeln(header);
    indent();
    body();
    outdent();
    writeln(footer);
  }

  @override
  String toString() => _buffer.toString();
}
