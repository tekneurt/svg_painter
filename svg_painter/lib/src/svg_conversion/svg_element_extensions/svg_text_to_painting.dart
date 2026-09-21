import '../../base/_base.dart';
import '../../painting_model/_painting_model.dart';
import '../../svg_model/_svg_model.dart';
import '../converters/_converters.dart';
import '../svg_value_extensions/_svg_value_extensions.dart';

/// Extension to convert [SvgText] to [PaintCommand]s.
extension SvgTextToPaintCommands on SvgText {
  /// Converts this [SvgText] to a list of [PaintCommand]s.
  Result<List<PaintCommand>> toPaintCommands(SvgPaintingContext context) {
    final double resolvedDx = dx?.resolve(context, .horizontal) ?? 0.0;
    final double resolvedDy = dy?.resolve(context, .vertical) ?? 0.0;
    final double finalX = primaryX.resolve(context, .horizontal) + resolvedDx;
    final double finalY = primaryY.resolve(context, .vertical) + resolvedDy;

    final SvgPresentationAttributes textResolvedAttrs = resolvePresentation(
      context,
      tagName: 'text',
      coreAttributes: coreAttributes,
      presentationAttributes: presentationAttributes,
    );
    final SvgPaintingContext textContext =
        context.derive(inheritedAttributes: textResolvedAttrs);

    final PaintingStyle style = resolvePaint(
      context,
      tagName: 'text',
      coreAttributes: coreAttributes,
      presentationAttributes: presentationAttributes,
    );

    final bool hasMultiCoordinates =
        x.toList().length > 1 || y.toList().length > 1;
    final bool hasPositionedTspan = children.any(
      (SvgTextContent c) => c is SvgTspan && (c.x != null || c.y != null),
    );

    if (hasPositionedTspan) {
      final commands = <PaintCommand>[];
      for (final SvgTextContent child in children) {
        if (child is SvgTspan) {
          final SvgPaintingContext spanContext = textContext.deriveWith(child);
          final PaintingStyle spanStyle = resolvePaint(
            spanContext,
            tagName: 'tspan',
            coreAttributes: child.coreAttributes,
            presentationAttributes: child.presentationAttributes,
          );
          final double spanDx = child.dx?.resolve(spanContext, .horizontal) ?? 0.0;
          final double spanDy = child.dy?.resolve(spanContext, .vertical) ?? 0.0;
          final bool childHasMulti =
              (child.x?.toList().length ?? 0) > 1 || (child.y?.toList().length ?? 0) > 1;

          if (childHasMulti) {
            final String childText = _extractText(child.children);
            final List<PaintingTextChunk> chunks = _buildChunks(
              text: childText,
              context: spanContext,
              style: spanStyle,
              xCoord: child.x,
              yCoord: child.y,
              baseDx: spanDx,
              baseDy: spanDy,
            );
            final double startX =
                (child.primaryX ?? primaryX).resolve(spanContext, .horizontal) + spanDx;
            final double startY =
                (child.primaryY ?? primaryY).resolve(spanContext, .vertical) + spanDy;
            commands.add(
              DrawText(
                x: startX,
                y: startY,
                rootSpan: PaintingTextSpan(text: childText, style: spanStyle),
                style: spanStyle,
                chunks: chunks,
                id: child.id,
              ),
            );
          } else {
            final double startX =
                (child.primaryX ?? primaryX).resolve(spanContext, .horizontal) + spanDx;
            final double startY =
                (child.primaryY ?? primaryY).resolve(spanContext, .vertical) + spanDy;
            final PaintingTextSpan span = _buildSpan(child.children, spanContext, 'tspan');
            commands.add(
              DrawText(
                x: startX,
                y: startY,
                rootSpan: span,
                style: spanStyle,
                id: child.id,
              ),
            );
          }
        } else if (child is SvgCharacterData) {
          commands.add(
            DrawText(
              x: finalX,
              y: finalY,
              rootSpan: PaintingTextSpan(text: child.text),
              style: style,
            ),
          );
        }
      }
      return Success<List<PaintCommand>>(commands);
    }

    if (hasMultiCoordinates) {
      final String text = _extractText(children);
      final List<PaintingTextChunk> chunks = _buildChunks(
        text: text,
        context: textContext,
        style: style,
        xCoord: x,
        yCoord: y,
        baseDx: resolvedDx,
        baseDy: resolvedDy,
      );
      return Success<List<PaintCommand>>(<PaintCommand>[
        DrawText(
          x: finalX,
          y: finalY,
          rootSpan: PaintingTextSpan(text: text, style: style),
          style: style,
          chunks: chunks,
          id: id,
        ),
      ]);
    }

    final PaintingTextSpan rootSpan = _buildSpan(children, textContext, 'text');

    return Success<List<PaintCommand>>(<PaintCommand>[
      DrawText(x: finalX, y: finalY, rootSpan: rootSpan, style: style, id: id),
    ]);
  }

  String _extractText(List<SvgTextContent> contents) {
    final buffer = StringBuffer();
    for (final content in contents) {
      if (content is SvgCharacterData) {
        buffer.write(content.text);
      } else if (content is SvgTspan) {
        buffer.write(_extractText(content.children));
      }
    }
    return buffer.toString();
  }

  List<PaintingTextChunk> _buildChunks({
    required String text,
    required SvgPaintingContext context,
    required PaintingStyle style,
    SvgLengthPercentageOrList? xCoord,
    SvgLengthPercentageOrList? yCoord,
    double? baseDx,
    double? baseDy,
  }) {
    final chunks = <PaintingTextChunk>[];
    final List<SvgLengthPercentage>? xValues = xCoord?.toList();
    final List<SvgLengthPercentage>? yValues = yCoord?.toList();
    final List<String> characters = text.split('');

    for (var i = 0; i < characters.length; i++) {
      final String char = characters[i];
      double? chunkX;
      if (xValues != null && i < xValues.length) {
        chunkX = xValues[i].resolve(context, .horizontal) + (baseDx ?? 0.0);
      } else if (i == 0) {
        chunkX = (xCoord?.primary ?? const SvgLength(0.0)).resolve(context, .horizontal) +
            (baseDx ?? 0.0);
      }

      double? chunkY;
      if (yValues != null && i < yValues.length) {
        chunkY = yValues[i].resolve(context, .vertical) + (baseDy ?? 0.0);
      } else if (i == 0) {
        chunkY = (yCoord?.primary ?? const SvgLength(0.0)).resolve(context, .vertical) +
            (baseDy ?? 0.0);
      }

      chunks.add(
        PaintingTextChunk(
          text: char,
          x: chunkX,
          y: chunkY,
          style: style,
        ),
      );
    }
    return chunks;
  }

  PaintingTextSpan _buildSpan(
    List<SvgTextContent> children,
    SvgPaintingContext context,
    String tagName,
  ) {
    final childSpans = <PaintingTextSpan>[];

    for (final child in children) {
      if (child is SvgCharacterData) {
        childSpans.add(PaintingTextSpan(text: child.text));
      } else if (child is SvgTspan) {
        final SvgPaintingContext spanContext = context.deriveWith(child);
        final PaintingStyle spanStyle = resolvePaint(
          spanContext,
          tagName: 'tspan',
          coreAttributes: child.coreAttributes,
          presentationAttributes: child.presentationAttributes,
        );

        // Recursively build children
        final PaintingTextSpan span = _buildSpan(child.children, spanContext, 'tspan');

        childSpans.add(
          PaintingTextSpan(
            style: spanStyle,
            children: span.children,
            text: span.text,
          ),
        );
      }
    }

    return PaintingTextSpan(children: childSpans);
  }
}
