import 'package:svg_painter/src/svg_conversion/svg_value_extensions/image_dimensions_utils.dart';
import 'package:test/test.dart';

void main() {
  group('parseImageDimensions', () {
    test('should return correct dimensions when input is valid PNG bytes', () {
      // Arrange
      // PNG header: 8 bytes magic + 4 bytes IHDR len + 4 bytes 'IHDR' + 4 bytes width + 4 bytes height
      const testWidth = 120;
      const testHeight = 240;
      final pngBytes = <int>[
        0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A, // magic
        0x00, 0x00, 0x00, 0x0D, // IHDR chunk length (13)
        0x49, 0x48, 0x44, 0x52, // 'IHDR'
        0x00, 0x00, 0x00, testWidth, // width
        0x00, 0x00, 0x00, testHeight, // height
        0x08, 0x06, 0x00, 0x00, 0x00, // bit depth, color type, compression, filter, interlace
      ];

      // Act
      final ({double width, double height})? result = parseImageDimensions(pngBytes);

      // Assert
      expect(result, isNotNull);
      expect(result?.width, equals(120.0));
      expect(result?.height, equals(240.0));
    });

    test('should return correct dimensions when input is valid JPEG bytes with SOF0 marker', () {
      // Arrange
      // JPEG header: 0xFF, 0xD8 (SOI), then APP0 (0xFF, 0xE0), then SOF0 (0xFF, 0xC0)
      const testWidth = 320;
      const testHeight = 180;
      final jpegBytes = <int>[
        0xFF, 0xD8, // SOI
        0xFF, 0xE0, // APP0
        0x00, 0x04, 0x00, 0x00, // APP0 length 4 (2 length bytes + 2 data)
        0xFF, 0xC0, // SOF0
        0x00, 0x0B, // marker length (11 bytes)
        0x08, // precision
        (testHeight >> 8) & 0xFF, testHeight & 0xFF, // height
        (testWidth >> 8) & 0xFF, testWidth & 0xFF, // width
        0x03, 0x01, 0x11, 0x00, // components
      ];

      // Act
      final ({double width, double height})? result = parseImageDimensions(jpegBytes);

      // Assert
      expect(result, isNotNull);
      expect(result?.width, equals(320.0));
      expect(result?.height, equals(180.0));
    });

    test('should return null when input bytes are empty', () {
      // Arrange
      final emptyBytes = <int>[];

      // Act
      final ({double width, double height})? result = parseImageDimensions(emptyBytes);

      // Assert
      expect(result, isNull);
    });

    test('should return null when input bytes are invalid format', () {
      // Arrange
      final invalidBytes = <int>[0x00, 0x01, 0x02, 0x03, 0x04];

      // Act
      final ({double width, double height})? result = parseImageDimensions(invalidBytes);

      // Assert
      expect(result, isNull);
    });
  });
}
