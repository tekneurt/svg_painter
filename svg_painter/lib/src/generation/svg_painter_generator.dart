import 'dart:async';

import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:meta/meta.dart';
import 'package:source_gen/source_gen.dart';
import 'package:svg_painter_annotation/svg_painter_annotation.dart';
import 'package:xml/xml.dart';

import '../base/result.dart';
import '../painting_model/_painting_model.dart';
import '../svg_conversion/_svg_conversion.dart';
import '../svg_model/_svg_model.dart';
import '../xml_conversion/_xml_conversion.dart';
import '../xml_model/_xml_model.dart';
import '_generation.dart';

/// Generator that produces CustomPainter code from SVG files.
class SvgPainterGenerator extends GeneratorForAnnotation<SvgPainter> {
  const SvgPainterGenerator({
    this.assetLoader = const AssetLoader(
      fileChecker: fileChecker,
      codeChecker: codeChecker,
    ),
    this.imagePreloader = const ImagePreloader(),
    this.painterGenerator = const PainterClassGenerator(),
  });

  @visibleForTesting
  static const TypeChecker fileChecker = TypeChecker.fromUrl(
    'package:svg_painter_annotation/src/svg_painter.dart#SvgFilePainter',
  );
  @visibleForTesting
  static const TypeChecker codeChecker = TypeChecker.fromUrl(
    'package:svg_painter_annotation/src/svg_painter.dart#SvgCodePainter',
  );

  /// Helper to load SVG content.
  final AssetLoader assetLoader;

  /// Helper to preload images.
  final ImagePreloader imagePreloader;

  /// Helper to generate the painter class code.
  final PainterClassGenerator painterGenerator;

  static const Map<Type, CommandGenerator<PaintCommand>> _generators =
      <Type, CommandGenerator<PaintCommand>>{
        DrawCircle: CircleGenerator(),
        DrawOval: OvalGenerator(),
        DrawRect: RectGenerator(),
        DrawText: TextGenerator(),
        DrawGroup: GroupGenerator(),
        DrawPath: PathGenerator(),
        DrawLine: LineGenerator(),
        DrawPolyline: PolyGenerator<DrawPolyline>(),
        DrawPolygon: PolyGenerator<DrawPolygon>(),
        DrawImage: ImageGenerator(),
        DefineLinearGradient: LinearGradientGenerator(),
        DefineRadialGradient: RadialGradientGenerator(),
      };

  @override
  FutureOr<String> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) async {
    final Result<String> contentResult = await loadSvgContent(annotation, buildStep);

    final String svgContent = contentResult.fold(
      (Failure<String> failure) => throw InvalidGenerationSourceError(
        'Failed to load SVG content for ${element.name}: ${failure.message}',
        element: element,
      ),
      (String content) => content,
    );

    final String? painterClassName = annotation.read('painterClassName').isNull
        ? null
        : annotation.read('painterClassName').stringValue;

    final ConstantReader exposureReader = annotation.read('exposureMode');
    SvgExposureMode exposureMode = SvgExposureMode.none;
    if (!exposureReader.isNull) {
      final int? index = exposureReader.objectValue.getField('index')?.toIntValue();
      if (index != null && index >= 0 && index < SvgExposureMode.values.length) {
        exposureMode = SvgExposureMode.values[index];
      }
    }

    final propertyMapping = <String, String>{};
    if (annotation.read('propertyMapping').isNull) {
      // No mapping provided
    } else {
      final Map<DartObject?, DartObject?> map = annotation.read('propertyMapping').mapValue;
      for (final MapEntry<DartObject?, DartObject?> entry in map.entries) {
        final String? key = entry.key?.toStringValue();
        final String? value = entry.value?.toStringValue();
        if (key == null || value == null) {
          // Invalid mapping entry
        } else {
          propertyMapping[key] = value;
        }
      }
    }

    return generateFromSvg(
      elementName: element.name ?? 'Unknown',
      svgContent: svgContent,
      painterClassName: painterClassName,
      exposureMode: exposureMode,
      propertyMapping: propertyMapping,
      buildStep: buildStep,
    );
  }

  /// Generates the painter class from SVG content string.
  @visibleForTesting
  Future<String> generateFromSvg({
    required String elementName,
    required String svgContent,
    String? painterClassName,
    SvgExposureMode exposureMode = SvgExposureMode.none,
    Map<String, String> propertyMapping = const <String, String>{},
    BuildStep? buildStep,
  }) async {
    final Result<XmlDocument> parseResult = svgContent.toXmlDocument();

    final XmlDocument document = parseResult.fold(
      (Failure<XmlDocument> failure) => throw InvalidGenerationSourceError(
        'Invalid SVG content for $elementName: ${failure.message}',
      ),
      (XmlDocument doc) => doc,
    );

    final Iterable<XmlElement> svgElements = document.findAllElements(XmlElementName.svg.tagName);
    if (svgElements.isEmpty) {
      throw InvalidGenerationSourceError(
        'Invalid SVG content for $elementName: Could not find <svg> root element.',
      );
    }
    final XmlElement svgXmlElement = svgElements.first;

    final imageCache = <String, List<int>>{};
    final svgCache = <String, SvgRoot>{};
    if (buildStep != null) {
      await imagePreloader.preloadImages(svgXmlElement, buildStep, imageCache, svgCache);
    }

    final Result<SvgElement> mapResult = svgXmlElement.toSvgElement();

    final SvgElement svgRoot = mapResult.fold(
      (Failure<SvgElement> failure) => throw InvalidGenerationSourceError(
        'Failed to map SVG content for $elementName: ${failure.message}',
      ),
      (SvgElement value) => value,
    );

    if (svgRoot is SvgSvg) {
      var viewBoxWidth = 100.0;
      var viewBoxHeight = 100.0;

      if (svgRoot is SvgRoot) {
        final SvgLengthPercentageAuto? w = svgRoot.width;
        final SvgLength? wLen = w is SvgLength ? w : null;
        final SvgLengthPercentageAuto? h = svgRoot.height;
        final SvgLength? hLen = h is SvgLength ? h : null;

        viewBoxWidth = wLen?.toDouble() ?? svgRoot.viewBox?.width ?? 100.0;
        viewBoxHeight = hLen?.toDouble() ?? svgRoot.viewBox?.height ?? 100.0;
      }

      final definitions = <String, SvgElement>{};
      svgRoot.collectDefinitions(definitions);

      // Establish initial root context with default SVG styles
      final rootContext = SvgPaintingContext(
        viewBoxWidth: viewBoxWidth,
        viewBoxHeight: viewBoxHeight,
        viewBoxMinX: svgRoot is SvgRoot ? svgRoot.viewBox?.minX ?? 0.0 : 0.0,
        viewBoxMinY: svgRoot is SvgRoot ? svgRoot.viewBox?.minY ?? 0.0 : 0.0,
        inheritedAttributes: SvgPresentationAttributes(
          fill: SvgFillAttributes(
            color:
                (svgRoot is SvgRoot ? svgRoot.fillAttributes?.color : null) ??
                const SvgNamedColor(SvgColorName.black),
            opacity:
                (svgRoot is SvgRoot ? svgRoot.fillAttributes?.opacity : null) ??
                const SvgLength(1.0),
          ),
          stroke: SvgStrokeAttributes(
            color:
                (svgRoot is SvgRoot ? svgRoot.strokeAttributes?.color : null) ??
                const SvgNoneColor(),
            opacity:
                (svgRoot is SvgRoot ? svgRoot.strokeAttributes?.opacity : null) ??
                const SvgLength(1.0),
            width:
                (svgRoot is SvgRoot ? svgRoot.strokeAttributes?.width : null) ??
                const SvgLength(1.0),
            dashArray: svgRoot is SvgRoot ? svgRoot.strokeAttributes?.dashArray : null,
            linecap:
                (svgRoot is SvgRoot ? svgRoot.strokeAttributes?.linecap : null) ??
                SvgStrokeLinecap.butt,
            linejoin:
                (svgRoot is SvgRoot ? svgRoot.strokeAttributes?.linejoin : null) ??
                SvgStrokeLinejoin.miter,
          ),
          font: SvgFontAttributes(
            size:
                (svgRoot is SvgRoot ? svgRoot.fontAttributes?.size : null) ?? const SvgLength(12.0),
            weight:
                (svgRoot is SvgRoot ? svgRoot.fontAttributes?.weight : null) ??
                const SvgFontWeightNormal(),
            style:
                (svgRoot is SvgRoot ? svgRoot.fontAttributes?.style : null) ?? SvgFontStyle.normal,
            family:
                (svgRoot is SvgRoot ? svgRoot.fontAttributes?.family : null) ??
                const SvgFontFamily('sans-serif'),
          ),
        ),
        styleSheet: svgRoot is SvgRoot ? svgRoot.styleSheet : const SvgStyleSheet.empty(),
        definitions: definitions,
        imageCache: imageCache,
        svgCache: svgCache,
      );

      final Result<List<PaintCommand>> paintingResult = svgRoot.toPaintCommands(rootContext);
      final List<PaintCommand> commands = paintingResult.fold(
        (Failure<List<PaintCommand>> failure) => throw InvalidGenerationSourceError(
          'Failed to convert SVG to painting commands for $elementName: ${failure.message}',
        ),
        (List<PaintCommand> value) => value,
      );

      final String className = painterClassName ?? r'_$' + elementName;

      return painterGenerator.generatePainterClass(
        className: className,
        viewBoxWidth: viewBoxWidth,
        viewBoxHeight: viewBoxHeight,
        commands: commands,
        generators: _generators,
        exposureMode: exposureMode,
        propertyMapping: propertyMapping,
      );
    } else {
      throw InvalidGenerationSourceError(
        'Root element must be <svg>, but found ${svgRoot.runtimeType}',
      );
    }
  }

  /// Generates the painter class code.
  @visibleForTesting
  String generatePainterClass({
    required String className,
    required double viewBoxWidth,
    required double viewBoxHeight,
    required List<PaintCommand> commands,
    SvgExposureMode exposureMode = SvgExposureMode.none,
    Map<String, String> propertyMapping = const <String, String>{},
  }) => painterGenerator.generatePainterClass(
    className: className,
    viewBoxWidth: viewBoxWidth,
    viewBoxHeight: viewBoxHeight,
    commands: commands,
    generators: _generators,
    exposureMode: exposureMode,
    propertyMapping: propertyMapping,
  );

  /// Loads SVG content from the given annotation.
  @visibleForTesting
  Future<Result<String>> loadSvgContent(ConstantReader annotation, BuildStep buildStep) =>
      assetLoader.loadSvgContent(annotation, buildStep);

  /// Loads SVG content from a file asset.
  @visibleForTesting
  Future<Result<String>> loadFromFile(ConstantReader annotation, BuildStep buildStep) =>
      assetLoader.loadFromFile(annotation, buildStep);
}
