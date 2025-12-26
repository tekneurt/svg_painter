import 'package:svg_painter_fixtures/svg_painter_fixtures.dart';
import 'package:test/test.dart';

void main() {
  group('MDN Fixtures', () {
    test('mdnCircleExample fixture contains circle element', () {
      expect(mdnCircleExample, contains('<circle'));
      expect(mdnCircleExample, contains('cx="50"'));
    });
  });

  group('Various Fixtures', () {
    test('ioTestFileSvgPath is correct', () {
      expect(
        ioTestFileSvgPath,
        'package:svg_painter_fixtures/src/various/io/test_file.svg',
      );
    });

    test('daphniaSvgPath is correct', () {
      expect(
        daphniaSvgPath,
        'package:svg_painter_fixtures/src/various/daphnia/daphnia.svg',
      );
    });
  });

  group('W3C SVG 1.1 shapes', () {
    test('rect01 fixture is loaded', () {
      expect(w3cSvg11ExampleRect01, contains('<rect'));
    });
  });
}
