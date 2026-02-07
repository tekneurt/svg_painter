import 'package:svg_painter/src/svg_model/_svg_model.dart';
import 'package:svg_painter/src/xml_conversion/parsers/svg_transform_parser.dart';
import 'package:test/test.dart';

void main() {
  group('SvgTransformParser', () {
    group('parse', () {
      test('should return null when input is null', () {
        expect(SvgTransformParser.parse(null), isNull);
      });

      test('should return null when input is empty', () {
        expect(SvgTransformParser.parse(''), isNull);
      });

      test('should parse translate(tx)', () {
        final SvgTransformAttributes? result = SvgTransformParser.parse('translate(10)');
        expect(result, isNotNull);
        expect(result!.operations, hasLength(1));
        final SvgTranslate op = result.operations.first as SvgTranslate;
        expect(op.x, 10.0);
        expect(op.y, 0.0);
      });

      test('should parse translate(tx, ty)', () {
        final SvgTransformAttributes? result = SvgTransformParser.parse('translate(10, 20)');
        expect(result, isNotNull);
        final SvgTranslate op = result!.operations.first as SvgTranslate;
        expect(op.x, 10.0);
        expect(op.y, 20.0);
      });

      test('should parse rotate(angle)', () {
        final SvgTransformAttributes? result = SvgTransformParser.parse('rotate(45)');
        expect(result, isNotNull);
        final SvgRotate op = result!.operations.first as SvgRotate;
        expect(op.angle, 45.0);
        expect(op.cx, isNull);
        expect(op.cy, isNull);
      });

      test('should parse rotate(angle, cx, cy)', () {
        final SvgTransformAttributes? result = SvgTransformParser.parse('rotate(45, 10, 20)');
        expect(result, isNotNull);
        final SvgRotate op = result!.operations.first as SvgRotate;
        expect(op.angle, 45.0);
        expect(op.cx, 10.0);
        expect(op.cy, 20.0);
      });

      test('should parse scale(sx)', () {
        final SvgTransformAttributes? result = SvgTransformParser.parse('scale(2.5)');
        expect(result, isNotNull);
        final SvgScale op = result!.operations.first as SvgScale;
        expect(op.x, 2.5);
        expect(op.y, 2.5);
      });

      test('should parse scale(sx, sy)', () {
        final SvgTransformAttributes? result = SvgTransformParser.parse('scale(2, 3)');
        expect(result, isNotNull);
        final SvgScale op = result!.operations.first as SvgScale;
        expect(op.x, 2.0);
        expect(op.y, 3.0);
      });

      test('should parse skewX(angle)', () {
        final SvgTransformAttributes? result = SvgTransformParser.parse('skewX(30)');
        expect(result, isNotNull);
        final SvgSkewX op = result!.operations.first as SvgSkewX;
        expect(op.angle, 30.0);
      });

      test('should parse skewY(angle)', () {
        final SvgTransformAttributes? result = SvgTransformParser.parse('skewY(30)');
        expect(result, isNotNull);
        final SvgSkewY op = result!.operations.first as SvgSkewY;
        expect(op.angle, 30.0);
      });

      test('should parse matrix(...)', () {
        final SvgTransformAttributes? result = SvgTransformParser.parse(
          'matrix(1, 2, 3, 4, 10, 20)',
        );
        expect(result, isNotNull);
        final SvgMatrix op = result!.operations.first as SvgMatrix;
        expect(op.a, 1.0);
        expect(op.b, 2.0);
        expect(op.c, 3.0);
        expect(op.d, 4.0);
        expect(op.e, 10.0);
        expect(op.f, 20.0);
      });

      test('should handle chained transforms', () {
        final SvgTransformAttributes? result = SvgTransformParser.parse(
          'translate(10, 20) rotate(45) scale(2)',
        );
        expect(result, isNotNull);
        expect(result!.operations, hasLength(3));
        expect(result.operations[0], isA<SvgTranslate>());
        expect(result.operations[1], isA<SvgRotate>());
        expect(result.operations[2], isA<SvgScale>());
      });

      test('should handle various delimiters', () {
        final SvgTransformAttributes? result = SvgTransformParser.parse(
          'translate(10  20),rotate(45,10,20) scale(2,3)',
        );
        expect(result, isNotNull);
        expect(result!.operations, hasLength(3));
      });
    });
  });
}
