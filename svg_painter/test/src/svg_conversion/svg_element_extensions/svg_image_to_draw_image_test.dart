import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/svg_conversion/converters/svg_painting_context.dart';
import 'package:svg_painter/src/svg_conversion/svg_element_extensions/svg_image_to_draw_image.dart';
import 'package:svg_painter/src/svg_model/attribute_groups/svg_graphics_attributes.dart';
import 'package:svg_painter/src/svg_model/attribute_groups/svg_presentation_attributes.dart';
import 'package:svg_painter/src/svg_model/attribute_groups/svg_transform_attributes.dart';
import 'package:svg_painter/src/svg_model/attribute_groups/svg_viewport_attributes.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

List<int> _pngHeaderBytes(int width, int height) {
  return <int>[
    0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A,
    0x00, 0x00, 0x00, 0x0D,
    0x49, 0x48, 0x44, 0x52,
    (width >> 24) & 0xFF,
    (width >> 16) & 0xFF,
    (width >> 8) & 0xFF,
    width & 0xFF,
    (height >> 24) & 0xFF,
    (height >> 16) & 0xFF,
    (height >> 8) & 0xFF,
    height & 0xFF,
  ];
}

void main() {
  group('SvgImageToDrawImage', () {
    test('should return empty list when href is missing from both caches', () {
      // Arrange
      const context = SvgPaintingContext(viewBoxWidth: 100.0, viewBoxHeight: 200.0);
      const image = SvgImage(
        href: 'missing.png',
        x: SvgLength(10.0),
        y: SvgLength(20.0),
        width: SvgLength(50.0),
        height: SvgLength(60.0),
      );

      // Act
      final Result<List<PaintCommand>> result = image.toPaintCommands(context);

      // Assert
      final List<PaintCommand> commands = result.fold((_) => <PaintCommand>[], (s) => s);
      expect(commands, isEmpty);
    });

    test('should convert SvgImage to DrawImage directly when dimensions are unparseable', () {
      // Arrange
      final bytes = <int>[1, 2, 3];
      final context = SvgPaintingContext(
        viewBoxWidth: 100.0,
        viewBoxHeight: 200.0,
        imageCache: <String, List<int>>{'img.png': bytes},
      );
      const image = SvgImage(
        href: 'img.png',
        x: SvgLength(5.0),
        y: SvgLength(15.0),
        width: SvgLength(40.0),
        height: SvgLength(50.0),
        decoding: .sync,
      );

      // Act
      final Result<List<PaintCommand>> result = image.toPaintCommands(context);

      // Assert
      final List<PaintCommand> commands = result.fold((_) => <PaintCommand>[], (s) => s);
      expect(commands, hasLength(1));
      final drawImg = commands.first as DrawImage;
      expect(drawImg.x, 5.0);
      expect(drawImg.y, 15.0);
      expect(drawImg.width, 40.0);
      expect(drawImg.height, 50.0);
      expect(drawImg.decoding, PaintingImageDecoding.sync);
    });

    test(
      'should wrap nested SVG with scale and alignment when found in svgCache with explicit size',
      () {
        // Arrange
        const nestedSvg = SvgSvg(
          width: SvgLength(20.0),
          height: SvgLength(40.0),
          children: <SvgElement>[
            SvgRect(
              x: SvgLength(0.0),
              y: SvgLength(0.0),
              width: SvgLength(20.0),
              height: SvgLength(40.0),
              rx: SvgLength(0.0),
              ry: SvgLength(0.0),
            ),
          ],
        );
        const context = SvgPaintingContext(
          viewBoxWidth: 200.0,
          viewBoxHeight: 300.0,
          svgCache: <String, SvgSvg>{'nested.svg': nestedSvg},
        );
        const image = SvgImage(
          href: 'nested.svg',
          x: SvgLength(10.0),
          y: SvgLength(20.0),
          width: SvgLength(100.0),
          height: SvgLength(80.0),
          viewportAttributes: SvgViewportAttributes(
            preserveAspectRatio: SvgPreserveAspectRatio.defaults,
          ),
        );

        // Act
        final Result<List<PaintCommand>> result = image.toPaintCommands(context);

        // Assert
        final List<PaintCommand> commands = result.fold((_) => <PaintCommand>[], (s) => s);
        expect(commands, hasLength(1));
        final group = commands.first as DrawGroup;
        final List<SvgTransformOperation> ops = group.style.transformAttributes!.operations;
        expect(ops, hasLength(3));
        expect(ops[0].toString(), 'translate(10.0, 20.0)');
        expect(ops[1].toString(), 'translate(30.0, 0.0)');
        expect(ops[2].toString(), 'scale(2.0, 2.0)');
      },
    );

    test('should use nested viewBox and slice alignment when nested SVG has no explicit size', () {
      // Arrange
      const nestedSvg = SvgSvg(
        viewportAttributes: SvgViewportAttributes(viewBox: SvgViewBox(0.0, 0.0, 50.0, 25.0)),
        children: <SvgElement>[],
      );
      const context = SvgPaintingContext(
        viewBoxWidth: 200.0,
        viewBoxHeight: 300.0,
        svgCache: <String, SvgSvg>{'vb.svg': nestedSvg},
      );
      const image = SvgImage(
        href: 'vb.svg',
        x: SvgLength(0.0),
        y: SvgLength(0.0),
        width: SvgLength(100.0),
        height: SvgLength(100.0),
        viewportAttributes: SvgViewportAttributes(
          preserveAspectRatio: SvgPreserveAspectRatio(
            alignment: .xMaxYMax,
            scale: .slice,
          ),
        ),
      );

      // Act
      final Result<List<PaintCommand>> result = image.toPaintCommands(context);

      // Assert
      final List<PaintCommand> commands = result.fold((_) => <PaintCommand>[], (s) => s);
      final group = commands.first as DrawGroup;
      final List<SvgTransformOperation> ops = group.style.transformAttributes!.operations;
      expect(ops.map((SvgTransformOperation op) => op.toString()), contains('scale(4.0, 4.0)'));
      expect(ops.map((SvgTransformOperation op) => op.toString()), contains('translate(-100.0, 0.0)'));
    });

    test('should stretch non-uniformly when nested SVG uses preserveAspectRatio none', () {
      // Arrange
      const nestedSvg = SvgSvg(
        width: SvgLength(25.0),
        height: SvgLength(50.0),
        children: <SvgElement>[],
      );
      const context = SvgPaintingContext(
        viewBoxWidth: 200.0,
        viewBoxHeight: 300.0,
        svgCache: <String, SvgSvg>{'stretch.svg': nestedSvg},
      );
      const image = SvgImage(
        href: 'stretch.svg',
        x: SvgLength(0.0),
        y: SvgLength(0.0),
        width: SvgLength(100.0),
        height: SvgLength(100.0),
        viewportAttributes: SvgViewportAttributes(
          preserveAspectRatio: SvgPreserveAspectRatio(alignment: .none),
        ),
      );

      // Act
      final Result<List<PaintCommand>> result = image.toPaintCommands(context);

      // Assert
      final List<PaintCommand> commands = result.fold((_) => <PaintCommand>[], (s) => s);
      final group = commands.first as DrawGroup;
      expect(
        group.style.transformAttributes!.operations.map((SvgTransformOperation op) => op.toString()),
        contains('scale(4.0, 2.0)'),
      );
    });

    test(
      'should return DrawImage directly with meet alignment when no outer transforms or clip apply',
      () {
        // Arrange
        final List<int> pngBytes = _pngHeaderBytes(20, 40);
        final context = SvgPaintingContext(
          viewBoxWidth: 200.0,
          viewBoxHeight: 300.0,
          imageCache: <String, List<int>>{'raster.png': pngBytes},
        );
        const image = SvgImage(
          href: 'raster.png',
          x: SvgLength(0.0),
          y: SvgLength(0.0),
          width: SvgLength(100.0),
          height: SvgLength(80.0),
        );

        // Act
        final Result<List<PaintCommand>> result = image.toPaintCommands(context);

        // Assert
        final List<PaintCommand> commands = result.fold((_) => <PaintCommand>[], (s) => s);
        expect(commands, hasLength(1));
        final drawImg = commands.first as DrawImage;
        expect(drawImg.x, 30.0);
        expect(drawImg.y, 0.0);
        expect(drawImg.width, 40.0);
        expect(drawImg.height, 80.0);
      },
    );

    test(
      'should wrap raster DrawImage in DrawGroup with clipRect when slice is used and overflow is hidden',
      () {
        // Arrange
        final List<int> pngBytes = _pngHeaderBytes(50, 25);
        final context = SvgPaintingContext(
          viewBoxWidth: 200.0,
          viewBoxHeight: 300.0,
          imageCache: <String, List<int>>{'slice.png': pngBytes},
        );
        const image = SvgImage(
          href: 'slice.png',
          x: SvgLength(10.0),
          y: SvgLength(20.0),
          width: SvgLength(100.0),
          height: SvgLength(100.0),
          viewportAttributes: SvgViewportAttributes(
            preserveAspectRatio: SvgPreserveAspectRatio(alignment: .xMinYMin, scale: .slice),
          ),
          presentationAttributes: SvgPresentationAttributes(
            graphics: SvgGraphicsAttributes(
              transformAttributes: SvgTransformAttributes(<SvgTransformOperation>[
                SvgTranslate(5.0, 6.0),
              ]),
            ),
          ),
        );

        // Act
        final Result<List<PaintCommand>> result = image.toPaintCommands(context);

        // Assert
        final List<PaintCommand> commands = result.fold((_) => <PaintCommand>[], (s) => s);
        expect(commands, hasLength(1));
        final group = commands.first as DrawGroup;
        expect(group.style.clipRect?.left, 0.0);
        expect(group.style.clipRect?.top, 0.0);
        expect(group.style.clipRect?.width, 100.0);
        expect(group.style.clipRect?.height, 100.0);
        expect(
          group.style.transformAttributes!.operations
              .map((SvgTransformOperation op) => op.toString())
              .toList(),
          <String>['translate(5.0, 6.0)', 'translate(10.0, 20.0)'],
        );
        final drawImg = group.commands.first as DrawImage;
        expect(drawImg.x, 0.0);
        expect(drawImg.y, 0.0);
        expect(drawImg.width, 200.0);
        expect(drawImg.height, 100.0);
      },
    );

    test('should omit clipRect when overflow is visible on raster image with xMaxYMax', () {
      // Arrange
      final List<int> pngBytes = _pngHeaderBytes(40, 20);
      final context = SvgPaintingContext(
        viewBoxWidth: 200.0,
        viewBoxHeight: 300.0,
        imageCache: <String, List<int>>{'visible.png': pngBytes},
      );
      const image = SvgImage(
        href: 'visible.png',
        x: SvgLength(0.0),
        y: SvgLength(0.0),
        width: SvgLength(100.0),
        height: SvgLength(100.0),
        viewportAttributes: SvgViewportAttributes(
          preserveAspectRatio: SvgPreserveAspectRatio(alignment: .xMaxYMax, scale: .slice),
        ),
        presentationAttributes: SvgPresentationAttributes(overflow: .visible),
      );

      // Act
      final Result<List<PaintCommand>> result = image.toPaintCommands(context);

      // Assert
      final List<PaintCommand> commands = result.fold((_) => <PaintCommand>[], (s) => s);
      final drawImg = commands.first as DrawImage;
      expect(drawImg.x, -100.0);
      expect(drawImg.y, 0.0);
    });
  });
}
