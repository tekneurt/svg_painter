import 'package:xml/xml.dart';

import '../../svg_model/_svg_model.dart';
import '../../xml_model/_xml_model.dart';
import '../parsers/svg_transform_parser.dart';
import '_xml_element_extensions.dart';

/// Resolved common attributes for an SVG element.
typedef CommonAttributes = ({
  SvgCoreAttributes core,
  SvgPresentationAttributes presentation,
});

extension ToCommonAttributes on XmlElement {
  /// Extracts common attributes from this element.
  CommonAttributes toCommonAttributes(XmlElementName elementName) {
    final SvgCoreAttributes core = SvgCoreAttributes(
      id: toXmlAttributeValue(XmlAttributeName.id),
      cssClass: toXmlAttributeValue(XmlAttributeName.className),
      inlineStyle: toXmlAttributeValue(XmlAttributeName.style),
    );

    final SvgPresentationAttributes presentation = SvgPresentationAttributes(
      fill: SvgFillAttributes(
        color: toSvgValueOrNull<SvgColor>(elementName, XmlAttributeName.fill),
        opacity: toSvgValueOrNull<SvgLengthPercentage>(elementName, XmlAttributeName.fillOpacity),
      ),
      stroke: SvgStrokeAttributes(
        color: toSvgValueOrNull<SvgColor>(elementName, XmlAttributeName.stroke),
        opacity: toSvgValueOrNull<SvgLengthPercentage>(elementName, XmlAttributeName.strokeOpacity),
        width: toSvgValueOrNull<SvgLengthPercentage>(elementName, XmlAttributeName.strokeWidth),
        dashArray: toSvgValueOrNull<SvgPointList>(elementName, XmlAttributeName.strokeDasharray),
        linecap: toSvgValueOrNull<SvgStrokeLinecap>(elementName, XmlAttributeName.strokeLinecap),
        linejoin: toSvgValueOrNull<SvgStrokeLinejoin>(elementName, XmlAttributeName.strokeLinejoin),
      ),
      font: SvgFontAttributes(
        size: toSvgValueOrNull<SvgLengthPercentage>(elementName, XmlAttributeName.fontSize),
        weight: toSvgValueOrNull<SvgFontWeight>(elementName, XmlAttributeName.fontWeight),
        style: toSvgValueOrNull<SvgFontStyle>(elementName, XmlAttributeName.fontStyle),
        family: toSvgValueOrNull<SvgFontFamily>(elementName, XmlAttributeName.fontFamily),
      ),
      graphics: SvgGraphicsAttributes(
        opacity: toSvgValueOrNull<SvgLengthPercentage>(elementName, XmlAttributeName.opacity),
        transformAttributes: SvgTransformParser.parse(
          toXmlAttributeValue(XmlAttributeName.transform),
        ),
      ),
    );

    return (core: core, presentation: presentation);
  }
}
