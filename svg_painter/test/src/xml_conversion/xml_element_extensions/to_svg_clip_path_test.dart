import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:svg_painter/src/xml_conversion/xml_element_extensions/to_svg_clip_path.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
  group('ToSvgClipPath', () {
    test('should return Success with SvgClipPath when default attributes are used', () {
      // Arrange
      final document = XmlDocument.parse('''
        <clipPath id="myClip">
          <circle cx="40" cy="35" r="35" />
        </clipPath>
      ''');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgClipPath> result = element.toSvgClipPath();

      // Assert
      expect(result, isA<Success<SvgClipPath>>());
      final SvgClipPath clipPath = (result as Success<SvgClipPath>).value;
      expect(clipPath.id, 'myClip');
      expect(clipPath.clipPathUnits, SvgClipPathUnits.userSpaceOnUse);
      expect(clipPath.children, hasLength(1));
      expect(clipPath.children[0], isA<SvgCircle>());
    });

    test('should return Success with objectBoundingBox when clipPathUnits is specified', () {
      // Arrange
      final document = XmlDocument.parse('''
        <clipPath id="customClip" clipPathUnits="objectBoundingBox">
          <rect x="0.1" y="0.2" width="0.8" height="0.6" />
        </clipPath>
      ''');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgClipPath> result = element.toSvgClipPath();

      // Assert
      expect(result, isA<Success<SvgClipPath>>());
      final SvgClipPath clipPath = (result as Success<SvgClipPath>).value;
      expect(clipPath.id, 'customClip');
      expect(clipPath.clipPathUnits, SvgClipPathUnits.objectBoundingBox);
      expect(clipPath.children, hasLength(1));
      expect(clipPath.children[0], isA<SvgRect>());
    });
  });
}
