import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:svg_painter_annotation/svg_painter_annotation.dart';
import 'package:xml/xml.dart';

import 'base/_base.dart';
import 'painting_model/_painting_model.dart';
import 'svg_conversion/_svg_conversion.dart';
import 'svg_model/_svg_model.dart';
import 'xml_conversion/_xml_conversion.dart';
import 'xml_model/_xml_model.dart';

/// Generator that produces CustomPainter code from SVG files.
class SvgPainterGenerator extends GeneratorForAnnotation<SvgPainter> {
  static const TypeChecker _fileChecker = TypeChecker.fromUrl(
    'package:svg_painter_annotation/src/svg_painter.dart#SvgFilePainter',
  );
  static const TypeChecker _codeChecker = TypeChecker.fromUrl(
    'package:svg_painter_annotation/src/svg_painter.dart#SvgCodePainter',
  );

  @override
  FutureOr<String> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) async {
    final Result<String> contentResult = await _loadSvgContent(annotation, buildStep);

    final String svgContent = contentResult.fold(
      (Failure<String> failure) => throw InvalidGenerationSourceError(
        'Failed to load SVG content for ${element.name}: ${failure.message}',
        element: element,
      ),
      (String content) => content,
    );

    final Result<XmlDocument> parseResult = svgContent.toXmlDocument();

    final XmlDocument document = parseResult.fold(
      (Failure<XmlDocument> failure) => throw InvalidGenerationSourceError(
        'Invalid SVG content for ${element.name}: ${failure.message}',
        element: element,
      ),
      (XmlDocument doc) => doc,
    );

    final XmlElement svgXmlElement = document.findAllElements(XmlElementName.svg.tagName).first;

    final Result<SvgElement> mapResult = svgXmlElement.toSvgElement();

    final SvgElement svgRoot = mapResult.fold(
      (Failure<SvgElement> failure) => throw InvalidGenerationSourceError(
        'Failed to map SVG content for ${element.name}: ${failure.message}',
        element: element,
      ),
      (SvgElement value) => value,
    );

    if (svgRoot is! SvgSvg) {
      throw InvalidGenerationSourceError(
        'Root element must be <svg>, but found ${svgRoot.runtimeType}',
        element: element,
      );
    }

    double viewBoxWidth = 100.0;
    double viewBoxHeight = 100.0;

    if (svgRoot is SvgRoot) {
      if (svgRoot.viewBox != null) {
        viewBoxWidth = svgRoot.viewBox!.width;
        viewBoxHeight = svgRoot.viewBox!.height;
      } else {
        final SvgLengthPercentageAuto? width = svgRoot.width;
        if (width is SvgLength) {
          viewBoxWidth = width.toDouble();
        }
        final SvgLengthPercentageAuto? height = svgRoot.height;
        if (height is SvgLength) {
          viewBoxHeight = height.toDouble();
        }
      }
    }

    final Result<List<PaintCommand>> paintingResult = svgRoot.toPaintCommands();
    final List<PaintCommand> commands = paintingResult.fold(
      (Failure<List<PaintCommand>> failure) => throw InvalidGenerationSourceError(
        'Failed to convert SVG to painting commands for ${element.name}: ${failure.message}',
        element: element,
      ),
      (List<PaintCommand> value) => value,
    );

    final StringBuffer buffer = StringBuffer();

    // Header to ignore lints in generated code
    buffer.writeln('// coverage:ignore-file');
    buffer.writeln('// ignore_for_file: type=lint');
    buffer.writeln(
      '// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package',
    );
    buffer.writeln();

    final String className = annotation.read('painterClassName').isNull
        ? r'_$' + (element.name ?? '')
        : annotation.read('painterClassName').stringValue;

    buffer.writeln('class $className extends CustomPainter {');
    buffer.writeln('  const $className({this.fit = BoxFit.contain});');
    buffer.writeln();
    buffer.writeln('  final BoxFit fit;');
    buffer.writeln();
    buffer.writeln('  @override');
    buffer.writeln('  void paint(Canvas canvas, Size size) {');
    buffer.writeln(
      '    final FittedSizes fittedSizes = applyBoxFit(fit, const Size($viewBoxWidth, $viewBoxHeight), size);',
    );
    buffer.writeln('    final Size sourceSize = fittedSizes.source;');
    buffer.writeln(
      '    final Rect destRect = Alignment.center.inscribe(fittedSizes.destination, Offset.zero & size);',
    );
    buffer.writeln();
    buffer.writeln('    canvas.save();');
    buffer.writeln('    canvas.translate(destRect.left, destRect.top);');
    buffer.writeln(
      '    canvas.scale(destRect.width / sourceSize.width, destRect.height / sourceSize.height);',
    );
    buffer.writeln('    canvas.clipRect(Rect.fromLTWH(0, 0, $viewBoxWidth, $viewBoxHeight));');
    buffer.writeln();

    // Gradient definitions
    for (final PaintCommand command in commands) {
      if (command is DefineRadialGradient) {
        final String colors =
            '[${command.stops.map((GradientStop s) => 'Color(0x${s.colorArgb.toRadixString(16).toUpperCase()})').join(', ')}]';
        final String stops =
            '[${command.stops.map((GradientStop s) => s.offset.toString()).join(', ')}]';
        final String transform = command.transform == 'rotate(90)'
            ? 'transform: const GradientRotation(3.141592653589793 / 2),'
            : '';
        buffer.writeln(
          '    final Gradient _grad_${command.id} = RadialGradient(center: Alignment(${command.cx * 2 - 1}, ${command.cy * 2 - 1}), radius: ${command.radius}, focal: Alignment(${command.fx * 2 - 1}, ${command.fy * 2 - 1}), focalRadius: ${command.focalRadius}, colors: $colors, stops: $stops, $transform);',
        );
      } else if (command is DefineLinearGradient) {
        final String colors =
            '[${command.stops.map((GradientStop s) => 'Color(0x${s.colorArgb.toRadixString(16).toUpperCase()})').join(', ')}]';
        final String stops =
            '[${command.stops.map((GradientStop s) => s.offset.toString()).join(', ')}]';
        final String transform = command.transform == 'rotate(90)'
            ? 'transform: const GradientRotation(3.141592653589793 / 2),'
            : '';
        buffer.writeln(
          '    final Gradient _grad_${command.id} = LinearGradient(begin: Alignment(${command.x1 * 2 - 1}, ${command.y1 * 2 - 1}), end: Alignment(${command.x2 * 2 - 1}, ${command.y2 * 2 - 1}), colors: $colors, stops: $stops, $transform);',
        );
      }
    }

    for (final PaintCommand command in commands) {
      String? transformValue;
      if (command is DrawCircle) {
        transformValue = command.transform;
      } else if (command is DrawOval) {
        transformValue = command.transform;
      } else if (command is DrawRect) {
        transformValue = command.transform;
      } else if (command is DrawLine) {
        transformValue = command.transform;
      } else if (command is DrawPolyline) {
        transformValue = command.transform;
      } else if (command is DrawPolygon) {
        transformValue = command.transform;
      }

      String? tBegin;
      String? tEnd;
      if (transformValue != null) {
        final RegExp reg = RegExp(r'translate\(\s*([\d.-]+)\s*(?:[\s,]?\s*([\d.-]+))?\s*\)');
        final Match? match = reg.firstMatch(transformValue);
        if (match != null) {
          final String tx = match.group(1)!;
          final String ty = match.group(2) ?? '0';
          tBegin = '      canvas.save();\n      canvas.translate($tx, $ty);';
          tEnd = '      canvas.restore();';
        }
      }

      if (command is DrawCircle) {
        if (command.radius <= 0) {
          continue;
        }
        buffer.writeln('    {');
        if (tBegin != null) {
          buffer.writeln(tBegin);
        }
        buffer.writeln('      final Paint paint = Paint();');
        if (command.fillShaderId != null) {
          buffer.writeln(
            '      paint.shader = _grad_${command.fillShaderId}.createShader(Rect.fromCircle(center: const Offset(${command.cx}, ${command.cy}), radius: ${command.radius}));',
          );
          buffer.writeln('      paint.style = PaintingStyle.fill;');
          buffer.writeln(
            '      canvas.drawCircle(const Offset(${command.cx}, ${command.cy}), ${command.radius}, paint);',
          );
        } else if (command.fillColorArgb != null && command.fillColorArgb != 0) {
          buffer.writeln(
            '      paint.color = const Color(0x${command.fillColorArgb!.toRadixString(16).toUpperCase()});',
          );
          buffer.writeln('      paint.style = PaintingStyle.fill;');
          buffer.writeln(
            '      canvas.drawCircle(const Offset(${command.cx}, ${command.cy}), ${command.radius}, paint);',
          );
        }
        if (command.strokeShaderId != null) {
          buffer.writeln(
            '      paint.shader = _grad_${command.strokeShaderId}.createShader(Rect.fromCircle(center: const Offset(${command.cx}, ${command.cy}), radius: ${command.radius}));',
          );
          buffer.writeln('      paint.style = PaintingStyle.stroke;');
          buffer.writeln('      paint.strokeWidth = ${command.strokeWidth};');
          buffer.writeln(
            '      canvas.drawCircle(const Offset(${command.cx}, ${command.cy}), ${command.radius}, paint);',
          );
        } else if (command.strokeColorArgb != null && command.strokeColorArgb != 0) {
          buffer.writeln(
            '      paint.color = const Color(0x${command.strokeColorArgb!.toRadixString(16).toUpperCase()});',
          );
          buffer.writeln('      paint.style = PaintingStyle.stroke;');
          buffer.writeln('      paint.strokeWidth = ${command.strokeWidth};');
          buffer.writeln(
            '      canvas.drawCircle(const Offset(${command.cx}, ${command.cy}), ${command.radius}, paint);',
          );
        }
        if (tEnd != null) {
          buffer.writeln(tEnd);
        }
        buffer.writeln('    }');
      } else if (command is DrawOval) {
        if (command.rx <= 0 || command.ry <= 0) {
          continue;
        }
        buffer.writeln('    {');
        if (tBegin != null) {
          buffer.writeln(tBegin);
        }
        buffer.writeln('      final Paint paint = Paint();');
        final String r =
            'Rect.fromCenter(center: const Offset(${command.cx}, ${command.cy}), width: ${command.rx * 2}, height: ${command.ry * 2})';
        if (command.fillShaderId != null) {
          buffer.writeln('      paint.shader = _grad_${command.fillShaderId}.createShader($r);');
          buffer.writeln('      paint.style = PaintingStyle.fill;');
          buffer.writeln('      canvas.drawOval($r, paint);');
        } else if (command.fillColorArgb != null && command.fillColorArgb != 0) {
          buffer.writeln(
            '      paint.color = const Color(0x${command.fillColorArgb!.toRadixString(16).toUpperCase()});',
          );
          buffer.writeln('      paint.style = PaintingStyle.fill;');
          buffer.writeln('      canvas.drawOval($r, paint);');
        }
        if (command.strokeShaderId != null) {
          buffer.writeln('      paint.shader = _grad_${command.strokeShaderId}.createShader($r);');
          buffer.writeln('      paint.style = PaintingStyle.stroke;');
          buffer.writeln('      paint.strokeWidth = ${command.strokeWidth};');
          buffer.writeln('      canvas.drawOval($r, paint);');
        } else if (command.strokeColorArgb != null && command.strokeColorArgb != 0) {
          buffer.writeln(
            '      paint.color = const Color(0x${command.strokeColorArgb!.toRadixString(16).toUpperCase()});',
          );
          buffer.writeln('      paint.style = PaintingStyle.stroke;');
          buffer.writeln('      paint.strokeWidth = ${command.strokeWidth};');
          buffer.writeln('      canvas.drawOval($r, paint);');
        }
        if (tEnd != null) {
          buffer.writeln(tEnd);
        }
        buffer.writeln('    }');
      } else if (command is DrawRect) {
        if (command.width <= 0 || command.height <= 0) {
          continue;
        }
        buffer.writeln('    {');
        if (tBegin != null) {
          buffer.writeln(tBegin);
        }
        buffer.writeln('      final Paint paint = Paint();');
        final String r =
            'Rect.fromLTWH(${command.x}, ${command.y}, ${command.width}, ${command.height})';
        final String rectCode = command.rx > 0 || command.ry > 0
            ? 'RRect.fromRectAndRadius($r, Radius.elliptical(${command.rx}, ${command.ry}))'
            : r;
        final String drawMethod = command.rx > 0 || command.ry > 0 ? 'drawRRect' : 'drawRect';
        if (command.fillShaderId != null) {
          buffer.writeln('      paint.shader = _grad_${command.fillShaderId}.createShader($r);');
          buffer.writeln('      paint.style = PaintingStyle.fill;');
          buffer.writeln('      canvas.$drawMethod($rectCode, paint);');
        } else if (command.fillColorArgb != null && command.fillColorArgb != 0) {
          buffer.writeln(
            '      paint.color = const Color(0x${command.fillColorArgb!.toRadixString(16).toUpperCase()});',
          );
          buffer.writeln('      paint.style = PaintingStyle.fill;');
          buffer.writeln('      canvas.$drawMethod($rectCode, paint);');
        }
        if (command.strokeShaderId != null) {
          buffer.writeln('      paint.shader = _grad_${command.strokeShaderId}.createShader($r);');
          buffer.writeln('      paint.style = PaintingStyle.stroke;');
          buffer.writeln('      paint.strokeWidth = ${command.strokeWidth};');
          buffer.writeln('      canvas.$drawMethod($rectCode, paint);');
        } else if (command.strokeColorArgb != null && command.strokeColorArgb != 0) {
          buffer.writeln(
            '      paint.color = const Color(0x${command.strokeColorArgb!.toRadixString(16).toUpperCase()});',
          );
          buffer.writeln('      paint.style = PaintingStyle.stroke;');
          buffer.writeln('      paint.strokeWidth = ${command.strokeWidth};');
          buffer.writeln('      canvas.$drawMethod($rectCode, paint);');
        }
        if (tEnd != null) {
          buffer.writeln(tEnd);
        }
        buffer.writeln('    }');
      } else if (command is DrawLine) {
        buffer.writeln('    {');
        if (tBegin != null) {
          buffer.writeln(tBegin);
        }
        buffer.writeln('      final Paint paint = Paint();');
        final String p1 = 'Offset(${command.x1}, ${command.y1})';
        final String p2 = 'Offset(${command.x2}, ${command.y2})';
        if (command.strokeShaderId != null) {
          buffer.writeln(
            '      paint.shader = _grad_${command.strokeShaderId}.createShader(Rect.fromPoints($p1, $p2));',
          );
        } else if (command.strokeColorArgb != null && command.strokeColorArgb != 0) {
          buffer.writeln(
            '      paint.color = const Color(0x${command.strokeColorArgb!.toRadixString(16).toUpperCase()});',
          );
        }
        buffer.writeln('      paint.style = PaintingStyle.stroke;');
        buffer.writeln('      paint.strokeWidth = ${command.strokeWidth};');
        buffer.writeln('      canvas.drawLine($p1, $p2, paint);');
        if (tEnd != null) {
          buffer.writeln(tEnd);
        }
        buffer.writeln('    }');
      } else if (command is DrawPolyline || command is DrawPolygon) {
        final List<double> pts = (command is DrawPolyline)
            ? command.points
            : (command as DrawPolygon).points;
        final bool closed = command is DrawPolygon;
        final String? fShaderId = (command is DrawPolyline)
            ? command.fillShaderId
            : (command as DrawPolygon).fillShaderId;
        final int? fColor = (command is DrawPolyline)
            ? command.fillColorArgb
            : (command as DrawPolygon).fillColorArgb;
        final String? sShaderId = (command is DrawPolyline)
            ? command.strokeShaderId
            : (command as DrawPolygon).strokeShaderId;
        final int? sColor = (command is DrawPolyline)
            ? command.strokeColorArgb
            : (command as DrawPolygon).strokeColorArgb;
        final double sWidth = (command is DrawPolyline)
            ? command.strokeWidth
            : (command as DrawPolygon).strokeWidth;

        buffer.writeln('    {');
        if (tBegin != null) {
          buffer.writeln(tBegin);
        }
        buffer.writeln('      final Paint paint = Paint();');
        buffer.writeln('      final Path path = Path();');
        final StringBuffer sb = StringBuffer();
        for (int i = 0; i < pts.length; i += 2) {
          if (i > 0) {
            sb.write(', ');
          }
          sb.write('const Offset(${pts[i]}, ${pts[i + 1]})');
        }
        buffer.writeln('      path.addPolygon([$sb], $closed);');
        if (fShaderId != null) {
          buffer.writeln('      paint.shader = _grad_$fShaderId.createShader(path.getBounds());');
          buffer.writeln('      paint.style = PaintingStyle.fill;');
          buffer.writeln('      canvas.drawPath(path, paint);');
        } else if (fColor != null && fColor != 0) {
          buffer.writeln(
            '      paint.color = const Color(0x${fColor.toRadixString(16).toUpperCase()});',
          );
          buffer.writeln('      paint.style = PaintingStyle.fill;');
          buffer.writeln('      canvas.drawPath(path, paint);');
        }
        if (sShaderId != null) {
          buffer.writeln('      paint.shader = _grad_$sShaderId.createShader(path.getBounds());');
          buffer.writeln('      paint.style = PaintingStyle.stroke;');
          buffer.writeln('      paint.strokeWidth = $sWidth;');
          buffer.writeln('      canvas.drawPath(path, paint);');
        } else if (sColor != null && sColor != 0) {
          buffer.writeln(
            '      paint.color = const Color(0x${sColor.toRadixString(16).toUpperCase()});',
          );
          buffer.writeln('      paint.style = PaintingStyle.stroke;');
          buffer.writeln('      paint.strokeWidth = $sWidth;');
          buffer.writeln('      canvas.drawPath(path, paint);');
        }
        if (tEnd != null) {
          buffer.writeln(tEnd);
        }
        buffer.writeln('    }');
      }
    }

    buffer.writeln('    canvas.restore();');
    buffer.writeln('  }');
    buffer.writeln('  @override');
    buffer.writeln('  bool shouldRepaint(covariant $className oldDelegate) {');
    buffer.writeln('    return fit != oldDelegate.fit;');
    buffer.writeln('  }');
    buffer.writeln('}');

    return buffer.toString();
  }

  Future<Result<String>> _loadSvgContent(ConstantReader annotation, BuildStep buildStep) async {
    if (_fileChecker.isExactlyType(annotation.objectValue.type!)) {
      return _loadFromFile(annotation, buildStep);
    } else if (_codeChecker.isExactlyType(annotation.objectValue.type!)) {
      return Success<String>(annotation.read('code').stringValue);
    }
    return const Failure<String>(
      'Unknown SvgPainter type. Must be SvgFilePainter or SvgCodePainter.',
    );
  }

  Future<Result<String>> _loadFromFile(ConstantReader annotation, BuildStep buildStep) async {
    final String path = annotation.read('path').stringValue;
    if (!path.startsWith('package:')) {
      return const Failure<String>('Only package: URIs are supported for file assets.');
    }

    final Uri uri = Uri.parse(path);
    final AssetId assetId = AssetId(
      uri.pathSegments.first,
      'lib/${uri.pathSegments.skip(1).join('/')}',
    );

    try {
      final String content = await buildStep.readAsString(assetId);
      return Success<String>(content);
    } catch (e) {
      return Failure<String>('Failed to read asset $path: $e');
    }
  }
}
