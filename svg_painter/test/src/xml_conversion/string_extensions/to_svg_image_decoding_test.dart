import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:svg_painter/src/xml_conversion/string_extensions/to_svg_image_decoding.dart';
import 'package:test/test.dart';

void main() {
  group('ToSvgImageDecoding', () {
    group('toSvgImageDecoding', () {
      test('should return correct enum when valid decoding string is provided', () {
        // Arrange
        const syncStr = 'sync';
        const asyncStr = 'async';
        const autoStr = 'auto';

        // Act
        final SvgImageDecoding resultSync = syncStr.toSvgImageDecoding();
        final SvgImageDecoding resultAsync = asyncStr.toSvgImageDecoding();
        final SvgImageDecoding resultAuto = autoStr.toSvgImageDecoding();

        // Assert
        expect(resultSync, SvgImageDecoding.sync);
        expect(resultAsync, SvgImageDecoding.async);
        expect(resultAuto, SvgImageDecoding.auto);
      });

      test('should handle case insensitivity and whitespace when parsing decoding string', () {
        // Arrange
        const syncStr = '  SYNC  ';
        const asyncStr = ' AsYnC ';
        const autoStr = '  AuTo  ';

        // Act
        final SvgImageDecoding resultSync = syncStr.toSvgImageDecoding();
        final SvgImageDecoding resultAsync = asyncStr.toSvgImageDecoding();
        final SvgImageDecoding resultAuto = autoStr.toSvgImageDecoding();

        // Assert
        expect(resultSync, SvgImageDecoding.sync);
        expect(resultAsync, SvgImageDecoding.async);
        expect(resultAuto, SvgImageDecoding.auto);
      });

      test('should return auto when string is unknown or empty', () {
        // Arrange
        const unknownStr = 'custom-mode';
        const emptyStr = '';

        // Act
        final SvgImageDecoding resultUnknown = unknownStr.toSvgImageDecoding();
        final SvgImageDecoding resultEmpty = emptyStr.toSvgImageDecoding();

        // Assert
        expect(resultUnknown, SvgImageDecoding.auto);
        expect(resultEmpty, SvgImageDecoding.auto);
      });
    });
  });
}
