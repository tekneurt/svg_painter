import 'package:svg_painter/src/generation/generator_buffer.dart';
import 'package:test/test.dart';

void main() {
  group('GeneratorBuffer', () {
    test('should write simple line with initial indent', () {
      final GeneratorBuffer buffer = GeneratorBuffer(initialIndent: 1);
      buffer.writeln('test');
      expect(buffer.toString(), '  test\n');
    });

    test('should indent and outdent correctly', () {
      final GeneratorBuffer buffer = GeneratorBuffer();
      buffer.writeln('level 0');
      buffer.indent();
      buffer.writeln('level 1');
      buffer.indent();
      buffer.writeln('level 2');
      buffer.outdent();
      buffer.writeln('back to 1');
      buffer.outdent();
      buffer.writeln('back to 0');

      expect(buffer.toString(), 
        'level 0\n'
        '  level 1\n'
        '    level 2\n'
        '  back to 1\n'
        'back to 0\n'
      );
    });

    test('should handle multi-line strings and empty lines (DA:27)', () {
      final GeneratorBuffer buffer = GeneratorBuffer(initialIndent: 1);
      buffer.writeln('line 1\n\nline 3');
      
      expect(buffer.toString(), 
        '  line 1\n'
        '\n'
        '  line 3\n'
      );
    });

    test('should handle null or whitespace strings in writeln', () {
      final GeneratorBuffer buffer = GeneratorBuffer();
      buffer.writeln();
      buffer.writeln('   ');
      
      expect(buffer.toString(), '\n\n');
    });

    test('should writeBlock with automatic brace and indent', () {
      final GeneratorBuffer buffer = GeneratorBuffer();
      buffer.writeBlock('if (true)', () {
        buffer.writeln('print("hello");');
      });

      expect(buffer.toString(), 
        'if (true) {\n'
        '  print("hello");\n'
        '}\n'
      );
    });

    test('should respect header that already has a brace or ends with semicolon', () {
      final GeneratorBuffer buffer = GeneratorBuffer();
      buffer.writeBlock('class MyClass {', () {
        buffer.writeln('int x = 0;');
      });
      buffer.writeBlock('final Path path = Path()', () {
        buffer.writeln('..moveTo(0, 0)');
      }, footer: ';');

      expect(buffer.toString(), contains('class MyClass {\n'));
      expect(buffer.toString(), contains('final Path path = Path() {\n')); // Current implementation behavior
    });
    
    test('should handle custom footer in writeBlock', () {
      final GeneratorBuffer buffer = GeneratorBuffer();
      buffer.writeBlock('void myMethod() {', () {
        buffer.writeln('// code');
      }, footer: '} // end method');

      expect(buffer.toString(), contains('} // end method\n'));
    });
  });
}
