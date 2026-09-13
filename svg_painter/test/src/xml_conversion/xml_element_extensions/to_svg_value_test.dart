import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:svg_painter/src/xml_conversion/xml_element_extensions/to_svg_value.dart';
import 'package:svg_painter/src/xml_model/xml_attribute_name.dart';
import 'package:svg_painter/src/xml_model/xml_element_name.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
  group('ToSvgValue', () {
    test('toSvgValue should return parsed value when present', () {
      // Arrange
      final document = XmlDocument.parse('<rect x="10" />');
      final XmlElement element = document.rootElement;

      // Act
      final SvgLengthPercentage result = element.toSvgValue<SvgLengthPercentage>(
        XmlElementName.rect,
        XmlAttributeName.x,
      );

      // Assert
      expect(result, isA<SvgLength>().having((SvgLength l) => l.value, 'value', 10.0));
    });

    test('toSvgValue should return default value when absent', () {
      // Arrange
      final document = XmlDocument.parse('<rect />');
      final XmlElement element = document.rootElement;

      // Act
      final SvgLengthPercentage result = element.toSvgValue<SvgLengthPercentage>(
        XmlElementName.rect,
        XmlAttributeName.x,
      );

      // Assert
      expect(result, const SvgLength(0.0));
    });

    test('toSvgValue should throw UnsupportedError when default value type mismatches', () {
      // Arrange
      final document = XmlDocument.parse('<rect />');
      final XmlElement element = document.rootElement;

      // Act & Assert
      expect(
        () => element.toSvgValue<SvgColor>(XmlElementName.rect, XmlAttributeName.x),
        throwsUnsupportedError,
      );
    });

    test('toSvgValueOrNull should return null when absent', () {
      // Arrange
      final document = XmlDocument.parse('<rect />');
      final XmlElement element = document.rootElement;

      // Act
      final SvgLengthPercentage? result = element.toSvgValueOrNull<SvgLengthPercentage>(
        XmlElementName.rect,
        XmlAttributeName.x,
      );

      // Assert
      expect(result, isNull);
    });

    test('toSvgValueOrNull should return null for string-only attributes', () {
      // Arrange
      final document = XmlDocument.parse('<rect id="r1" />');
      final XmlElement element = document.rootElement;

      // Act
      final SvgBaseValue? result = element.toSvgValueOrNull<SvgBaseValue>(
        XmlElementName.rect,
        XmlAttributeName.id,
      );

      // Assert
      expect(result, isNull);
    });

    test('toSvgValueOrNull should return parsed SvgNonNegativeNumber for pathLength', () {
      // Arrange
      final document = XmlDocument.parse('<rect pathLength="100" />');
      final XmlElement element = document.rootElement;

      // Act
      final SvgBaseValue? result = element.toSvgValueOrNull<SvgBaseValue>(
        XmlElementName.rect,
        XmlAttributeName.pathLength,
      );

      // Assert
      expect(
        result,
        isA<SvgNonNegativeNumber>().having((SvgNonNegativeNumber n) => n.value, 'value', 100.0),
      );
    });

    test('toSvgValueOrNull should throw UnsupportedError on type mismatch', () {
      // Arrange
      final document = XmlDocument.parse('<rect x="10" />');
      final XmlElement element = document.rootElement;

      // Act & Assert
      expect(
        () => element.toSvgValueOrNull<SvgColor>(XmlElementName.rect, XmlAttributeName.x),
        throwsUnsupportedError,
      );
    });

    test('toSvgValueOrNull should handle all attribute types in switch', () {
      // This test is to ensure coverage of the switch statement branches
      final tests = <XmlAttributeName, String>{
        XmlAttributeName.x: '10',
        XmlAttributeName.width: '100',
        XmlAttributeName.pathLength: '50',
        XmlAttributeName.points: '0,0 10,10',
        XmlAttributeName.fill: 'red',
        XmlAttributeName.strokeLinecap: 'round',
        XmlAttributeName.strokeLinejoin: 'bevel',
      };

      for (final MapEntry<XmlAttributeName, String> entry in tests.entries) {
        final document = XmlDocument.parse(
          '<rect ${entry.key.name}="${entry.value}" />',
        );
        final XmlElement element = document.rootElement;
        final SvgBaseValue? result = element.toSvgValueOrNull<SvgBaseValue>(
          XmlElementName.rect,
          entry.key,
        );
        expect(result, isNotNull, reason: 'Failed for ${entry.key}');
      }
    });

    test('toSvgValueOrNull should return null for complex/special attributes', () {
      final complexAttributes = <XmlAttributeName>[
        XmlAttributeName.viewBox,
        XmlAttributeName.preserveAspectRatio,
        XmlAttributeName.id,
        XmlAttributeName.d,
        XmlAttributeName.className,
        XmlAttributeName.style,
        XmlAttributeName.href,
        XmlAttributeName.transform,
        XmlAttributeName.gradientTransform,
      ];

      for (final attr in complexAttributes) {
        final document = XmlDocument.parse('<path ${attr.name}="something" />');
        final XmlElement element = document.rootElement;
        final SvgBaseValue? result = element.toSvgValueOrNull<SvgBaseValue>(
          XmlElementName.path,
          attr,
        );
        expect(result, isNull, reason: 'Failed for ${attr.name}');
      }
    });

    test('toSvgValueOrNull should handle font weight, style, and family', () {
      final fontTests = <XmlAttributeName, String>{
        XmlAttributeName.fontWeight: 'bold',
        XmlAttributeName.fontStyle: 'italic',
        XmlAttributeName.fontFamily: 'Arial',
      };

      for (final MapEntry<XmlAttributeName, String> entry in fontTests.entries) {
        final document = XmlDocument.parse(
          '<text ${entry.key.name}="${entry.value}" />',
        );
        final XmlElement element = document.rootElement;
        final SvgBaseValue? result = element.toSvgValueOrNull<SvgBaseValue>(
          XmlElementName.text,
          entry.key,
        );
        expect(result, isNotNull, reason: 'Failed for ${entry.key}');
      }
    });

    test('toPathLength should return SvgNumber for valid pathLength', () {
      // Arrange
      final document = XmlDocument.parse('<path pathLength="100" />');
      final XmlElement element = document.rootElement;

      // Act
      final SvgNumber? result = element.toPathLength();

      // Assert
      expect(
        result,
        isA<SvgNonNegativeNumber>().having((SvgNonNegativeNumber n) => n.value, 'value', 100.0),
      );
    });

    test('toPathLength should return null for missing, malformed or negative pathLength', () {
      expect(XmlDocument.parse('<path />').rootElement.toPathLength(), isNull);
      expect(XmlDocument.parse('<path pathLength="abc" />').rootElement.toPathLength(), isNull);
      expect(XmlDocument.parse('<path pathLength="-10" />').rootElement.toPathLength(), isNull);
    });

    test('toSvgValueOrNull should return null for negative radius, width, or height', () {
      final nonNegativeAttributes = <XmlAttributeName>[
        XmlAttributeName.r,
        XmlAttributeName.rx,
        XmlAttributeName.ry,
        XmlAttributeName.width,
        XmlAttributeName.height,
      ];

      for (final attr in nonNegativeAttributes) {
        final document = XmlDocument.parse('<rect ${attr.name}="-10" />');
        final XmlElement element = document.rootElement;
        final SvgBaseValue? result = element.toSvgValueOrNull<SvgBaseValue>(
          XmlElementName.rect,
          attr,
        );
        expect(result, isNull, reason: 'Failed for ${attr.name}');
      }
    });

    test('toSvgValue should return parsed fill-rule when present and default when absent', () {
      // Arrange
      final docPresent = XmlDocument.parse('<path fill-rule="evenodd" />');
      final docAbsent = XmlDocument.parse('<path />');

      // Act
      final SvgFillRule resultPresent = docPresent.rootElement.toSvgValue<SvgFillRule>(
        XmlElementName.path,
        XmlAttributeName.fillRule,
      );
      final SvgFillRule resultAbsent = docAbsent.rootElement.toSvgValue<SvgFillRule>(
        XmlElementName.path,
        XmlAttributeName.fillRule,
      );

      // Assert
      expect(resultPresent, SvgFillRule.evenodd);
      expect(resultAbsent, SvgFillRule.nonzero);
    });

    test('toSvgValue should return parsed text-anchor when present and default when absent', () {
      // Arrange
      final docPresent = XmlDocument.parse('<text text-anchor="middle" />');
      final docAbsent = XmlDocument.parse('<text />');

      // Act
      final SvgTextAnchor resultPresent = docPresent.rootElement.toSvgValue<SvgTextAnchor>(
        XmlElementName.text,
        XmlAttributeName.textAnchor,
      );
      final SvgTextAnchor resultAbsent = docAbsent.rootElement.toSvgValue<SvgTextAnchor>(
        XmlElementName.text,
        XmlAttributeName.textAnchor,
      );

      // Assert
      expect(resultPresent, SvgTextAnchor.middle);
      expect(resultAbsent, SvgTextAnchor.start);
    });

    test('toSvgValue should return parsed stroke-dashoffset when present and default when absent', () {
      // Arrange
      final docPresent = XmlDocument.parse('<line stroke-dashoffset="15.5" />');
      final docAbsent = XmlDocument.parse('<line />');

      // Act
      final SvgLengthPercentage resultPresent = docPresent.rootElement.toSvgValue<SvgLengthPercentage>(
        XmlElementName.line,
        XmlAttributeName.strokeDashoffset,
      );
      final SvgLengthPercentage resultAbsent = docAbsent.rootElement.toSvgValue<SvgLengthPercentage>(
        XmlElementName.line,
        XmlAttributeName.strokeDashoffset,
      );

      // Assert
      expect(resultPresent, isA<SvgLength>().having((SvgLength l) => l.value, 'value', 15.5));
      expect(resultAbsent, isA<SvgLength>().having((SvgLength l) => l.value, 'value', 0.0));
    });

    test('toSvgValue should return parsed paint-order when present and default when absent', () {
      // Arrange
      final docPresent = XmlDocument.parse('<path paint-order="stroke" />');
      final docAbsent = XmlDocument.parse('<path />');

      // Act
      final SvgPaintOrder resultPresent = docPresent.rootElement.toSvgValue<SvgPaintOrder>(
        XmlElementName.path,
        XmlAttributeName.paintOrder,
      );
      final SvgPaintOrder resultAbsent = docAbsent.rootElement.toSvgValue<SvgPaintOrder>(
        XmlElementName.path,
        XmlAttributeName.paintOrder,
      );

      // Assert
      expect(
        resultPresent,
        const SvgPaintOrder(<SvgPaintOrderComponent>[
          SvgPaintOrderComponent.stroke,
          SvgPaintOrderComponent.fill,
          SvgPaintOrderComponent.markers,
        ]),
      );
      expect(resultAbsent, SvgPaintOrder.normal);
    });

    test('toSvgValue should return parsed vector-effect when present and default when absent', () {
      // Arrange
      final docPresent = XmlDocument.parse('<path vector-effect="non-scaling-stroke" />');
      final docAbsent = XmlDocument.parse('<path />');

      // Act
      final SvgVectorEffect resultPresent = docPresent.rootElement.toSvgValue<SvgVectorEffect>(
        XmlElementName.path,
        XmlAttributeName.vectorEffect,
      );
      final SvgVectorEffect resultAbsent = docAbsent.rootElement.toSvgValue<SvgVectorEffect>(
        XmlElementName.path,
        XmlAttributeName.vectorEffect,
      );

      // Assert
      expect(resultPresent, SvgVectorEffect.nonScalingStroke);
      expect(resultAbsent, SvgVectorEffect.none);
    });
  });
}
