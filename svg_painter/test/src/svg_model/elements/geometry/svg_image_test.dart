import 'package:svg_painter/src/svg_model/attribute_groups/svg_core_attributes.dart';
import 'package:svg_painter/src/svg_model/attribute_groups/svg_viewport_attributes.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgImage', () {
    test('should return correct string representation when all fields are provided', () {
      // Arrange
      const image = SvgImage(
        href: 'image.png',
        x: SvgLength(15.0),
        y: SvgLength(25.0),
        width: SvgLength(150.0),
        height: SvgLength(85.0),
        decoding: SvgImageDecoding.async,
        viewportAttributes: SvgViewportAttributes(
          viewBox: SvgViewBox(0.0, 0.0, 100.0, 100.0),
        ),
        coreAttributes: SvgCoreAttributes(id: 'img1'),
      );

      // Act
      final result = image.toString();

      // Assert
      expect(
        result,
        'SvgImage(href: image.png, x: 15.0, y: 25.0, width: 150.0, height: 85.0, decoding: SvgImageDecoding(async), id: img1)',
      );
      expect(image.decoding, SvgImageDecoding.async);
      expect(image.viewportAttributes, isNotNull);
    });

    test(
      'should return default decoding and null fields when initialized with minimal parameters',
      () {
        // Arrange
        const image = SvgImage(href: 'sample.jpg');

        // Act
        final result = image.toString();

        // Assert
        expect(image.decoding, SvgImageDecoding.auto);
        expect(image.x, isNull);
        expect(image.y, isNull);
        expect(image.width, isNull);
        expect(image.height, isNull);
        expect(image.viewportAttributes, isNull);
        expect(
          result,
          'SvgImage(href: sample.jpg, x: null, y: null, width: null, height: null, decoding: SvgImageDecoding(auto), id: null)',
        );
      },
    );
  });
}
