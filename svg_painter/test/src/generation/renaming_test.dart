import 'package:svg_painter/src/svg_painter_generator.dart';
import 'package:svg_painter_annotation/svg_painter_annotation.dart';
import 'package:test/test.dart';

void main() {
  group('Property Renaming', () {
    const generator = SvgPainterGenerator();

    test('should rename ID-based properties', () {
      // Arrange
      const svg = '''
<svg viewBox="0 0 100 100">
  <circle id="myCircle" cx="50" cy="50" r="40" fill="red" />
</svg>
''';

      // Act
      final String output = generator.generateFromSvg(
        elementName: 'RenamedIdPainter',
        svgContent: svg,
        exposureMode: SvgExposureMode.id,
        propertyMapping: <String, String>{'myCircleFill': 'backgroundFill'},
      );

      // Assert
      // Should contain renamed property
      expect(output, contains('final Object? backgroundFill;'));
      expect(output, contains('this.backgroundFill,'));

      // Should NOT contain original property
      expect(output, isNot(contains('myCircleFill;')));

      // Verify usage in paint
      expect(output, contains('final Object? localFill = backgroundFill;'));

      // Verify usage in shouldRepaint (now formatted across lines)
      expect(output, contains('backgroundFill == oldDelegate.backgroundFill'));
    });

    test('should rename Indexed properties', () {
      // Arrange
      const svg = '''
<svg viewBox="0 0 100 100">
  <circle cx="10" cy="10" r="5" fill="red" />
  <circle cx="20" cy="20" r="5" fill="blue" />
</svg>
''';

      // Act
      final String output = generator.generateFromSvg(
        elementName: 'RenamedIndexPainter',
        svgContent: svg,
        exposureMode: SvgExposureMode.indexed,
        propertyMapping: <String, String>{'fill1': 'primaryColor', 'fill2': 'secondaryColor'},
      );

      // Assert
      expect(output, contains('final Object? primaryColor;'));
      expect(output, contains('final Object? secondaryColor;'));

      expect(output, isNot(contains('fill1;')));
      expect(output, isNot(contains('fill2;')));

      // Verify usage
      expect(output, contains('final Object? localFill = primaryColor;'));
      expect(output, contains('final Object? localFill = secondaryColor;'));
    });

    test('should handle partial renaming', () {
      // Arrange
      const svg = '''
<svg viewBox="0 0 100 100">
  <circle cx="10" cy="10" r="5" fill="red" />
  <circle cx="20" cy="20" r="5" fill="blue" />
</svg>
''';

      // Act
      final String output = generator.generateFromSvg(
        elementName: 'PartialRenamingPainter',
        svgContent: svg,
        exposureMode: SvgExposureMode.indexed,
        propertyMapping: <String, String>{
          'fill1': 'primaryColor',
          // fill2 not renamed
        },
      );

      // Assert
      expect(output, contains('final Object? primaryColor;'));
      expect(output, contains('final Object? fill2;')); // Original name kept
    });
  });
}
