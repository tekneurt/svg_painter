import 'package:svg_painter/src/generation/command_generator.dart';
import 'package:svg_painter/src/generation/generator_buffer.dart';
import 'package:svg_painter/src/generation/generators/circle_generator.dart';
import 'package:svg_painter/src/generation/generators/rect_generator.dart';
import 'package:svg_painter/src/generation/generators/switch_generator.dart';
import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/painting_model/styles/painting_style.dart';
import 'package:svg_painter/src/svg_model/attribute_groups/svg_transform_attributes.dart';
import 'package:test/test.dart';

void main() {
  group('SwitchGenerator', () {
    const generator = SwitchGenerator();

    final generators = <Type, CommandGenerator<PaintCommand>>{
      DrawCircle: const CircleGenerator(),
      DrawRect: const RectGenerator(),
    };

    test('should return early when generators map is null', () {
      // Arrange
      const command = DrawSwitch(
        cases: <SwitchCase>[],
        fallback: <PaintCommand>[
          DrawCircle(cx: 10.0, cy: 20.0, radius: 5.0, style: PaintingStyle()),
        ],
      );
      final buffer = GeneratorBuffer();

      // Act
      generator.generate(command, buffer);

      // Assert
      expect(buffer.toString(), isEmpty);
    });

    test('should emit fallback commands directly when cases list is empty', () {
      // Arrange
      const command = DrawSwitch(
        cases: <SwitchCase>[],
        fallback: <PaintCommand>[
          DrawCircle(
            cx: 15.0,
            cy: 25.0,
            radius: 10.0,
            style: PaintingStyle(fill: PaintingFillStyle(colorArgb: 0xFF112233)),
          ),
        ],
      );
      final buffer = GeneratorBuffer();

      // Act
      generator.generate(command, buffer, generators: generators);

      // Assert
      final output = buffer.toString();
      expect(output, isNot(contains('PlatformDispatcher')));
      expect(output, contains('canvas.drawCircle(const Offset(15.0, 25.0), 10.0, paint);'));
    });

    test('should emit if / else if / else locale branches when cases and fallback exist', () {
      // Arrange
      const command = DrawSwitch(
        cases: <SwitchCase>[
          SwitchCase(
            languages: <String>['nl', 'nl-be'],
            commands: <PaintCommand>[
              DrawCircle(
                cx: 12.0,
                cy: 24.0,
                radius: 6.0,
                style: PaintingStyle(fill: PaintingFillStyle(colorArgb: 0xFFFF8800)),
              ),
            ],
          ),
          SwitchCase(
            languages: <String>['fr'],
            commands: <PaintCommand>[
              DrawRect(
                x: 5.0,
                y: 10.0,
                width: 30.0,
                height: 40.0,
                rx: 0.0,
                ry: 0.0,
                style: PaintingStyle(fill: PaintingFillStyle(colorArgb: 0xFF0055AA)),
              ),
            ],
          ),
        ],
        fallback: <PaintCommand>[
          DrawCircle(
            cx: 50.0,
            cy: 60.0,
            radius: 15.0,
            style: PaintingStyle(fill: PaintingFillStyle(colorArgb: 0xFF00AA55)),
          ),
        ],
        style: PaintingStyle(
          transformAttributes: SvgTransformAttributes(<SvgTransformOperation>[
            SvgTranslate(3.0, 7.0),
          ]),
        ),
      );
      final buffer = GeneratorBuffer();

      // Act
      generator.generate(command, buffer, generators: generators);

      // Assert
      final output = buffer.toString();
      expect(output, contains('canvas.translate(3.0, 7.0);'));
      expect(
        output,
        contains(
          'final String currentLocale = ui.PlatformDispatcher.instance.locale.toLanguageTag().toLowerCase();',
        ),
      );
      expect(
        output,
        contains(
          r"if (currentLocale == 'nl' || currentLocale.startsWith('nl-') || 'nl'.startsWith('$currentLocale-') || currentLocale == 'nl-be' || currentLocale.startsWith('nl-be-') || 'nl-be'.startsWith('$currentLocale-')) {",
        ),
      );
      expect(output, contains('canvas.drawCircle(const Offset(12.0, 24.0), 6.0, paint);'));
      expect(
        output,
        contains(
          r"else if (currentLocale == 'fr' || currentLocale.startsWith('fr-') || 'fr'.startsWith('$currentLocale-')) {",
        ),
      );
      expect(output, contains('Rect.fromLTWH(5.0, 10.0, 30.0, 40.0)'));
      expect(output, contains('else {'));
      expect(output, contains('canvas.drawCircle(const Offset(50.0, 60.0), 15.0, paint);'));
    });

    test('should omit else block when fallback list is empty', () {
      // Arrange
      const command = DrawSwitch(
        cases: <SwitchCase>[
          SwitchCase(
            languages: <String>['de'],
            commands: <PaintCommand>[
              DrawCircle(
                cx: 8.0,
                cy: 16.0,
                radius: 4.0,
                style: PaintingStyle(fill: PaintingFillStyle(colorArgb: 0xFF223344)),
              ),
            ],
          ),
        ],
      );
      final buffer = GeneratorBuffer();

      // Act
      generator.generate(command, buffer, generators: generators);

      // Assert
      final output = buffer.toString();
      expect(output, contains("if (currentLocale == 'de'"));
      expect(output, isNot(contains('else {')));
    });
  });
}
