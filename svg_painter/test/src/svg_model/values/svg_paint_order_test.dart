import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgPaintOrderComponent', () {
    test('should have correct enum values when inspected', () {
      // Arrange & Act & Assert
      expect(SvgPaintOrderComponent.values, hasLength(3));
      expect(SvgPaintOrderComponent.fill.value, 'fill');
      expect(SvgPaintOrderComponent.stroke.value, 'stroke');
      expect(SvgPaintOrderComponent.markers.value, 'markers');
    });

    test('should return correct enum when valid string provided to from', () {
      // Arrange & Act
      final SvgPaintOrderComponent? fill = SvgPaintOrderComponent.from('fill');
      final SvgPaintOrderComponent? stroke = SvgPaintOrderComponent.from('stroke');
      final SvgPaintOrderComponent? markers = SvgPaintOrderComponent.from('markers');

      // Assert
      expect(fill, SvgPaintOrderComponent.fill);
      expect(stroke, SvgPaintOrderComponent.stroke);
      expect(markers, SvgPaintOrderComponent.markers);
    });

    test('should return null when null or unknown string provided to from', () {
      // Arrange & Act
      final SvgPaintOrderComponent? nullResult = SvgPaintOrderComponent.from(null);
      final SvgPaintOrderComponent? unknownResult = SvgPaintOrderComponent.from('unknown');

      // Assert
      expect(nullResult, isNull);
      expect(unknownResult, isNull);
    });
  });

  group('SvgPaintOrder', () {
    test('should have normal order as default constant', () {
      // Arrange & Act
      const SvgPaintOrder normal = SvgPaintOrder.normal;

      // Assert
      expect(normal.components, <SvgPaintOrderComponent>[
        SvgPaintOrderComponent.fill,
        SvgPaintOrderComponent.stroke,
        SvgPaintOrderComponent.markers,
      ]);
      expect(normal.isStrokeFirst, isFalse);
    });

    test('should report isStrokeFirst true when stroke precedes fill', () {
      // Arrange
      const order = SvgPaintOrder(<SvgPaintOrderComponent>[
        SvgPaintOrderComponent.stroke,
        SvgPaintOrderComponent.fill,
        SvgPaintOrderComponent.markers,
      ]);

      // Act & Assert
      expect(order.isStrokeFirst, isTrue);
    });

    test('should report isStrokeFirst false when fill precedes stroke', () {
      // Arrange
      const order = SvgPaintOrder(<SvgPaintOrderComponent>[
        SvgPaintOrderComponent.markers,
        SvgPaintOrderComponent.fill,
        SvgPaintOrderComponent.stroke,
      ]);

      // Act & Assert
      expect(order.isStrokeFirst, isFalse);
    });

    test('should return correct string representation when toString is called', () {
      // Arrange
      const order = SvgPaintOrder(<SvgPaintOrderComponent>[
        SvgPaintOrderComponent.stroke,
        SvgPaintOrderComponent.markers,
        SvgPaintOrderComponent.fill,
      ]);

      // Act
      final result = order.toString();

      // Assert
      expect(result, 'SvgPaintOrder(stroke markers fill)');
    });

    test('should support equality and hashCode correctly', () {
      // Arrange
      const order1 = SvgPaintOrder(<SvgPaintOrderComponent>[
        SvgPaintOrderComponent.stroke,
        SvgPaintOrderComponent.fill,
        SvgPaintOrderComponent.markers,
      ]);
      const order2 = SvgPaintOrder(<SvgPaintOrderComponent>[
        SvgPaintOrderComponent.stroke,
        SvgPaintOrderComponent.fill,
        SvgPaintOrderComponent.markers,
      ]);
      const SvgPaintOrder order3 = SvgPaintOrder.normal;

      // Act & Assert
      expect(order1, equals(order2));
      expect(order1.hashCode, equals(order2.hashCode));
      expect(order1, isNot(equals(order3)));
    });
  });
}
