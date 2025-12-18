import 'package:svg_painter_fixtures/svg_painter_fixtures.dart';
import 'package:test/test.dart';

void main() {
  group('MdnElementCircle', () {
    test('basic fixture contains circle element', () {
      expect(MdnElementCircle.basic, contains('<circle'));
      expect(MdnElementCircle.basic, contains('cx="50"'));
    });
  });

  group('IO Fixtures', () {
    test('ioTestFileSvgPath is correct', () {
      expect(
        ioTestFileSvgPath,
        'package:svg_painter_fixtures/src/io/test_file.svg',
      );
    });
  });
}
