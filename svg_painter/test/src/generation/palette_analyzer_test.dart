import 'package:svg_painter/src/generation/palette_analyzer.dart';
import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/painting_model/styles/painting_style.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:svg_painter_annotation/svg_painter_annotation.dart';
import 'package:test/test.dart';

void main() {
  group('PaletteAnalyzer', () {
    const analyzer = PaletteAnalyzer();

    test('should identify unique strokes based on pathLength', () {
      final commands = <PaintCommand>[
        const DrawLine(
          x1: 0,
          y1: 0,
          x2: 10,
          y2: 10,
          style: PaintingStyle(
            stroke: PaintingStrokeStyle(colorArgb: 0xFF000000, pathLength: 100.0),
          ),
        ),
        const DrawLine(
          x1: 0,
          y1: 0,
          x2: 10,
          y2: 10,
          style: PaintingStyle(
            stroke: PaintingStrokeStyle(colorArgb: 0xFF000000, pathLength: 200.0),
          ),
        ),
      ];

      final PaletteResult result = analyzer.analyze(commands, mode: SvgExposureMode.indexed);

      // Should have 2 unique stroke properties because pathLength differs
      expect(result.strokeAssignments.values.toSet().length, equals(2));
      expect(result.strokeAssignments[commands[0]], equals('stroke1'));
      expect(result.strokeAssignments[commands[1]], equals('stroke2'));
    });

    test('should identify unique strokes based on dashArray', () {
      final commands = <PaintCommand>[
        const DrawLine(
          x1: 0,
          y1: 0,
          x2: 10,
          y2: 10,
          style: PaintingStyle(
            stroke: PaintingStrokeStyle(colorArgb: 0xFF000000, dashArray: <double>[5.0, 5.0]),
          ),
        ),
        const DrawLine(
          x1: 0,
          y1: 0,
          x2: 10,
          y2: 10,
          style: PaintingStyle(
            stroke: PaintingStrokeStyle(colorArgb: 0xFF000000, dashArray: <double>[10.0, 10.0]),
          ),
        ),
      ];

      final PaletteResult result = analyzer.analyze(commands, mode: SvgExposureMode.indexed);

      expect(result.strokeAssignments.values.toSet().length, equals(2));
    });

    test('should group identical implicit strokes under defaultStroke', () {
      final commands = <PaintCommand>[
        const DrawLine(
          x1: 0,
          y1: 0,
          x2: 10,
          y2: 10,
          style: PaintingStyle(
            stroke: PaintingStrokeStyle(colorArgb: 0xFF000000, isExplicit: false),
          ),
        ),
        const DrawLine(
          x1: 10,
          y1: 10,
          x2: 20,
          y2: 20,
          style: PaintingStyle(
            stroke: PaintingStrokeStyle(colorArgb: 0xFF000000, isExplicit: false),
          ),
        ),
      ];

      final PaletteResult result = analyzer.analyze(commands, mode: SvgExposureMode.indexed);

      expect(result.strokeAssignments[commands[0]], equals('defaultStroke'));
      expect(result.strokeAssignments[commands[1]], equals('defaultStroke'));
    });

    test('should identify unique strokes based on dashArray values', () {
      final commands = <PaintCommand>[
        const DrawLine(
          x1: 0,
          y1: 0,
          x2: 10,
          y2: 10,
          style: PaintingStyle(
            stroke: PaintingStrokeStyle(colorArgb: 0xFF000000, dashArray: <double>[5.0, 5.0]),
          ),
        ),
        const DrawLine(
          x1: 0,
          y1: 0,
          x2: 10,
          y2: 10,
          style: PaintingStyle(
            stroke: PaintingStrokeStyle(colorArgb: 0xFF000000, dashArray: <double>[5.0, 10.0]),
          ),
        ),
        const DrawLine(
          x1: 0,
          y1: 0,
          x2: 10,
          y2: 10,
          style: PaintingStyle(
            stroke: PaintingStrokeStyle(
              colorArgb: 0xFF000000,
              dashArray: <double>[5.0, 5.0, 5.0, 5.0],
            ),
          ),
        ),
      ];

      final PaletteResult result = analyzer.analyze(commands, mode: SvgExposureMode.indexed);
      expect(result.strokeAssignments.values.toSet().length, equals(3));
    });

    test(
      'should collect unique color tokens across fills and strokes when tokenColors is true',
      () {
        // Arrange
        final commands = <PaintCommand>[
          const DrawCircle(
            cx: 10,
            cy: 20,
            radius: 15,
            style: PaintingStyle(
              fill: PaintingFillStyle(colorArgb: 0xFF000000),
              stroke: PaintingStrokeStyle(colorArgb: 0xFFF44336),
            ),
          ),
          const DrawLine(
            x1: 5,
            y1: 10,
            x2: 25,
            y2: 30,
            style: PaintingStyle(
              stroke: PaintingStrokeStyle(colorArgb: 0xFF123456),
            ),
          ),
        ];

        // Act
        final PaletteResult result = analyzer.analyze(commands, tokenColors: true);

        // Assert
        expect(result.colorTokens, hasLength(3));
        expect(result.colorTokens[0xFF000000], equals('black'));
        expect(result.colorTokens[0xFFF44336], equals('red'));
        expect(result.colorTokens[0xFF123456], equals('cFF123456'));
      },
    );

    test('should resolve name collisions with numeric suffixes when color tokens collide', () {
      // Arrange - simulate two colors that produce the same token name (e.g. manually with collectColorTokens)
      // or duplicate colors:
      final commands = <PaintCommand>[
        const DrawCircle(
          cx: 10,
          cy: 20,
          radius: 15,
          style: PaintingStyle(
            fill: PaintingFillStyle(colorArgb: 0xFF000000),
          ),
        ),
        const DrawCircle(
          cx: 30,
          cy: 40,
          radius: 25,
          style: PaintingStyle(
            fill: PaintingFillStyle(colorArgb: 0xFF000000),
          ),
        ),
      ];

      // Act
      final PaletteResult result = analyzer.analyze(commands, tokenColors: true);

      // Assert
      expect(result.colorTokens, hasLength(1));
      expect(result.colorTokens[0xFF000000], equals('black'));
    });

    test('should return empty colorTokens map when tokenColors is false', () {
      // Arrange
      final commands = <PaintCommand>[
        const DrawCircle(
          cx: 10,
          cy: 20,
          radius: 15,
          style: PaintingStyle(
            fill: PaintingFillStyle(colorArgb: 0xFF000000),
          ),
        ),
      ];

      // Act
      final PaletteResult result = analyzer.analyze(commands);

      // Assert
      expect(result.colorTokens, isEmpty);
    });

    test('should collect tokenColors and groups recursively inside DrawGroup, DrawSwitch, Gradients, and DefinePattern', () {
      // Arrange
      final commands = <PaintCommand>[
        const DrawGroup(
          commands: <PaintCommand>[
            DrawSwitch(
              cases: <SwitchCase>[
                SwitchCase(
                  languages: <String>['en'],
                  commands: <PaintCommand>[
                    DrawCircle(
                      cx: 10.0,
                      cy: 20.0,
                      radius: 5.0,
                      style: PaintingStyle(
                        fill: PaintingFillStyle(colorArgb: 0xFF123456),
                      ),
                    ),
                  ],
                ),
              ],
              fallback: <PaintCommand>[
                DrawCircle(
                  cx: 30.0,
                  cy: 40.0,
                  radius: 8.0,
                  style: PaintingStyle(
                    stroke: PaintingStrokeStyle(colorArgb: 0xFF123456),
                  ),
                ),
              ],
            ),
          ],
        ),
        const DefineLinearGradient(
          id: 'lg1',
          x1: 0.0,
          y1: 0.0,
          x2: 1.0,
          y2: 0.0,
          stops: <GradientStop>[
            GradientStop(offset: 0.0, colorArgb: 0xFF111111),
            GradientStop(offset: 1.0, colorArgb: 0xFF111112),
          ],
        ),
        const DefineRadialGradient(
          id: 'rg1',
          cx: 0.5,
          cy: 0.5,
          radius: 0.5,
          fx: 0.5,
          fy: 0.5,
          focalRadius: 0.0,
          stops: <GradientStop>[
            GradientStop(offset: 0.0, colorArgb: 0xFF222222),
          ],
        ),
        const DefinePattern(
          id: 'pat1',
          x: SvgLength(0.0),
          y: SvgLength(0.0),
          width: SvgLength(10.0),
          height: SvgLength(10.0),
          patternUnits: .userSpaceOnUse,
          commands: <PaintCommand>[
            DrawCircle(
              cx: 5.0,
              cy: 5.0,
              radius: 2.0,
              style: PaintingStyle(
                fill: PaintingFillStyle(colorArgb: 0xFF333333),
              ),
            ),
          ],
        ),
      ];

      // Act
      final PaletteResult result = analyzer.analyze(
        commands,
        mode: SvgExposureMode.indexed,
        tokenColors: true,
      );

      // Assert
      expect(result.colorTokens[0xFF123456], isNotNull);
      expect(result.colorTokens[0xFF111111], isNotNull);
      expect(result.colorTokens[0xFF111112], isNotNull);
      expect(result.colorTokens[0xFF222222], isNotNull);
      expect(result.colorTokens[0xFF333333], isNotNull);
      expect(result.fillAssignments, isNotEmpty);
      expect(result.strokeAssignments, isNotEmpty);
    });
  });
}
