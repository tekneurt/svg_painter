import 'package:svg_painter/src/svg_model/attribute_groups/svg_core_attributes.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgFilter', () {
    test('should return correct string representation when toString is called', () {
      // Arrange
      const filter = SvgFilter(
        children: <SvgElement>[
          SvgFeGaussianBlur(stdDeviationX: 2.0, stdDeviationY: 4.0),
        ],
        coreAttributes: SvgCoreAttributes(id: 'blurFilter'),
      );

      // Act
      final result = filter.toString();

      // Assert
      expect(result, 'SvgFilter(primitives: 1, id: blurFilter)');
    });

    test('should store properties correctly when instantiated', () {
      // Arrange
      const filter = SvgFilter(
        children: <SvgElement>[
          SvgFeGaussianBlur(
            stdDeviationX: 3.0,
            stdDeviationY: 6.0,
            inSource: 'SourceAlpha',
            result: 'blurResult',
          ),
        ],
        coreAttributes: SvgCoreAttributes(id: 'filter1'),
        x: SvgPercentage(-15.0),
        y: SvgPercentage(-25.0),
        width: SvgPercentage(140.0),
        height: SvgPercentage(150.0),
        filterUnits: SvgFilterUnits.userSpaceOnUse,
        primitiveUnits: SvgFilterUnits.objectBoundingBox,
      );

      // Act & Assert
      expect(filter.id, 'filter1');
      expect(filter.x, const SvgPercentage(-15.0));
      expect(filter.y, const SvgPercentage(-25.0));
      expect(filter.width, const SvgPercentage(140.0));
      expect(filter.height, const SvgPercentage(150.0));
      expect(filter.filterUnits, SvgFilterUnits.userSpaceOnUse);
      expect(filter.primitiveUnits, SvgFilterUnits.objectBoundingBox);
      expect(filter.primitives.length, 1);
    });
  });
}
