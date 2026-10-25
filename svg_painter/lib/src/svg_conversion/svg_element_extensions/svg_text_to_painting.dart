import '../../base/_base.dart';
import '../../painting_model/_painting_model.dart';
import '../../svg_model/_svg_model.dart';
import '../converters/_converters.dart';
import '../svg_value_extensions/_svg_value_extensions.dart';

/// Extension to convert [SvgText] to [PaintCommand]s.
extension SvgTextToPaintCommands on SvgText {
  /// Converts this [SvgText] to a list of [PaintCommand]s.
  Result<List<PaintCommand>> toPaintCommands(SvgPaintingContext context) {
    final double resolvedDx = primaryDx?.resolve(context, .horizontal) ?? 0.0;
    final double resolvedDy = primaryDy?.resolve(context, .vertical) ?? 0.0;
    final double finalX = primaryX.resolve(context, .horizontal) + resolvedDx;
    final double finalY = primaryY.resolve(context, .vertical) + resolvedDy;

    final SvgPresentationAttributes textResolvedAttrs = resolvePresentation(
      context,
      tagName: 'text',
      coreAttributes: coreAttributes,
      presentationAttributes: presentationAttributes,
    );
    final SvgPaintingContext textContext = context.derive(inheritedAttributes: textResolvedAttrs);

    final PaintingStyle style = resolvePaint(
      context,
      tagName: 'text',
      coreAttributes: coreAttributes,
      presentationAttributes: presentationAttributes,
    );

    final SvgTextPath? textPathChild = children.whereType<SvgTextPath>().firstOrNull;
    if (textPathChild != null) {
      final List<PathOperation> operations;
      if (textPathChild.pathData case final String pathData when pathData.isNotEmpty) {
        final Result<List<PathOperation>> parsed = PathDataParser.parse(pathData, textContext);
        if (parsed is Failure<List<PathOperation>>) {
          return Failure<List<PaintCommand>>(parsed.message);
        }
        operations = (parsed as Success<List<PathOperation>>).value;
      } else {
        final String href = textPathChild.href;
        final String targetId = href.startsWith('#') ? href.substring(1) : href;
        final SvgElement? target = context.definitions[targetId];
        if (target == null) {
          return Failure<List<PaintCommand>>(
            'Could not find definition for ID "$targetId" referenced by <textPath>.',
          );
        }
        if (target is! SvgPath) {
          return Failure<List<PaintCommand>>(
            'Target "$targetId" referenced by <textPath> is not an SvgPath.',
          );
        }
        final Result<List<PathOperation>> parsed = PathDataParser.parse(target.d, textContext);
        if (parsed is Failure<List<PathOperation>>) {
          return Failure<List<PaintCommand>>(parsed.message);
        }
        operations = (parsed as Success<List<PathOperation>>).value;
      }

      final SvgPaintingContext pathContext = textContext.deriveWith(textPathChild);
      final PaintingStyle pathStyle = resolvePaint(
        pathContext,
        tagName: 'textPath',
        coreAttributes: textPathChild.coreAttributes,
        presentationAttributes: textPathChild.presentationAttributes,
      );

      final double startOffset =
          textPathChild.startOffset?.resolve(pathContext, .horizontal) ?? 0.0;
      final String text = _extractText(textPathChild.children);

      if (textResolvedAttrs.visibility == SvgVisibility.hidden ||
          textResolvedAttrs.visibility == SvgVisibility.collapse) {
        return const Success<List<PaintCommand>>(<PaintCommand>[]);
      }

      return Success<List<PaintCommand>>(<PaintCommand>[
        DrawTextPath(
          pathOperations: operations,
          text: text,
          startOffset: startOffset,
          style: pathStyle,
          id: textPathChild.id ?? id,
        ),
      ]);
    }

    final bool hasMultiCoordinates =
        x.toList().length > 1 ||
        y.toList().length > 1 ||
        (dx?.toList().length ?? 0) > 1 ||
        (dy?.toList().length ?? 0) > 1;
    final bool hasPositionedTspan = children.any(
      (SvgTextContent c) =>
          c is SvgTspan &&
          (c.x != null ||
              c.y != null ||
              (c.dx?.toList().length ?? 0) > 1 ||
              (c.dy?.toList().length ?? 0) > 1),
    );

    if (hasPositionedTspan) {
      final commands = <PaintCommand>[];
      for (final SvgTextContent child in children) {
        if (child is SvgTspan) {
          final SvgPresentationAttributes spanAttrs = resolvePresentation(
            textContext,
            tagName: 'tspan',
            coreAttributes: child.coreAttributes,
            presentationAttributes: child.presentationAttributes,
          );
          if (spanAttrs.display == SvgDisplay.none ||
              spanAttrs.visibility == SvgVisibility.hidden ||
              spanAttrs.visibility == SvgVisibility.collapse) {
            continue;
          }
          final SvgPaintingContext spanContext = textContext.derive(inheritedAttributes: spanAttrs);
          final PaintingStyle spanStyle = resolvePaint(
            spanContext,
            tagName: 'tspan',
            coreAttributes: child.coreAttributes,
            presentationAttributes: child.presentationAttributes,
          );
          final double spanDx = child.primaryDx?.resolve(spanContext, .horizontal) ?? 0.0;
          final double spanDy = child.primaryDy?.resolve(spanContext, .vertical) ?? 0.0;
          final bool childHasMulti =
              (child.x?.toList().length ?? 0) > 1 ||
              (child.y?.toList().length ?? 0) > 1 ||
              (child.dx?.toList().length ?? 0) > 1 ||
              (child.dy?.toList().length ?? 0) > 1;

          final double startX =
              (child.primaryX ?? primaryX).resolve(spanContext, .horizontal) + spanDx;
          final double startY =
              (child.primaryY ?? primaryY).resolve(spanContext, .vertical) + spanDy;
          final PaintingTextSpan span = _buildSpan(child.children, spanContext, 'tspan');

          if (childHasMulti) {
            final List<_StyledCharacter> styledChars = _extractStyledCharacters(
              child.children,
              spanContext,
              spanStyle,
            );
            final List<PaintingTextChunk> chunks = _buildStyledChunks(
              styledCharacters: styledChars,
              context: spanContext,
              defaultStyle: spanStyle,
              xCoord: child.x,
              yCoord: child.y,
              dxCoord: child.dx,
              dyCoord: child.dy,
            );
            commands.add(
              DrawText(
                x: startX,
                y: startY,
                rootSpan: span,
                style: spanStyle,
                chunks: chunks,
                id: child.id,
              ),
            );
          } else {
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
          if (child.text.trim().isEmpty) {
            continue;
          }
          if (textResolvedAttrs.visibility == SvgVisibility.hidden ||
              textResolvedAttrs.visibility == SvgVisibility.collapse) {
            continue;
          }
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
      if (textResolvedAttrs.visibility == SvgVisibility.hidden ||
          textResolvedAttrs.visibility == SvgVisibility.collapse) {
        return const Success<List<PaintCommand>>(<PaintCommand>[]);
      }
      final List<_StyledCharacter> styledChars = _extractStyledCharacters(
        children,
        textContext,
        style,
      );
      final List<PaintingTextChunk> chunks = _buildStyledChunks(
        styledCharacters: styledChars,
        context: textContext,
        defaultStyle: style,
        xCoord: x,
        yCoord: y,
        dxCoord: dx,
        dyCoord: dy,
      );
      final PaintingTextSpan rootSpan = _buildSpan(children, textContext, 'text');
      return Success<List<PaintCommand>>(<PaintCommand>[
        DrawText(
          x: finalX,
          y: finalY,
          rootSpan: rootSpan,
          style: style,
          chunks: chunks,
          id: id,
        ),
      ]);
    }

    final PaintingTextSpan rootSpan = _buildSpan(children, textContext, 'text');
    if (rootSpan.children.isEmpty && (rootSpan.text == null || rootSpan.text!.isEmpty)) {
      return const Success<List<PaintCommand>>(<PaintCommand>[]);
    }

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

  List<_StyledCharacter> _extractStyledCharacters(
    List<SvgTextContent> contents,
    SvgPaintingContext context,
    PaintingStyle currentStyle,
  ) {
    final result = <_StyledCharacter>[];
    for (final content in contents) {
      if (content is SvgCharacterData) {
        for (final String char in content.text.split('')) {
          result.add(_StyledCharacter(char: char, style: currentStyle));
        }
      } else if (content is SvgTspan) {
        final SvgPresentationAttributes spanAttrs = resolvePresentation(
          context,
          tagName: 'tspan',
          coreAttributes: content.coreAttributes,
          presentationAttributes: content.presentationAttributes,
        );
        if (spanAttrs.display == SvgDisplay.none ||
            spanAttrs.visibility == SvgVisibility.hidden ||
            spanAttrs.visibility == SvgVisibility.collapse) {
          continue;
        }
        final SvgPaintingContext spanContext = context.derive(inheritedAttributes: spanAttrs);
        final PaintingStyle spanStyle = resolvePaint(
          spanContext,
          tagName: 'tspan',
          coreAttributes: content.coreAttributes,
          presentationAttributes: content.presentationAttributes,
        );
        result.addAll(_extractStyledCharacters(content.children, spanContext, spanStyle));
      }
    }
    return result;
  }

  List<PaintingTextChunk> _buildStyledChunks({
    required List<_StyledCharacter> styledCharacters,
    required SvgPaintingContext context,
    required PaintingStyle defaultStyle,
    SvgLengthPercentageOrList? xCoord,
    SvgLengthPercentageOrList? yCoord,
    SvgLengthPercentageOrList? dxCoord,
    SvgLengthPercentageOrList? dyCoord,
  }) {
    final chunks = <PaintingTextChunk>[];
    final List<SvgLengthPercentage>? xValues = xCoord?.toList();
    final List<SvgLengthPercentage>? yValues = yCoord?.toList();
    final List<SvgLengthPercentage>? dxValues = dxCoord?.toList();
    final List<SvgLengthPercentage>? dyValues = dyCoord?.toList();

    for (var i = 0; i < styledCharacters.length; i++) {
      final _StyledCharacter styled = styledCharacters[i];
      double? chunkX;
      if (xValues != null && i < xValues.length) {
        chunkX = xValues[i].resolve(context, .horizontal);
      } else if (i == 0 && xCoord != null) {
        chunkX = xCoord.primary.resolve(context, .horizontal);
      }

      double? chunkY;
      if (yValues != null && i < yValues.length) {
        chunkY = yValues[i].resolve(context, .vertical);
      } else if (i == 0 && yCoord != null) {
        chunkY = yCoord.primary.resolve(context, .vertical);
      }

      double? chunkDx;
      if (dxValues != null && i < dxValues.length) {
        chunkDx = dxValues[i].resolve(context, .horizontal);
      }

      double? chunkDy;
      if (dyValues != null && i < dyValues.length) {
        chunkDy = dyValues[i].resolve(context, .vertical);
      }

      chunks.add(
        PaintingTextChunk(
          text: styled.char,
          x: chunkX,
          y: chunkY,
          dx: chunkDx,
          dy: chunkDy,
          style: styled.style,
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
        if (context.inheritedAttributes.visibility == SvgVisibility.hidden ||
            context.inheritedAttributes.visibility == SvgVisibility.collapse) {
          continue;
        }
        childSpans.add(PaintingTextSpan(text: child.text));
      } else if (child is SvgTspan) {
        final SvgPresentationAttributes spanAttrs = resolvePresentation(
          context,
          tagName: 'tspan',
          coreAttributes: child.coreAttributes,
          presentationAttributes: child.presentationAttributes,
        );
        if (spanAttrs.display == SvgDisplay.none ||
            spanAttrs.visibility == SvgVisibility.hidden ||
            spanAttrs.visibility == SvgVisibility.collapse) {
          continue;
        }
        final SvgPaintingContext spanContext = context.derive(inheritedAttributes: spanAttrs);
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

final class _StyledCharacter {
  const _StyledCharacter({
    required this.char,
    required this.style,
  });

  final String char;
  final PaintingStyle style;
}
