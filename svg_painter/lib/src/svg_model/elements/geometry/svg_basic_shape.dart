part of '../../svg_element.dart';

/// Base class for basic shape elements (`<circle>`, `<rect>`, etc.).
@immutable
sealed class SvgBasicShape extends SvgGraphicsElement with SvgGeometry {
  const SvgBasicShape({
    this.pathLength,
    super.fillAttributes,
    super.strokeAttributes,
    super.opacity,
    super.cssClass,
    super.inlineStyle,
    super.transform,
    super.id,
  });

  @override
  final SvgNumber? pathLength;
}
