import '../../base/_base.dart';
import '../../painting_model/_painting_model.dart';
import '../../svg_model/_svg_model.dart';
import '../converters/_converters.dart';
import '../svg_value_extensions/_svg_value_extensions.dart';

/// Extension to convert [SvgText] to [PaintCommand]s.
extension SvgTextToPaintCommands on SvgText {
  /// Converts this [SvgText] to a list of [PaintCommand]s.
  Result<List<PaintCommand>> toPaintCommands(SvgPaintingContext context) {
    final double finalX = x.resolve(context, .horizontal);
    final double finalY = y.resolve(context, .vertical);

    final PaintingStyle style = resolvePaint(
      context,
      tagName: 'text',
      coreAttributes: coreAttributes,
      presentationAttributes: presentationAttributes,
    );

    final SvgPaintingContext textContext = context.deriveWith(this);
    final PaintingTextSpan rootSpan = _buildSpan(children, textContext, 'text');

    return Success<List<PaintCommand>>(<PaintCommand>[
      DrawText(x: finalX, y: finalY, rootSpan: rootSpan, style: style, id: id),
    ]);
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
