import 'package:xml/xml.dart';

import '../../svg_model/_svg_model.dart';
import '../../xml_model/_xml_model.dart';
import '../parsers/svg_transform_parser.dart';
import '_xml_element_extensions.dart';

/// Resolved common attributes for an SVG element.
typedef CommonAttributes = ({
  SvgCoreAttributes core,
  SvgPresentationAttributes presentation,
  SvgTitle? title,
  SvgDesc? desc,
});

extension ToCommonAttributes on XmlElement {
  /// Extracts common attributes from this element.
  CommonAttributes toCommonAttributes(XmlElementName elementName) {
    final core = SvgCoreAttributes(
      id: toXmlAttributeValue(XmlAttributeName.id),
      cssClass: toXmlAttributeValue(XmlAttributeName.className),
      inlineStyle: toXmlAttributeValue(XmlAttributeName.style),
    );

    final XmlElement? titleElement = children
        .whereType<XmlElement>()
        .where((XmlElement e) => e.name.local == 'title')
        .firstOrNull;
    final XmlElement? descElement = children
        .whereType<XmlElement>()
        .where((XmlElement e) => e.name.local == 'desc')
        .firstOrNull;

    final SvgTitle? title = titleElement != null
        ? SvgTitle(
            content: titleElement.innerText.trim(),
            coreAttributes: SvgCoreAttributes(
              id: titleElement.getAttribute(XmlAttributeName.id.name),
            ),
          )
        : null;

    final SvgDesc? desc = descElement != null
        ? SvgDesc(
            content: descElement.innerText.trim(),
            coreAttributes: SvgCoreAttributes(
              id: descElement.getAttribute(XmlAttributeName.id.name),
            ),
          )
        : null;

    final presentation = SvgPresentationAttributes(
      color: toSvgValueOrNull<SvgColor>(elementName, XmlAttributeName.color),
      fill: SvgFillAttributes(
        color: toSvgValueOrNull<SvgColor>(elementName, XmlAttributeName.fill),
        opacity: toSvgValueOrNull<SvgLengthPercentage>(elementName, XmlAttributeName.fillOpacity),
        rule: toSvgValueOrNull<SvgFillRule>(elementName, XmlAttributeName.fillRule),
      ),
      stroke: SvgStrokeAttributes(
        color: toSvgValueOrNull<SvgColor>(elementName, XmlAttributeName.stroke),
        opacity: toSvgValueOrNull<SvgLengthPercentage>(elementName, XmlAttributeName.strokeOpacity),
        width: toSvgValueOrNull<SvgLengthPercentage>(elementName, XmlAttributeName.strokeWidth),
        dashArray: toSvgValueOrNull<SvgPointList>(elementName, XmlAttributeName.strokeDasharray),
        dashOffset: toSvgValueOrNull<SvgLengthPercentage>(elementName, XmlAttributeName.strokeDashoffset),
        linecap: toSvgValueOrNull<SvgStrokeLinecap>(elementName, XmlAttributeName.strokeLinecap),
        linejoin: toSvgValueOrNull<SvgStrokeLinejoin>(elementName, XmlAttributeName.strokeLinejoin),
      ),
      font: SvgFontAttributes(
        size: toSvgValueOrNull<SvgLengthPercentage>(elementName, XmlAttributeName.fontSize),
        weight: toSvgValueOrNull<SvgFontWeight>(elementName, XmlAttributeName.fontWeight),
        style: toSvgValueOrNull<SvgFontStyle>(elementName, XmlAttributeName.fontStyle),
        family: toSvgValueOrNull<SvgFontFamily>(elementName, XmlAttributeName.fontFamily),
        anchor: toSvgValueOrNull<SvgTextAnchor>(elementName, XmlAttributeName.textAnchor),
      ),
      graphics: SvgGraphicsAttributes(
        opacity: toSvgValueOrNull<SvgLengthPercentage>(elementName, XmlAttributeName.opacity),
        transformAttributes: SvgTransformParser.parse(
          toXmlAttributeValue(XmlAttributeName.transform),
        ),
        mask: getAttribute(XmlAttributeName.mask.name),
        clipPath: getAttribute(XmlAttributeName.clipPath.name),
      ),
      paintOrder: toSvgValueOrNull<SvgPaintOrder>(elementName, XmlAttributeName.paintOrder),
      vectorEffect: toSvgValueOrNull<SvgVectorEffect>(elementName, XmlAttributeName.vectorEffect),
    );

    return (
      core: core,
      presentation: presentation,
      title: title,
      desc: desc,
    );
  }
}
