import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgImageDecoding', () {
    test('should have correct enum values when inspected', () {
      // Arrange & Act & Assert
      expect(SvgImageDecoding.values, hasLength(3));
      expect(SvgImageDecoding.auto.value, 'auto');
      expect(SvgImageDecoding.sync.value, 'sync');
      expect(SvgImageDecoding.async.value, 'async');
    });

    test('should return correct string representation when toString is called', () {
      // Arrange
      const SvgImageDecoding autoDecoding = SvgImageDecoding.auto;
      const SvgImageDecoding syncDecoding = SvgImageDecoding.sync;
      const SvgImageDecoding asyncDecoding = SvgImageDecoding.async;

      // Act
      final resultAuto = autoDecoding.toString();
      final resultSync = syncDecoding.toString();
      final resultAsync = asyncDecoding.toString();

      // Assert
      expect(resultAuto, 'SvgImageDecoding(auto)');
      expect(resultSync, 'SvgImageDecoding(sync)');
      expect(resultAsync, 'SvgImageDecoding(async)');
    });
  });
}
