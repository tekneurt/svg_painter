import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/painting_model/styles/painting_style.dart';
import 'package:svg_painter/src/svg_conversion/converters/svg_painting_context.dart';
import 'package:svg_painter/src/svg_conversion/svg_element_extensions/svg_text_to_painting.dart';
import 'package:svg_painter/src/svg_model/attribute_groups/svg_core_attributes.dart';
import 'package:svg_painter/src/svg_model/attribute_groups/svg_fill_attributes.dart';
import 'package:svg_painter/src/svg_model/attribute_groups/svg_presentation_attributes.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  const context = SvgPaintingContext(viewBoxWidth: 100, viewBoxHeight: 200);

  group('SvgTextToPaintCommands', () {
    test('should return Success with DrawText when valid SvgText is provided', () {
      // Arrange
      const text = SvgText(
        x: SvgLength(10.0),
        y: SvgLength(20.0),
        children: <SvgTextContent>[SvgCharacterData('Hello')],
      );

      // Act
      final Result<List<PaintCommand>> result = text.toPaintCommands(context);

      // Assert
      expect(result, isA<Success<List<PaintCommand>>>());
      final List<PaintCommand> commands = (result as Success<List<PaintCommand>>).value;
      expect(commands, hasLength(1));
      expect(commands.first, isA<DrawText>());
      final drawText = commands.first as DrawText;
      expect(drawText.rootSpan.children.first.text, 'Hello');
      expect(drawText.x, 10.0);
      expect(drawText.y, 20.0);
    });

    test('should shift x and y coordinates when dx and dy are provided', () {
      // Arrange
      const text = SvgText(
        x: SvgLength(10.0),
        y: SvgLength(20.0),
        dx: SvgLength(5.0),
        dy: SvgLength(15.0),
        children: <SvgTextContent>[SvgCharacterData('Offset')],
      );

      // Act
      final Result<List<PaintCommand>> result = text.toPaintCommands(context);

      // Assert
      expect(result, isA<Success<List<PaintCommand>>>());
      final List<PaintCommand> commands = (result as Success<List<PaintCommand>>).value;
      expect(commands, hasLength(1));
      expect(commands.first, isA<DrawText>());
      final drawText = commands.first as DrawText;
      expect(drawText.rootSpan.children.first.text, 'Offset');
      expect(drawText.x, 15.0);
      expect(drawText.y, 35.0);
    });

    test('should handle nested tspan with relative dx, dy and rotate', () {
      const text = SvgText(
        x: SvgLength(10.0),
        y: SvgLength(20.0),
        children: [
          SvgCharacterData('Outer'),
          SvgTspan(
            dx: SvgLength(5),
            dy: SvgLength(5),
            rotate: SvgGenericNumber(10),
            children: [
              SvgCharacterData('Inner'),
            ],
          ),
        ],
      );

      final Result<List<PaintCommand>> result = text.toPaintCommands(context);
      final List<PaintCommand> cmds = (result as Success<List<PaintCommand>>).value;
      final drawText = cmds.single as DrawText;

      expect(drawText.rootSpan.children, hasLength(2));
      expect(drawText.rootSpan.children[0].text, 'Outer');

      final PaintingTextSpan tspanSpan = drawText.rootSpan.children[1];
      expect(tspanSpan.text, isNull);
      expect(tspanSpan.children, hasLength(1));
      expect(tspanSpan.children[0].text, 'Inner');
    });

    test('should return Success with DrawTextPath when SvgText contains SvgTextPath', () {
      // Arrange
      const path = SvgPath(
        d: 'M0,0 L100,100',
        coreAttributes: SvgCoreAttributes(id: 'p1'),
      );
      const contextWithDef = SvgPaintingContext(
        viewBoxWidth: 100,
        viewBoxHeight: 200,
        definitions: <String, SvgElement>{'p1': path},
      );
      const text = SvgText(
        x: SvgLength(0.0),
        y: SvgLength(0.0),
        children: <SvgTextContent>[
          SvgTextPath(
            href: '#p1',
            startOffset: SvgLength(10.0),
            children: <SvgTextContent>[SvgCharacterData('Path Text')],
          ),
        ],
      );

      // Act
      final Result<List<PaintCommand>> result = text.toPaintCommands(contextWithDef);

      // Assert
      expect(result, isA<Success<List<PaintCommand>>>());
      final List<PaintCommand> cmds = (result as Success<List<PaintCommand>>).value;
      expect(cmds, hasLength(1));
      expect(cmds.first, isA<DrawTextPath>());
      final drawTextPath = cmds.first as DrawTextPath;
      expect(drawTextPath.text, 'Path Text');
      expect(drawTextPath.startOffset, 10.0);
      expect(drawTextPath.pathOperations, hasLength(2));
    });

    test('should preserve styled chunks for nested tspan when multi-coordinates are present', () {
      // Arrange
      const text = SvgText(
        x: SvgLengthPercentageList(<SvgLengthPercentage>[
          SvgLength(12.0),
          SvgLength(24.0),
          SvgLength(36.0),
        ]),
        y: SvgLength(48.0),
        children: <SvgTextContent>[
          SvgCharacterData('A'),
          SvgTspan(
            presentationAttributes: SvgPresentationAttributes(
              fill: SvgFillAttributes(
                color: SvgNamedColor(SvgColorName.red),
              ),
            ),
            children: <SvgTextContent>[
              SvgCharacterData('B'),
            ],
          ),
          SvgCharacterData('C'),
        ],
      );

      // Act
      final Result<List<PaintCommand>> result = text.toPaintCommands(context);

      // Assert
      expect(result, isA<Success<List<PaintCommand>>>());
      final List<PaintCommand> cmds = (result as Success<List<PaintCommand>>).value;
      expect(cmds, hasLength(1));
      expect(cmds.first, isA<DrawText>());
      final drawText = cmds.first as DrawText;
      expect(drawText.chunks, hasLength(3));
      expect(drawText.chunks![0].text, 'A');
      expect(drawText.chunks![0].x, 12.0);
      expect(drawText.chunks![0].y, 48.0);
      expect(drawText.chunks![1].text, 'B');
      expect(drawText.chunks![1].x, 24.0);
      expect(drawText.chunks![1].style?.fill?.colorArgb, 0xFFFF0000);
      expect(drawText.chunks![2].text, 'C');
      expect(drawText.chunks![2].x, 36.0);
    });

    test('should support SvgTextPath with direct pathData and report errors for invalid pathData or targets', () {
      // Arrange
      const validDirect = SvgText(
        x: SvgLength(0.0),
        y: SvgLength(0.0),
        children: <SvgTextContent>[
          SvgTextPath(
            href: '',
            pathData: 'M 10 20 L 30 40',
            children: <SvgTextContent>[SvgCharacterData('Direct')],
          ),
        ],
      );
      const invalidDirect = SvgText(
        x: SvgLength(0.0),
        y: SvgLength(0.0),
        children: <SvgTextContent>[
          SvgTextPath(
            href: '',
            pathData: 'Z INVALID',
            children: <SvgTextContent>[SvgCharacterData('Bad')],
          ),
        ],
      );
      const missingTarget = SvgText(
        x: SvgLength(0.0),
        y: SvgLength(0.0),
        children: <SvgTextContent>[
          SvgTextPath(
            href: '#missing',
            children: <SvgTextContent>[SvgCharacterData('Missing')],
          ),
        ],
      );
      const nonPathTarget = SvgText(
        x: SvgLength(0.0),
        y: SvgLength(0.0),
        children: <SvgTextContent>[
          SvgTextPath(
            href: '#rectTarget',
            children: <SvgTextContent>[SvgCharacterData('NotPath')],
          ),
        ],
      );
      const contextWithRect = SvgPaintingContext(
        viewBoxWidth: 100.0,
        viewBoxHeight: 200.0,
        definitions: <String, SvgElement>{
          'rectTarget': SvgRect(
            x: SvgLength(0.0),
            y: SvgLength(0.0),
            width: SvgLength(10.0),
            height: SvgLength(10.0),
            rx: SvgLength(0.0),
            ry: SvgLength(0.0),
          ),
        },
      );

      // Act
      final Result<List<PaintCommand>> resValid = validDirect.toPaintCommands(context);
      final Result<List<PaintCommand>> resInvalid = invalidDirect.toPaintCommands(context);
      final Result<List<PaintCommand>> resMissing = missingTarget.toPaintCommands(context);
      final Result<List<PaintCommand>> resNonPath = nonPathTarget.toPaintCommands(contextWithRect);

      // Assert
      expect(resValid, isA<Success<List<PaintCommand>>>());
      expect((resValid as Success<List<PaintCommand>>).value.single, isA<DrawTextPath>());
      expect(resInvalid, isA<Failure<List<PaintCommand>>>());
      expect(resMissing, isA<Failure<List<PaintCommand>>>());
      expect(resNonPath, isA<Failure<List<PaintCommand>>>());
    });

    test('should emit separate DrawText commands for positioned tspans and skip hidden ones', () {
      // Arrange
      const text = SvgText(
        x: SvgLength(10.0),
        y: SvgLength(20.0),
        children: <SvgTextContent>[
          SvgCharacterData('Lead'),
          SvgCharacterData('   '),
          SvgTspan(
            x: SvgLength(50.0),
            y: SvgLength(60.0),
            presentationAttributes: SvgPresentationAttributes(display: .none),
            children: <SvgTextContent>[SvgCharacterData('Hidden')],
          ),
          SvgTspan(
            x: SvgLength(30.0),
            y: SvgLength(40.0),
            dx: SvgLength(5.0),
            dy: SvgLength(6.0),
            children: <SvgTextContent>[SvgCharacterData('Single')],
          ),
          SvgTspan(
            x: SvgLengthPercentageList(<SvgLengthPercentage>[SvgLength(70.0), SvgLength(80.0)]),
            y: SvgLength(90.0),
            dx: SvgLengthPercentageList(<SvgLengthPercentage>[SvgLength(1.0), SvgLength(2.0)]),
            dy: SvgLengthPercentageList(<SvgLengthPercentage>[SvgLength(3.0), SvgLength(4.0)]),
            children: <SvgTextContent>[SvgCharacterData('AB')],
          ),
        ],
      );

      // Act
      final Result<List<PaintCommand>> result = text.toPaintCommands(context);

      // Assert
      final List<PaintCommand> cmds = (result as Success<List<PaintCommand>>).value;
      expect(cmds, hasLength(3));
      expect((cmds[0] as DrawText).x, 10.0);
      expect((cmds[0] as DrawText).rootSpan.text, 'Lead');
      expect((cmds[1] as DrawText).x, 35.0);
      expect((cmds[1] as DrawText).y, 46.0);
      final multiTspan = cmds[2] as DrawText;
      expect(multiTspan.chunks, hasLength(2));
      expect(multiTspan.chunks![0].x, 70.0);
      expect(multiTspan.chunks![0].y, 90.0);
      expect(multiTspan.chunks![0].dx, 1.0);
      expect(multiTspan.chunks![0].dy, 3.0);
      expect(multiTspan.chunks![1].x, 80.0);
      expect(multiTspan.chunks![1].dx, 2.0);
      expect(multiTspan.chunks![1].dy, 4.0);
    });
  });
}
