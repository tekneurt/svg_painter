import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:svg_painter/builder.dart';
import 'package:test/test.dart';

void main() {
  group('svgPainterBuilder', () {
    test('should return a SharedPartBuilder', () {
      // Arrange
      const BuilderOptions options = BuilderOptions.empty;

      // Act
      final Builder builder = svgPainterBuilder(options);

      // Assert
      expect(builder, isA<SharedPartBuilder>());
    });
  });
}
