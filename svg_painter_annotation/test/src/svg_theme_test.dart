import 'package:svg_painter_annotation/src/svg_theme.dart';
import 'package:test/test.dart';

void main() {
  group('SvgTheme', () {
    test('should have default values when constructed without arguments', () {
      // Arrange & Act
      const theme = SvgTheme();

      // Assert
      expect(theme.fontSize, 16.0);
      expect(theme.xHeight, isNull);
    });

    test('should retain custom values when constructed with arguments', () {
      // Arrange & Act
      const theme = SvgTheme(fontSize: 24.0, xHeight: 12.0);

      // Assert
      expect(theme.fontSize, 24.0);
      expect(theme.xHeight, 12.0);
    });

    test('should support value equality when comparing instances', () {
      // Arrange
      const theme1 = SvgTheme(fontSize: 20.0, xHeight: 10.0);
      const theme2 = SvgTheme(fontSize: 20.0, xHeight: 10.0);
      const theme3 = SvgTheme(fontSize: 25.0, xHeight: 15.0);

      // Act & Assert
      expect(theme1, equals(theme2));
      expect(theme1.hashCode, equals(theme2.hashCode));
      expect(theme1, isNot(equals(theme3)));
    });

    test('should return formatted string when toString is called', () {
      // Arrange
      const theme = SvgTheme(fontSize: 30.0, xHeight: 15.0);

      // Act
      final stringResult = theme.toString();

      // Assert
      expect(stringResult, 'SvgTheme(fontSize: 30.0, xHeight: 15.0)');
    });
  });
}
