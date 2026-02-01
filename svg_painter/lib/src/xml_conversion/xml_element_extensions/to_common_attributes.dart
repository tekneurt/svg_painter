import 'package:xml/xml.dart';

import '../../svg_model/_svg_model.dart';
import '../../xml_model/_xml_model.dart';
import '_xml_element_extensions.dart';

/// Resolved common attributes for a graphics element.
typedef CommonAttributes = ({
  String? id,
  SvgFillAttributes fill,
  SvgStrokeAttributes stroke,
  SvgFontAttributes font,
  SvgLengthPercentage? opacity,
  String? cssClass,
  String? inlineStyle,
  String? transform,
});

extension ToCommonAttributes on XmlElement {
  /// Extracts common graphics attributes from this element.
  CommonAttributes toCommonAttributes(XmlElementName elementName) {
    return (
      id: toXmlAttributeValue(XmlAttributeName.id),
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
        weight: toXmlAttributeValue(XmlAttributeName.fontWeight),
        style: toXmlAttributeValue(XmlAttributeName.fontStyle),
        family: toXmlAttributeValue(XmlAttributeName.fontFamily),
      ),
      opacity: toSvgValueOrNull<SvgLengthPercentage>(elementName, XmlAttributeName.opacity),
      cssClass: toXmlAttributeValue(XmlAttributeName.className),
      inlineStyle: toXmlAttributeValue(XmlAttributeName.style),
      transform: toXmlAttributeValue(XmlAttributeName.transform),
    );
  }
}
