import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:svg_painter/src/xml_conversion/xml_element_extensions/to_svg_image.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
  group('ToSvgImage', () {
    test('should convert <image> with all attributes when valid XML is provided', () {
      // Arrange
      final document = XmlDocument.parse(
        '<image href="test.png" x="12" y="24" width="120" height="80" decoding="async" preserveAspectRatio="none" viewBox="0 0 50 50" id="img_1"><title id="t1">Test Title</title><desc id="d1">Test Desc</desc></image>',
      );
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgImage> result = element.toSvgImage();

      // Assert
      expect(
        result,
        isA<Success<SvgImage>>().having(
          (Success<SvgImage> s) => s.value,
          'value',
          isA<SvgImage>()
              .having((SvgImage img) => img.href, 'href', 'test.png')
              .having((SvgImage img) => (img.x as SvgLength?)?.value, 'x', 12.0)
              .having((SvgImage img) => (img.y as SvgLength?)?.value, 'y', 24.0)
              .having((SvgImage img) => (img.width as SvgLength?)?.value, 'width', 120.0)
              .having((SvgImage img) => (img.height as SvgLength?)?.value, 'height', 80.0)
              .having((SvgImage img) => img.decoding, 'decoding', SvgImageDecoding.async)
              .having(
                (SvgImage img) => img.viewportAttributes?.preserveAspectRatio?.alignment,
                'preserveAspectRatio',
                SvgPreserveAspectRatioAlignment.none,
              )
              .having(
                (SvgImage img) => img.viewportAttributes?.viewBox?.width,
                'viewBox width',
                50.0,
              )
              .having((SvgImage img) => img.id, 'id', 'img_1')
              .having((SvgImage img) => img.title?.content, 'title content', 'Test Title')
              .having((SvgImage img) => img.desc?.content, 'desc content', 'Test Desc'),
        ),
      );
    });

    test('should convert <image> with sync decoding when decoding="sync"', () {
      // Arrange
      final document = XmlDocument.parse('<image href="icon.png" decoding="sync" />');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgImage> result = element.toSvgImage();

      // Assert
      expect(
        result,
        isA<Success<SvgImage>>().having(
          (Success<SvgImage> s) => s.value,
          'value',
          isA<SvgImage>()
              .having((SvgImage img) => img.href, 'href', 'icon.png')
              .having((SvgImage img) => img.decoding, 'decoding', SvgImageDecoding.sync),
        ),
      );
    });

    test('should return default values when minimal <image> is provided', () {
      // Arrange
      final document = XmlDocument.parse('<image />');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgImage> result = element.toSvgImage();

      // Assert
      expect(
        result,
        isA<Success<SvgImage>>().having(
          (Success<SvgImage> s) => s.value,
          'value',
          isA<SvgImage>()
              .having((SvgImage img) => img.href, 'href', '')
              .having((SvgImage img) => img.decoding, 'decoding', SvgImageDecoding.auto)
              .having((SvgImage img) => img.x, 'x', isNull)
              .having((SvgImage img) => img.y, 'y', isNull)
              .having((SvgImage img) => img.width, 'width', isNull)
              .having((SvgImage img) => img.height, 'height', isNull)
              .having((SvgImage img) => img.viewportAttributes?.viewBox, 'viewBox', isNull),
        ),
      );
    });
  });
}
