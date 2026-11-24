import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:svg_painter/src/xml_conversion/xml_element_extensions/to_svg_filter.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
  group('ToSvgFilter', () {
    test('should return SvgFilter with correct attributes when valid XML is provided', () {
      // Arrange
      final document = XmlDocument.parse('''
<filter id="filt1" x="-20%" y="-30%" width="140%" height="160%" filterUnits="userSpaceOnUse" primitiveUnits="objectBoundingBox">
  <feGaussianBlur stdDeviation="3.0" />
</filter>''');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgFilter> result = element.toSvgFilter();

      // Assert
      expect(result, isA<Success<SvgFilter>>());
      final SvgFilter filter = (result as Success<SvgFilter>).value;
      expect(filter.id, 'filt1');
      expect((filter.x! as SvgPercentage).value, -20.0);
      expect((filter.y! as SvgPercentage).value, -30.0);
      expect((filter.width! as SvgPercentage).value, 140.0);
      expect((filter.height! as SvgPercentage).value, 160.0);
      expect(filter.filterUnits, SvgFilterUnits.userSpaceOnUse);
      expect(filter.primitiveUnits, SvgFilterUnits.objectBoundingBox);
      expect(filter.primitives.length, 1);
      expect(filter.primitives.first, isA<SvgFeGaussianBlur>());
    });

    test('should return SvgFilter with default attributes when none are provided', () {
      // Arrange
      final document = XmlDocument.parse('<filter />');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgFilter> result = element.toSvgFilter();

      // Assert
      expect(result, isA<Success<SvgFilter>>());
      final SvgFilter filter = (result as Success<SvgFilter>).value;
      expect(filter.id, isNull);
      expect(filter.x, isNull);
      expect(filter.y, isNull);
      expect(filter.width, isNull);
      expect(filter.height, isNull);
      expect(filter.filterUnits, SvgFilterUnits.objectBoundingBox);
      expect(filter.primitiveUnits, SvgFilterUnits.userSpaceOnUse);
      expect(filter.primitives, isEmpty);
    });
  });
}
