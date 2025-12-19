import 'package:svg_painter_annotation/svg_painter_annotation.dart';
import 'package:test/test.dart';

void main() {
  group('SvgPainter Annotation', () {
    test('SvgPainter.file creates SvgFilePainter', () {
      const SvgPainter annotation = SvgPainter.file('assets/icon.svg');
      expect(annotation, isA<SvgFilePainter>());
      expect((annotation as SvgFilePainter).path, 'assets/icon.svg');
      expect(annotation.painterClassName, isNull);
    });

    test('SvgPainter.code creates SvgCodePainter', () {
      const String svgCode = '<svg>...</svg>';
      const SvgPainter annotation = SvgPainter.code(svgCode);
      expect(annotation, isA<SvgCodePainter>());
      expect((annotation as SvgCodePainter).code, svgCode);
      expect(annotation.painterClassName, isNull);
    });

    test('SvgPainter accepts optional painterClassName', () {
      const SvgPainter annotation = SvgPainter.file('path', painterClassName: 'MyPainter');
      expect(annotation.painterClassName, 'MyPainter');
    });
  });
}
