import 'package:svg_painter/src/svg_painter_generator.dart';
import 'package:svg_painter_annotation/svg_painter_annotation.dart';
import 'package:test/test.dart';

void main() {
  group('Property Exposure', () {
    final SvgPainterGenerator generator = SvgPainterGenerator();

    test('should generate a nullable Color property for elements with an id', () {
      // Arrange
      const String svg = '''
<svg viewBox="0 0 100 100">
  <circle id="myCircle" cx="50" cy="50" r="40" fill="red" />
</svg>
''';

      // Act
      final String output = generator.generateFromSvg(
        elementName: 'MyPainter',
        svgContent: svg,
        exposureMode: SvgExposureMode.id,
      );

      // Assert
      expect(output, contains('final Object? myCircleFill;'));
      expect(output, contains('this.myCircleFill,'));
      // Check that it's used in the paint method
      expect(output, contains('final Object? localFill = myCircleFill;'));
      expect(output, contains('if (localFill == null) {'));
      expect(output, contains('paint.color = const Color(0xFFFF0000);'));
      expect(output, contains('} else {'));
      expect(output, contains('_applyOverride(paint, localFill);'));
      // Check shouldRepaint
      expect(output, contains(r'bool shouldRepaint(covariant _$MyPainter oldDelegate) {'));
      expect(
        output,
        contains('if (fit == oldDelegate.fit && myCircleFill == oldDelegate.myCircleFill) {'),
      );
      expect(output, contains('return false;'));
      expect(output, contains('} else {'));
      expect(output, contains('return true;'));
    });

    test('should sanitize IDs into valid Dart identifiers', () {
      // Arrange
      const String svg = '''
<svg viewBox="0 0 100 100">
  <rect id="my-rect" x="0" y="0" width="10" height="10" fill="blue" />
  <rect id="123box" x="10" y="10" width="10" height="10" fill="green" />
  <rect id="class" x="20" y="20" width="10" height="10" fill="yellow" />
</svg>
''';

      // Act
      final String output = generator.generateFromSvg(
        elementName: 'SanitizedPainter',
        svgContent: svg,
        exposureMode: SvgExposureMode.id,
      );

      // Assert
      expect(output, contains('final Object? myRectFill;'));
      expect(output, contains('final Object? v123boxFill;'));
      expect(output, contains('final Object? classPropertyFill;'));
    });

    test('should preserve camelCase in IDs', () {
      // Arrange
      const String svg = '''
<svg viewBox="0 0 100 100">
  <circle id="myCircle" cx="50" cy="50" r="40" fill="red" />
</svg>
''';

      // Act
      final String output = generator.generateFromSvg(
        elementName: 'CamelPainter',
        svgContent: svg,
        exposureMode: SvgExposureMode.id,
      );

      // Assert
      expect(output, contains('final Object? myCircleFill;'));
    });

    test('should NOT generate properties for elements with an id but NO explicit fill/stroke', () {
      // Arrange
      const String svg = '''
<svg viewBox="0 0 100 100">
  <circle id="implicitCircle" cx="50" cy="50" r="40" />
</svg>
''';

      // Act
      final String output = generator.generateFromSvg(
        elementName: 'ImplicitPainter',
        svgContent: svg,
      );

      // Assert
      expect(output, isNot(contains('implicitCircleFill')));
    });

    test('should generate a nullable Color property for elements with an explicit stroke', () {
      // Arrange
      const String svg = '''
<svg viewBox="0 0 100 100">
  <rect id="strokedRect" x="10" y="10" width="80" height="80" stroke="blue" />
</svg>
''';

      // Act
      final String output = generator.generateFromSvg(
        elementName: 'StrokePainter',
        svgContent: svg,
        exposureMode: SvgExposureMode.id,
      );

      // Assert
      expect(output, contains('final Object? strokedRectStroke;'));
      expect(output, contains('this.strokedRectStroke,'));
      expect(output, contains('final Object? localStroke = strokedRectStroke;'));
      expect(output, contains('if (localStroke == null) {'));
      expect(output, contains('paint.color = const Color(0xFF0000FF);'));
      expect(output, contains('} else {'));
      expect(output, contains('_applyOverride(paint, localStroke);'));
    });

    test('should use named Flutter colors (including shades) when a match exists', () {
      // Arrange
      // 0xFFFFAB91 matches Colors.deepOrange.shade200
      const String svg = '''
<svg viewBox="0 0 100 100">
  <circle id="orangeCircle" cx="50" cy="50" r="40" fill="#FFAB91" />
</svg>
''';

      // Act
      final String output = generator.generateFromSvg(
        elementName: 'ShadedPainter',
        svgContent: svg,
        exposureMode: SvgExposureMode.id,
      );

      // Assert
      expect(output, contains('paint.color = Colors.deepOrange.shade200;'));
    });
  });
}
