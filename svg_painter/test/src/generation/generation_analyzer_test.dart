import 'package:svg_painter/src/generation/generation_analyzer.dart';
import 'package:svg_painter/src/painting_model/_painting_model.dart';
import 'package:svg_painter/src/svg_model/_svg_model.dart';
import 'package:test/test.dart';

void main() {
  group('GenerationAnalyzer', () {
    const analyzer = GenerationAnalyzer();

    group('collectIds', () {
      test('should collect fill and stroke IDs from nested groups', () {
        // Arrange
        final fillIds = <String>{};
        final strokeIds = <String>{};
        final commands = <PaintCommand>[
          const DrawGroup(
            id: 'g1',
            commands: <PaintCommand>[
              DrawCircle(
                cx: 10,
                cy: 10,
                radius: 5,
                id: 'c1',
                style: PaintingStyle(
                  fill: PaintingFillStyle(colorArgb: 0),
                  stroke: PaintingStrokeStyle(colorArgb: 0),
                ),
              ),
            ],
          ),
        ];

        // Act
        analyzer.collectIds(commands, fillIds, strokeIds);

        // Assert
        expect(fillIds, contains('c1'));
        expect(strokeIds, contains('c1'));
      });
    });

    group('hasDashes', () {
      test('should return true when a command has a dash array', () {
        // Arrange
        final commands = <PaintCommand>[
          const DrawLine(
            x1: 0,
            y1: 0,
            x2: 10,
            y2: 10,
            style: PaintingStyle(
              stroke: PaintingStrokeStyle(colorArgb: 0, dashArray: <double>[5.0, 5.0]),
            ),
          ),
        ];

        // Act & Assert
        expect(analyzer.hasDashes(commands), isTrue);
      });

      test('should return false when no command has a dash array', () {
        // Arrange
        final commands = <PaintCommand>[
          const DrawRect(
            x: 0,
            y: 0,
            width: 10,
            height: 10,
            rx: 0,
            ry: 0,
            style: PaintingStyle(),
          ),
        ];

        // Act & Assert
        expect(analyzer.hasDashes(commands), isFalse);
      });
    });

    group('hasCurrentColor', () {
      test('should return true when fill is current color', () {
        // Arrange
        final commands = <PaintCommand>[
          const DrawRect(
            x: 0,
            y: 0,
            width: 10,
            height: 10,
            rx: 0,
            ry: 0,
            style: PaintingStyle(fill: PaintingFillStyle(colorArgb: 0, isCurrentColor: true)),
          ),
        ];

        // Act & Assert
        expect(analyzer.hasCurrentColor(commands), isTrue);
      });

      test('should return true when stroke is current color', () {
        // Arrange
        final commands = <PaintCommand>[
          const DrawRect(
            x: 0,
            y: 0,
            width: 10,
            height: 10,
            rx: 0,
            ry: 0,
            style: PaintingStyle(stroke: PaintingStrokeStyle(colorArgb: 0, isCurrentColor: true)),
          ),
        ];

        // Act & Assert
        expect(analyzer.hasCurrentColor(commands), isTrue);
      });
    });

    group('needsViewBoxRect', () {
      test('should return true when a gradient uses userSpaceOnUse units', () {
        // Arrange
        final commands = <PaintCommand>[
          const DefineLinearGradient(
            id: 'grad1',
            x1: 0,
            y1: 0,
            x2: 1,
            y2: 1,
            stops: <GradientStop>[],
            units: PaintingGradientUnits.userSpaceOnUse,
          ),
        ];

        // Act & Assert
        expect(analyzer.needsViewBoxRect(commands), isTrue);
      });
    });

    group('findGradientsNeedingStretch', () {
      test('should identify gradients used by non-square ovals', () {
        // Arrange
        final commands = <PaintCommand>[
          const DrawOval(
            cx: 50,
            cy: 50,
            rx: 20,
            ry: 30, // rx != ry
            style: PaintingStyle(fill: PaintingFillStyle(colorArgb: 0, shaderId: 'grad1')),
          ),
        ];

        // Act
        final Set<String> result = analyzer.findGradientsNeedingStretch(commands);

        // Assert
        expect(result, contains('grad1'));
      });
    });

    group('needsGradientTransform', () {
      test('should return true when a gradient has transform attributes', () {
        // Arrange
        final commands = <PaintCommand>[
          const DefineLinearGradient(
            id: 'grad1',
            x1: 0,
            y1: 0,
            x2: 1,
            y2: 1,
            stops: <GradientStop>[],
            transformAttributes: SvgTransformAttributes(<SvgTransformOperation>[]),
          ),
        ];

        // Act & Assert
        expect(analyzer.needsGradientTransform(commands, <String>{}), isTrue);
      });
    });
  });
}
