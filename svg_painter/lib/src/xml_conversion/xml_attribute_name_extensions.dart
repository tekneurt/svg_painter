import '../svg_model/_svg_model.dart';
import '../xml_model/_xml_model.dart';

extension XmlAttributeDefaultValues on XmlAttributeName {
  SvgBaseValue getDefaultValue(final XmlElementName elementName) {
    switch (this) {
      case XmlAttributeName.x:
      case XmlAttributeName.y:
        return switch (elementName) {
          XmlElementName.rect || XmlElementName.use => const SvgLength(0.0),
          (_) => throw UnsupportedError('Invalid combination $this x $elementName '),
        };
      case XmlAttributeName.x1:
      case XmlAttributeName.y1:
      case XmlAttributeName.y2:
        return switch (elementName) {
          XmlElementName.linearGradient => const SvgPercentage(0.0),
          XmlElementName.line => const SvgLength(0.0),
          (_) => throw UnsupportedError('Invalid combination $this x $elementName '),
        };
      case XmlAttributeName.x2:
        return switch (elementName) {
          XmlElementName.linearGradient => const SvgPercentage(100.0),
          XmlElementName.line => const SvgLength(0.0),
          (_) => throw UnsupportedError('Invalid combination $this x $elementName '),
        };
      case XmlAttributeName.cx:
      case XmlAttributeName.cy:
        return switch (elementName) {
          XmlElementName.circle || XmlElementName.ellipse => const SvgLength(0.0),
          XmlElementName.radialGradient => const SvgPercentage(50.0),
          (_) => throw UnsupportedError('Invalid combination $this x $elementName '),
        };
      case XmlAttributeName.r:
        return switch (elementName) {
          XmlElementName.circle => const SvgLength(0.0),
          XmlElementName.radialGradient => const SvgPercentage(50.0),
          (_) => throw UnsupportedError('Invalid combination $this x $elementName '),
        };
      case XmlAttributeName.rx:
      case XmlAttributeName.ry:
        return switch (elementName) {
          XmlElementName.ellipse || XmlElementName.rect => const SvgAuto(),
          (_) => throw UnsupportedError('Invalid combination $this x $elementName '),
        };
      case XmlAttributeName.width:
      case XmlAttributeName.height:
        return switch (elementName) {
          XmlElementName.svg || XmlElementName.rect || XmlElementName.use => const SvgAuto(),
          (_) => throw UnsupportedError('Invalid combination $this x $elementName '),
        };
      case XmlAttributeName.points:
        return const SvgPointList(<double>[]);
      case XmlAttributeName.fill:
        return switch (elementName) {
          XmlElementName.line => const SvgNoneColor(),
          (_) => const SvgNamedColor(SvgColorName.black),
        };
      case XmlAttributeName.stroke:
        return const SvgNoneColor();
      case XmlAttributeName.strokeWidth:
        return const SvgLength(1.0);
      case XmlAttributeName.strokeLinecap:
        return SvgStrokeLinecap.butt;
      case XmlAttributeName.strokeLinejoin:
        return SvgStrokeLinejoin.miter;
      case XmlAttributeName.offset:
        return const SvgLength(0.0);
      case XmlAttributeName.stopColor:
        return const SvgNamedColor(SvgColorName.black);
      case XmlAttributeName.stopOpacity:
        return const SvgLength(1.0);
      case XmlAttributeName.opacity:
      case XmlAttributeName.fillOpacity:
      case XmlAttributeName.strokeOpacity:
        return const SvgLength(1.0);
      case XmlAttributeName.fx:
      case XmlAttributeName.fy:
        return switch (elementName) {
          XmlElementName.radialGradient => const SvgPercentage(50.0),
          (_) => throw UnsupportedError('Invalid combination $this x $elementName '),
        };
      case XmlAttributeName.fr:
        return switch (elementName) {
          XmlElementName.radialGradient => const SvgPercentage(0.0),
          (_) => throw UnsupportedError('Invalid combination $this x $elementName '),
        };
      case XmlAttributeName.viewBox:
      case XmlAttributeName.id:
      case XmlAttributeName.d:
      case XmlAttributeName.className:
      case XmlAttributeName.style:
      case XmlAttributeName.href:
      case XmlAttributeName.transform:
      case XmlAttributeName.gradientTransform:
      case XmlAttributeName.fontSize:
      case XmlAttributeName.fontWeight:
      case XmlAttributeName.fontStyle:
      case XmlAttributeName.fontFamily:
      case XmlAttributeName.pathLength:
      case XmlAttributeName.strokeDasharray:
        throw UnsupportedError('$name does not have a SvgBaseValue default');
    }
  }
}
