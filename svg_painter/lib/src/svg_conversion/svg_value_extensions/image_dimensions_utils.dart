/// Parses intrinsic dimensions (width, height) from raw image bytes (PNG or JPEG).
({double width, double height})? parseImageDimensions(List<int> bytes) {
  // 1. PNG Header check: 8-byte signature + IHDR chunk
  if (bytes.length >= 24 &&
      bytes[0] == 0x89 &&
      bytes[1] == 0x50 &&
      bytes[2] == 0x4E &&
      bytes[3] == 0x47) {
    final int width = (bytes[16] << 24) | (bytes[17] << 16) | (bytes[18] << 8) | bytes[19];
    final int height = (bytes[20] << 24) | (bytes[21] << 16) | (bytes[22] << 8) | bytes[23];
    return (width: width.toDouble(), height: height.toDouble());
  }

  // 2. JPEG Header check: 0xFF, 0xD8 signature + SOF marker
  if (bytes.length >= 2 && bytes[0] == 0xFF && bytes[1] == 0xD8) {
    var offset = 2;
    while (offset + 4 < bytes.length) {
      if (bytes[offset] != 0xFF) {
        offset++;
        continue;
      }
      final int marker = bytes[offset + 1];
      offset += 2;

      // Standalone markers without length: SOI (0xD8), EOI (0xD9), RST0-RST7 (0xD0-0xD7)
      final bool isStandalone =
          marker == 0xD8 || marker == 0xD9 || (marker >= 0xD0 && marker <= 0xD7);
      if (isStandalone) {
        continue;
      }

      if (offset + 2 > bytes.length) {
        break;
      }
      final int length = (bytes[offset] << 8) | bytes[offset + 1];
      if (length < 2 || offset + length > bytes.length) {
        break;
      }

      // SOF markers: 0xC0..0xC3, 0xC5..0xC7, 0xC9..0xCB, 0xCD..0xCF
      final bool isSof = (marker >= 0xC0 && marker <= 0xC3) ||
          (marker >= 0xC5 && marker <= 0xC7) ||
          (marker >= 0xC9 && marker <= 0xCB) ||
          (marker >= 0xCD && marker <= 0xCF);

      if (isSof && length >= 7) {
        final int height = (bytes[offset + 3] << 8) | bytes[offset + 4];
        final int width = (bytes[offset + 5] << 8) | bytes[offset + 6];
        return (width: width.toDouble(), height: height.toDouble());
      }

      offset += length;
    }
  }

  return null;
}
