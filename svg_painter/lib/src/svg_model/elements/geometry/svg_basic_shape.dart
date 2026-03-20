part of '../../svg_element.dart';

/// Base class for basic shape elements (`<circle>`, `<rect>`, etc.).
@immutable
sealed class SvgBasicShape extends SvgGraphicsElement with SvgGeometryAttributable {
  const SvgBasicShape({
    this.geometryAttributes,
    super.presentationAttributes,
    super.coreAttributes,
  });

  @override
  final SvgGeometryAttributes? geometryAttributes;
}
