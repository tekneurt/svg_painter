import 'package:svg_painter/src/svg_model/_svg_model.dart';
import 'package:svg_painter/src/xml_conversion/string_extensions/to_svg_preserve_aspect_ratio.dart';
import 'package:test/test.dart';

void main() {
  group('ToSvgPreserveAspectRatio', () {
    test('should return default when string is empty', () {
      expect(''.toSvgPreserveAspectRatio(), equals(SvgPreserveAspectRatio.defaults));
      expect('   '.toSvgPreserveAspectRatio(), equals(SvgPreserveAspectRatio.defaults));
    });

    test('should parse none alignment', () {
      final SvgPreserveAspectRatio ratio = 'none'.toSvgPreserveAspectRatio();
      expect(ratio.alignment, equals(SvgPreserveAspectRatioAlignment.none));
      expect(ratio.scale, equals(SvgPreserveAspectRatioScale.meet));
    });

    test('should parse alignments', () {
      expect('xMinYMin'.toSvgPreserveAspectRatio().alignment, equals(SvgPreserveAspectRatioAlignment.xMinYMin));
      expect('xMidYMin'.toSvgPreserveAspectRatio().alignment, equals(SvgPreserveAspectRatioAlignment.xMidYMin));
      expect('xMaxYMin'.toSvgPreserveAspectRatio().alignment, equals(SvgPreserveAspectRatioAlignment.xMaxYMin));
      expect('xMinYMid'.toSvgPreserveAspectRatio().alignment, equals(SvgPreserveAspectRatioAlignment.xMinYMid));
      expect('xMidYMid'.toSvgPreserveAspectRatio().alignment, equals(SvgPreserveAspectRatioAlignment.xMidYMid));
      expect('xMaxYMid'.toSvgPreserveAspectRatio().alignment, equals(SvgPreserveAspectRatioAlignment.xMaxYMid));
      expect('xMinYMax'.toSvgPreserveAspectRatio().alignment, equals(SvgPreserveAspectRatioAlignment.xMinYMax));
      expect('xMidYMax'.toSvgPreserveAspectRatio().alignment, equals(SvgPreserveAspectRatioAlignment.xMidYMax));
      expect('xMaxYMax'.toSvgPreserveAspectRatio().alignment, equals(SvgPreserveAspectRatioAlignment.xMaxYMax));
    });

    test('should parse scales', () {
      expect('xMidYMid meet'.toSvgPreserveAspectRatio().scale, equals(SvgPreserveAspectRatioScale.meet));
      expect('xMidYMid slice'.toSvgPreserveAspectRatio().scale, equals(SvgPreserveAspectRatioScale.slice));
      // Unknown scale defaults to meet
      expect('xMidYMid unknown'.toSvgPreserveAspectRatio().scale, equals(SvgPreserveAspectRatioScale.meet));
    });

    test('should handle unknown alignments by defaulting to xMidYMid', () {
      expect('unknown_align slice'.toSvgPreserveAspectRatio().alignment, equals(SvgPreserveAspectRatioAlignment.xMidYMid));
    });
  });
}
