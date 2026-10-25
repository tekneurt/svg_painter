import 'dart:io';

import 'package:xml/xml.dart';

import '../../base/_base.dart';
import '../../svg_model/_svg_model.dart';
import '../../xml_model/_xml_model.dart';
import '../_xml_conversion.dart';

extension ToSvgElement on XmlElement {
  /// Converts this [XmlElement] to an [SvgElement].
  Result<SvgElement> toSvgElement() {
    const svgNamespace = 'http://www.w3.org/2000/svg';
    final String? ns = namespaceUri;

    if (ns == null || ns == svgNamespace) {
      // Process elements in the SVG namespace or those without a namespace.
      final XmlElementName? elementName = XmlElementName.from(name.local);

      if (elementName == null) {
        // Treat unknown elements as groups per SVG spec (container behavior).
        stdout.writeln('$unsupportedFeaturePrefix: <${name.local}>. Treating as group.');
        return toSvgGroup();
      }

      switch (elementName) {
        case .a:
          return toSvgA();
        case .svg:
          // Only the root SVG element of the document should be mapped to SvgRoot.
          // Nested <svg> elements are standard SvgSvg containers.
          return _isRootSvg(this) ? toSvgRoot() : _toSvgSvg();
        case .circle:
          return toSvgCircle();
        case .ellipse:
          return toSvgEllipse();
        case .rect:
          return toSvgRect();
        case .line:
          return toSvgLine();
        case .image:
          return toSvgImage();
        case .path:
          return toSvgPath();
        case .polyline:
          return toSvgPolyline();
        case .polygon:
          return toSvgPolygon();
        case .defs:
          return toSvgDefs();
        case .g:
          return toSvgGroup();
        case .symbol:
          return toSvgSymbol();
        case .use:
          return toSvgUse();
        case .radialGradient:
          return toSvgRadialGradient();
        case .linearGradient:
          return toSvgLinearGradient();
        case .stop:
          return toSvgStop();
        case .style:
          return toSvgStyle();
        case .text:
          return toSvgText();
        case .textPath:
          return toSvgTextPath();
        case .tspan:
          return toSvgTspan();
        case .marker:
          return toSvgMarker();
        case .mask:
          return toSvgMask();
        case .pattern:
          return toSvgPattern();
        case .clipPath:
          return toSvgClipPath();
        case .filter:
          return toSvgFilter();
        case .feComponentTransfer:
          return toSvgFeComponentTransfer();
        case .feFuncR:
          return toSvgFeFuncR();
        case .feFuncG:
          return toSvgFeFuncG();
        case .feFuncB:
          return toSvgFeFuncB();
        case .feFuncA:
          return toSvgFeFuncA();
        case .feGaussianBlur:
          return toSvgFeGaussianBlur();
        case .feOffset:
          return toSvgFeOffset();
        case .feMerge:
          return toSvgFeMerge();
        case .feMergeNode:
          return toSvgFeMergeNode();
        case .title:
          final CommonAttributes common = toCommonAttributes(elementName);
          return Success<SvgTitle>(
            SvgTitle(content: innerText.trim(), coreAttributes: common.core),
          );
        case .desc:
          final CommonAttributes common = toCommonAttributes(elementName);
          return Success<SvgDesc>(
            SvgDesc(content: innerText.trim(), coreAttributes: common.core),
          );
      }
    } else {
      // Ignore elements from foreign namespaces (e.g., Inkscape, RDF).
      return Success<SvgIgnoredElement>(
        SvgIgnoredElement(
          coreAttributes: SvgCoreAttributes(id: toXmlAttributeValue(XmlAttributeName.id)),
        ),
      );
    }
  }

  Result<SvgSvg> _toSvgSvg() {
    const XmlElementName elementName = XmlElementName.svg;
    final Result<List<SvgElement>> childrenResult = children
        .whereType<XmlElement>()
        .map((XmlElement child) => child.toSvgElement())
        .combine();

    final SvgLengthPercentageAuto width = toSvgValue<SvgLengthPercentageAuto>(
      elementName,
      XmlAttributeName.width,
    );
    final SvgLengthPercentageAuto height = toSvgValue<SvgLengthPercentageAuto>(
      elementName,
      XmlAttributeName.height,
    );
    final SvgLengthPercentage? x = toSvgValueOrNull<SvgLengthPercentage>(
      elementName,
      XmlAttributeName.x,
    );
    final SvgLengthPercentage? y = toSvgValueOrNull<SvgLengthPercentage>(
      elementName,
      XmlAttributeName.y,
    );
    final SvgViewBox? viewBox = toXmlAttributeValue(XmlAttributeName.viewBox)?.toSvgViewBox();
    final SvgPreserveAspectRatio? preserveAspectRatio = toXmlAttributeValue(
      XmlAttributeName.preserveAspectRatio,
    )?.toSvgPreserveAspectRatio();

    final CommonAttributes common = toCommonAttributes(elementName);

    return childrenResult.map(
      (List<SvgElement> childElements) => SvgSvg(
        children: childElements,
        title: common.title,
        desc: common.desc,
        x: x,
        y: y,
        width: width,
        height: height,
        viewportAttributes: SvgViewportAttributes(
          viewBox: viewBox,
          preserveAspectRatio: preserveAspectRatio,
        ),
        presentationAttributes: common.presentation,
        coreAttributes: common.core,
      ),
    );
  }

  bool _isRootSvg(XmlElement element) {
    XmlElement? current = element.parentElement;
    while (current != null) {
      if (current.name.local == XmlElementName.svg.tagName) {
        return false;
      }
      current = current.parentElement;
    }
    return true;
  }
}
