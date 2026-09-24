import 'package:svg_painter/src/svg_model/values/svg_media_query.dart';
import 'package:test/test.dart';

void main() {
  group('SvgMediaQuery', () {
    test('should return null when raw string is null', () {
      // Arrange
      const String? input = null;

      // Act
      final SvgMediaQuery? result = SvgMediaQuery.parse(input);

      // Assert
      expect(result, isNull);
    });

    test('should return SvgMediaAll when raw string is empty or all', () {
      // Arrange
      const inputEmpty = '';
      const inputAll = 'all';

      // Act
      final SvgMediaQuery? resultEmpty = SvgMediaQuery.parse(inputEmpty);
      final SvgMediaQuery? resultAll = SvgMediaQuery.parse(inputAll);

      // Assert
      expect(resultEmpty, isA<SvgMediaAll>());
      expect(resultAll, isA<SvgMediaAll>());
      expect(resultAll!.matches(width: 500.0, height: 300.0), isTrue);
      expect(resultAll.toDartCondition('size'), equals('true'));
    });

    test('should parse modern range comparison with px unit', () {
      // Arrange
      const input = '(width >= 600px)';

      // Act
      final SvgMediaQuery? result = SvgMediaQuery.parse(input);

      // Assert
      expect(result, isA<SvgMediaDimensionComparison>());
      final comp = result! as SvgMediaDimensionComparison;
      expect(comp.dimension, equals(SvgMediaDimension.width));
      expect(comp.operator, equals('>='));
      expect(comp.value, equals(600.0));
      expect(comp.matches(width: 600.0, height: 100.0), isTrue);
      expect(comp.matches(width: 650.0, height: 100.0), isTrue);
      expect(comp.matches(width: 599.0, height: 100.0), isFalse);
      expect(comp.toDartCondition('size'), equals('size.width >= 600.0'));
    });

    test('should parse modern range comparison for height without px unit', () {
      // Arrange
      const input = '(height < 450.5)';

      // Act
      final SvgMediaQuery? result = SvgMediaQuery.parse(input);

      // Assert
      expect(result, isA<SvgMediaDimensionComparison>());
      final comp = result! as SvgMediaDimensionComparison;
      expect(comp.dimension, equals(SvgMediaDimension.height));
      expect(comp.operator, equals('<'));
      expect(comp.value, equals(450.5));
      expect(comp.matches(width: 100.0, height: 400.0), isTrue);
      expect(comp.matches(width: 100.0, height: 450.5), isFalse);
      expect(comp.toDartCondition('size'), equals('size.height < 450.5'));
    });

    test('should parse traditional min-width prefix syntax', () {
      // Arrange
      const input = '(min-width: 750px)';

      // Act
      final SvgMediaQuery? result = SvgMediaQuery.parse(input);

      // Assert
      expect(result, isA<SvgMediaDimensionComparison>());
      final comp = result! as SvgMediaDimensionComparison;
      expect(comp.dimension, equals(SvgMediaDimension.width));
      expect(comp.operator, equals('>='));
      expect(comp.value, equals(750.0));
      expect(comp.matches(width: 750.0, height: 100.0), isTrue);
      expect(comp.matches(width: 749.0, height: 100.0), isFalse);
    });

    test('should parse traditional max-height prefix syntax', () {
      // Arrange
      const input = '(max-height: 320px)';

      // Act
      final SvgMediaQuery? result = SvgMediaQuery.parse(input);

      // Assert
      expect(result, isA<SvgMediaDimensionComparison>());
      final comp = result! as SvgMediaDimensionComparison;
      expect(comp.dimension, equals(SvgMediaDimension.height));
      expect(comp.operator, equals('<='));
      expect(comp.value, equals(320.0));
      expect(comp.matches(width: 100.0, height: 320.0), isTrue);
      expect(comp.matches(width: 100.0, height: 321.0), isFalse);
    });

    test('should return null when media query syntax is unknown', () {
      // Arrange
      const input = '(unknown-query)';

      // Act
      final SvgMediaQuery? result = SvgMediaQuery.parse(input);

      // Assert
      expect(result, isNull);
    });
  });
}
