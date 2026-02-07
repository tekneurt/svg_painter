import 'package:meta/meta.dart';

import '../../svg_model/_svg_model.dart';

part 'painting_fill_style.dart';
part 'painting_stroke_style.dart';
part 'painting_text_style.dart';

/// Represents the visual style (fill and stroke) for a drawing command.
@immutable
final class PaintingStyle {
  const PaintingStyle({
    this.fill,
    this.stroke,
    this.text,
    this.groupOpacity = 1.0,
    this.transformAttributes,
  });

  /// The filling style, or null if the element is not filled.
  final PaintingFillStyle? fill;

  /// The stroking style, or null if the element is not stroked.
  final PaintingStrokeStyle? stroke;

  /// The text style, or null if the element is not text.
  final PaintingTextStyle? text;

  /// The transparency of the element group (0.0 to 1.0).
  final double groupOpacity;

  /// The structured transform attributes applied to this element.
  final SvgTransformAttributes? transformAttributes;

  @override
  String toString() {
    return 'PaintingStyle(fill: $fill, stroke: $stroke, text: $text, groupOpacity: $groupOpacity, transform: $transformAttributes)';
  }
}
