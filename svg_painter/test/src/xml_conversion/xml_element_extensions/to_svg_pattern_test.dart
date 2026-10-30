import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:svg_painter/src/xml_conversion/xml_element_extensions/to_svg_pattern.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
  group('ToSvgPattern', () {
    test('should return SvgPattern with correct attributes when valid XML is provided', () {
      // Arrange
      final document = XmlDocument.parse(
        '<pattern id="pat1" viewBox="0 0 10 20" width="30%" height="40%" x="5" y="15" '
        'patternUnits="userSpaceOnUse" patternContentUnits="objectBoundingBox" href="#otherPat"> '
        '<rect width="5" height="10" /> '
        '</pattern>',
      );
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgPattern> result = element.toSvgPattern();

      // Assert
      expect(result, isA<Success<SvgPattern>>());
      final SvgPattern pattern = (result as Success<SvgPattern>).value;
      expect(pattern.id, 'pat1');
      expect(pattern.viewBox?.width, 10.0);
      expect(pattern.viewBox?.height, 20.0);
      expect((pattern.width! as SvgPercentage).value, 30.0);
      expect((pattern.height! as SvgPercentage).value, 40.0);
      expect((pattern.x! as SvgLength).value, 5.0);
      expect((pattern.y! as SvgLength).value, 15.0);
      expect(pattern.patternUnits, SvgPatternUnits.userSpaceOnUse);
      expect(pattern.patternContentUnits, SvgPatternUnits.objectBoundingBox);
      expect(pattern.href, '#otherPat');
      expect(pattern.children.length, 1);
    });

    test('should return SvgPattern with default attributes when none are provided', () {
      // Arrange
      final document = XmlDocument.parse('<pattern />');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgPattern> result = element.toSvgPattern();

      // Assert
      expect(result, isA<Success<SvgPattern>>());
      final SvgPattern pattern = (result as Success<SvgPattern>).value;
      expect(pattern.id, isNull);
      expect(pattern.viewBox, isNull);
      expect(pattern.preserveAspectRatio, isNull);
      expect(pattern.width, isNull);
      expect(pattern.height, isNull);
      expect(pattern.x, isNull);
      expect(pattern.y, isNull);
      expect(pattern.patternUnits, SvgPatternUnits.objectBoundingBox);
      expect(pattern.patternContentUnits, SvgPatternUnits.userSpaceOnUse);
      expect(pattern.patternTransformAttributes, isNull);
      expect(pattern.href, isNull);
      expect(pattern.children, isEmpty);
    });
  });
}
