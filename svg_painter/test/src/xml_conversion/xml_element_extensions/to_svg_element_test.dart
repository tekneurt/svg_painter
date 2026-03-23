import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/svg_model/_svg_model.dart';
import 'package:svg_painter/src/xml_conversion/xml_element_extensions/to_svg_element.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
  group('ToSvgElement', () {
    test('should return SvgRoot when <svg> is provided', () {
      // Arrange
      final document = XmlDocument.parse('<svg />');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgElement> result = element.toSvgElement();

      // Assert
      expect(result, isA<Success<SvgElement>>());
      expect((result as Success<SvgElement>).value, isA<SvgRoot>());
    });

    test('should return SvgCircle when <circle> is provided', () {
      // Arrange
      final document = XmlDocument.parse('<circle />');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgElement> result = element.toSvgElement();

      // Assert
      expect(result, isA<Success<SvgElement>>());
      expect((result as Success<SvgElement>).value, isA<SvgCircle>());
    });

    test('should return SvgEllipse when <ellipse> is provided', () {
      // Arrange
      final document = XmlDocument.parse('<ellipse />');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgElement> result = element.toSvgElement();

      // Assert
      expect(result, isA<Success<SvgElement>>());
      expect((result as Success<SvgElement>).value, isA<SvgEllipse>());
    });

    test('should return SvgRect when <rect> is provided', () {
      // Arrange
      final document = XmlDocument.parse('<rect />');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgElement> result = element.toSvgElement();

      // Assert
      expect(result, isA<Success<SvgElement>>());
      expect((result as Success<SvgElement>).value, isA<SvgRect>());
    });

    test('should return SvgLine when <line> is provided', () {
      // Arrange
      final document = XmlDocument.parse('<line />');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgElement> result = element.toSvgElement();

      // Assert
      expect(result, isA<Success<SvgElement>>());
      expect((result as Success<SvgElement>).value, isA<SvgLine>());
    });

    test('should return SvgPath when <path> with valid "d" attribute is provided', () {
      // Arrange
      final document = XmlDocument.parse('<path d="M0 0 L10 10" />');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgElement> result = element.toSvgElement();

      // Assert
      expect(result, isA<Success<SvgElement>>());
      expect((result as Success<SvgElement>).value, isA<SvgPath>());
    });

    test('should return SvgPolyline when <polyline> is provided', () {
      // Arrange
      final document = XmlDocument.parse('<polyline />');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgElement> result = element.toSvgElement();

      // Assert
      expect(result, isA<Success<SvgElement>>());
      expect((result as Success<SvgElement>).value, isA<SvgPolyline>());
    });

    test('should return SvgPolygon when <polygon> is provided', () {
      // Arrange
      final document = XmlDocument.parse('<polygon />');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgElement> result = element.toSvgElement();

      // Assert
      expect(result, isA<Success<SvgElement>>());
      expect((result as Success<SvgElement>).value, isA<SvgPolygon>());
    });

    test('should return SvgDefs when <defs> is provided', () {
      // Arrange
      final document = XmlDocument.parse('<defs />');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgElement> result = element.toSvgElement();

      // Assert
      expect(result, isA<Success<SvgElement>>());
      expect((result as Success<SvgElement>).value, isA<SvgDefs>());
    });

    test('should return SvgGroup when <g> is provided', () {
      // Arrange
      final document = XmlDocument.parse('<g />');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgElement> result = element.toSvgElement();

      // Assert
      expect(result, isA<Success<SvgElement>>());
      expect((result as Success<SvgElement>).value, isA<SvgGroup>());
    });

    test('should return SvgSymbol when <symbol> is provided', () {
      // Arrange
      final document = XmlDocument.parse('<symbol />');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgElement> result = element.toSvgElement();

      // Assert
      expect(result, isA<Success<SvgElement>>());
      expect((result as Success<SvgElement>).value, isA<SvgSymbol>());
    });

    test('should return SvgUse when <use> with valid "href" attribute is provided', () {
      // Arrange
      final document = XmlDocument.parse('<use href="#ref" />');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgElement> result = element.toSvgElement();

      // Assert
      expect(result, isA<Success<SvgElement>>());
      expect((result as Success<SvgElement>).value, isA<SvgUse>());
    });

    test('should return SvgRadialGradient when <radialGradient> is provided', () {
      // Arrange
      final document = XmlDocument.parse('<radialGradient />');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgElement> result = element.toSvgElement();

      // Assert
      expect(result, isA<Success<SvgElement>>());
      expect((result as Success<SvgElement>).value, isA<SvgRadialGradient>());
    });

    test('should return SvgLinearGradient when <linearGradient> is provided', () {
      // Arrange
      final document = XmlDocument.parse('<linearGradient />');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgElement> result = element.toSvgElement();

      // Assert
      expect(result, isA<Success<SvgElement>>());
      expect((result as Success<SvgElement>).value, isA<SvgLinearGradient>());
    });

    test('should return SvgStop when <stop> is provided', () {
      // Arrange
      final document = XmlDocument.parse('<stop />');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgElement> result = element.toSvgElement();

      // Assert
      expect(result, isA<Success<SvgElement>>());
      expect((result as Success<SvgElement>).value, isA<SvgStop>());
    });

    test('should return SvgStyle when <style> is provided', () {
      // Arrange
      final document = XmlDocument.parse('<style />');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgElement> result = element.toSvgElement();

      // Assert
      expect(result, isA<Success<SvgElement>>());
      expect((result as Success<SvgElement>).value, isA<SvgStyle>());
    });

    test('should return SvgText when <text> is provided', () {
      // Arrange
      final document = XmlDocument.parse('<text />');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgElement> result = element.toSvgElement();

      // Assert
      expect(result, isA<Success<SvgElement>>());
      expect((result as Success<SvgElement>).value, isA<SvgText>());
    });

    test('should return SvgTitle with content and id when <title> is provided', () {
      // Arrange
      const content = '  Sample Title  ';
      const id = 'title-id';
      final document = XmlDocument.parse('<title id="$id">$content</title>');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgElement> result = element.toSvgElement();

      // Assert
      expect(result, isA<Success<SvgElement>>());
      final SvgElement svgElement = (result as Success<SvgElement>).value;
      expect(svgElement, isA<SvgTitle>());

      final title = svgElement as SvgTitle;
      expect(title.content, content.trim());
      expect(title.id, id);
    });

    test('should return SvgDesc with content and id when <desc> is provided', () {
      // Arrange
      const content = '  Sample Description  ';
      const id = 'desc-id';
      final document = XmlDocument.parse('<desc id="$id">$content</desc>');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgElement> result = element.toSvgElement();

      // Assert
      expect(result, isA<Success<SvgElement>>());
      final SvgElement svgElement = (result as Success<SvgElement>).value;
      expect(svgElement, isA<SvgDesc>());

      final desc = svgElement as SvgDesc;
      expect(desc.content, content.trim());
      expect(desc.id, id);
    });

    test('should return SvgGroup when unknown element is provided (lenient parsing)', () {
      // Arrange
      final document = XmlDocument.parse('<unknown fill="red"><circle /></unknown>');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgElement> result = element.toSvgElement();

      // Assert
      expect(result, isA<Success<SvgElement>>());
      final SvgElement value = (result as Success<SvgElement>).value;
      expect(value, isA<SvgGroup>());

      final group = value as SvgGroup;
      expect(group.children, hasLength(1));
      expect(group.children.first, isA<SvgCircle>());
      expect(group.fillAttributes?.color, isA<SvgNamedColor>());
    });

    test('should return SvgIgnoredElement when foreign namespace element is provided', () {
      // Arrange
      final document = XmlDocument.parse(
        '<root xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"><inkscape:perspective id="p1" /></root>',
      );
      final XmlElement element = document.rootElement.firstElementChild!;

      // Act
      final Result<SvgElement> result = element.toSvgElement();

      // Assert
      expect(result, isA<Success<SvgElement>>());
      final SvgElement value = (result as Success<SvgElement>).value;
      expect(value, isA<SvgIgnoredElement>());
      expect(value.id, 'p1');
    });

    group('Regression tests', () {
      test(
        'should convert <circle> with lengths correctly when coordinate values are provided',
        () {
          // Arrange
          final document = XmlDocument.parse('<circle cx="50" cy="50" r="50" />');
          final XmlElement element = document.rootElement;

          // Act
          final Result<SvgElement> result = element.toSvgElement();

          // Assert
          expect(result, isA<Success<SvgElement>>());
          final circle = (result as Success<SvgElement>).value as SvgCircle;
          expect(circle.cx.toString(), '50.0');
        },
      );

      test(
        'should convert <circle> with percentages correctly when percentage values are provided',
        () {
          // Arrange
          final document = XmlDocument.parse('<circle cx="50%" cy="0" r="0" />');
          final XmlElement element = document.rootElement;

          // Act
          final Result<SvgElement> result = element.toSvgElement();

          // Assert
          expect(result, isA<Success<SvgElement>>());
          final circle = (result as Success<SvgElement>).value as SvgCircle;
          expect(circle.cx.toString(), '50.0%');
        },
      );

      test('should convert <circle> with default values when missing attributes are provided', () {
        // Arrange
        final document = XmlDocument.parse('<circle />');
        final XmlElement element = document.rootElement;

        // Act
        final Result<SvgElement> result = element.toSvgElement();

        // Assert
        expect(result, isA<Success<SvgElement>>());
        final circle = (result as Success<SvgElement>).value as SvgCircle;
        expect(circle.cx.toString(), '0.0');
      });
    });
  });
}
