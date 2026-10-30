import '../../base/_base.dart';
import '../../painting_model/_painting_model.dart';
import '../../svg_model/_svg_model.dart';
import '../svg_value_extensions/_svg_value_extensions.dart';
import 'svg_paint_resolver.dart';
import 'svg_painting_context.dart';
import 'svg_root_to_painting.dart';
import 'svg_to_painting.dart';
import 'symbol_to_painting.dart';

/// Extension for <use> element conversion.
extension SvgUseToPaintCommands on SvgUse {
  /// Converts this [SvgUse] to a list of [PaintCommand]s.
  Result<List<PaintCommand>> toPaintCommandsUse(SvgPaintingContext context) {
    final String? hrefVal = href;
    if (hrefVal == null || hrefVal.isEmpty) {
      final PaintingStyle style = resolvePaint(
        context,
        tagName: 'use',
        coreAttributes: coreAttributes,
        presentationAttributes: presentationAttributes,
      );
      if (style.filterId case final String fId) {
        double dx = x.resolve(context, .horizontal);
        double dy = y.resolve(context, .vertical);
        double? w = width?.resolveOrNull(context, .horizontal);
        double? h = height?.resolveOrNull(context, .vertical);

        if (w == null || h == null) {
          final SvgElement? filterElem = context.definitions[fId];
          if (filterElem is SvgFilter) {
            for (final SvgFilterPrimitive prim in filterElem.primitives) {
              if (prim is SvgFeFlood) {
                dx = prim.x?.resolveOrNull(context, .horizontal) ?? dx;
                dy = prim.y?.resolveOrNull(context, .vertical) ?? dy;
                w = prim.width?.resolveOrNull(context, .horizontal) ?? w;
                h = prim.height?.resolveOrNull(context, .vertical) ?? h;
                break;
              }
            }
          }
        }

        return Success<List<PaintCommand>>([
          DrawRect(
            x: dx,
            y: dy,
            width: w ?? 0.0,
            height: h ?? 0.0,
            rx: 0.0,
            ry: 0.0,
            style: style,
          ),
        ]);
      } else {
        return const Success<List<PaintCommand>>([]);
      }
    }

    final String targetId = hrefVal.startsWith('#') ? hrefVal.substring(1) : hrefVal;
    final SvgElement? target = context.definitions[targetId];

    if (target == null) {
      return Failure<List<PaintCommand>>(
        'Could not find definition for ID "$targetId" referenced by <use>.',
      );
    }

    // <use> x/y act as a translation.
    final double dx = x.resolve(context, SvgOrientation.horizontal);
    final double dy = y.resolve(context, SvgOrientation.vertical);

    final ops = <SvgTransformOperation>[];
    if (dx != 0 || dy != 0) {
      ops.add(SvgTranslate(dx, dy));
    }
    final SvgTransformAttributes? ta = transformAttributes;
    if (ta != null) {
      ops.addAll(ta.operations);
    }

    final PaintingStyle style = resolvePaint(
      context,
      tagName: 'use',
      coreAttributes: coreAttributes,
      presentationAttributes: (presentationAttributes ?? const SvgPresentationAttributes()).merge(
        SvgPresentationAttributes(
          graphics: SvgGraphicsAttributes(
            transformAttributes: ops.isEmpty ? null : SvgTransformAttributes(ops),
          ),
        ),
      ),
    );

    PaintingRect? targetBounds;
    if (target is SvgBounded) {
      final double tx = target.x?.resolveOrNull(context, SvgOrientation.horizontal) ?? 0.0;
      final double ty = target.y?.resolveOrNull(context, SvgOrientation.vertical) ?? 0.0;
      final double tw = target.width?.resolveOrNull(context, SvgOrientation.horizontal) ?? 100.0;
      final double th = target.height?.resolveOrNull(context, SvgOrientation.vertical) ?? 100.0;
      targetBounds = PaintingRect(tx, ty, tw, th);
    }

    final SvgPresentationAttributes resolvedUseAttrs = resolvePresentation(
      context,
      tagName: 'use',
      coreAttributes: coreAttributes,
      presentationAttributes: presentationAttributes,
    );

    // Context for children inherits styles, but coordinates are now in the <use> local space.
    // Elements referenced by <use> inherit context-fill and context-stroke from the <use> element.
    final SvgPaintingContext childContext = context.deriveWith(this).derive(
      contextFill: resolvedUseAttrs.fill,
      contextStroke: resolvedUseAttrs.stroke,
    );

    if (target is SvgSymbol) {
      // For symbols, we establish a NEW viewport.
      return target
          .toPaintCommandsSymbol(
            childContext,
            x: const SvgLength(0.0),
            y: const SvgLength(0.0),
            width: width,
            height: height,
          )
          .map((List<PaintCommand> childCommands) {
            return <PaintCommand>[
              DrawGroup(
                commands: childCommands,
                style: style,
                id: id,
                opacity: style.groupOpacity,
                bounds: targetBounds,
              ),
            ];
          });
    }

    if (target is SvgSvg) {
      // For nested <svg>, width and height from <use> override those on <svg>.
      return target
          .toPaintCommandsSvg(
            childContext,
            x: const SvgLength(0.0),
            y: const SvgLength(0.0),
            width: width,
            height: height,
          )
          .map((List<PaintCommand> childCommands) {
            return <PaintCommand>[
              DrawGroup(
                commands: childCommands,
                style: style,
                id: id,
                opacity: style.groupOpacity,
                bounds: targetBounds,
              ),
            ];
          });
    }

    return target.toPaintCommands(childContext).map((List<PaintCommand> childCommands) {
      if (childCommands.isEmpty) {
        return const <PaintCommand>[];
      }
      return <PaintCommand>[
        DrawGroup(
          commands: childCommands,
          style: style,
          id: id,
          opacity: style.groupOpacity,
          bounds: targetBounds,
        ),
      ];
    });
  }
}
