import 'package:svg_painter/src/xml_conversion/string_extensions/to_svg_url.dart';
import 'package:test/test.dart';

void main() {
  group('ToSvgUrl', () {
    group('extractUrlId', () {
      test('should return id when valid url(#id) is provided', () {
        // Arrange
        const String input = 'url(#my-id)';

        // Act
        final String? result = input.extractUrlId();

        // Assert
        expect(result, 'my-id');
      });

      test('should return id when url with quotes is provided', () {
        // Arrange
        const String input1 = "url('#id1')";
        const String input2 = 'url("#id2")';

        // Act & Assert
        expect(input1.extractUrlId(), 'id1');
        expect(input2.extractUrlId(), 'id2');
      });

      test('should return null when format is invalid', () {
        // Arrange
        const String input1 = '#id';
        const String input2 = 'url(id)';
        const String input3 = 'none';

        // Act & Assert
        expect(input1.extractUrlId(), isNull);
        expect(input2.extractUrlId(), isNull);
        expect(input3.extractUrlId(), isNull);
      });
    });
  });
}
