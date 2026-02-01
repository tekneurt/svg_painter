import 'package:xml/xml.dart';

import '../../svg_model/_svg_model.dart';
import '../../xml_model/_xml_model.dart';
import '_xml_element_extensions.dart';

/// Resolved common attributes for a graphics element.
typedef CommonAttributes = ({
  String? id,
  SvgColor? fill,
  SvgLengthPercentage? fillOpacity,
  SvgStrokeAttributes? stroke,
  SvgLengthPercentage? opacity,
  SvgLengthPercentage? fontSize,
  String? fontWeight,
  String? fontStyle,
  String? fontFamily,
  String? cssClass,
  String? inlineStyle,
  String? transform,
});

extension ToCommonAttributes on XmlElement {
  /// Extracts common graphics attributes from this element.
  CommonAttributes toCommonAttributes(XmlElementName elementName) {
    return (
      id: toXmlAttributeValue(XmlAttributeName.id),
      fill: toSvgValueOrNull<SvgColor>(elementName, XmlAttributeName.fill),
      fillOpacity: toSvgValueOrNull<SvgLengthPercentage>(elementName, XmlAttributeName.fillOpacity),
      stroke: SvgStrokeAttributes(
        color: toSvgValueOrNull<SvgColor>(elementName, XmlAttributeName.stroke),
        opacity: toSvgValueOrNull<SvgLengthPercentage>(elementName, XmlAttributeName.strokeOpacity),
        width: toSvgValueOrNull<SvgLengthPercentage>(elementName, XmlAttributeName.strokeWidth),
        dashArray: toSvgValueOrNull<SvgPointList>(elementName, XmlAttributeName.strokeDasharray),
        linecap: toSvgValueOrNull<SvgStrokeLinecap>(elementName, XmlAttributeName.strokeLinecap),
        linejoin: toSvgValueOrNull<SvgStrokeLinejoin>(elementName, XmlAttributeName.strokeLinejoin),
      ),
      opacity: toSvgValueOrNull<SvgLengthPercentage>(elementName, XmlAttributeName.opacity),
      fontSize: toSvgValueOrNull<SvgLengthPercentage>(elementName, XmlAttributeName.fontSize),
      fontWeight: toXmlAttributeValue(XmlAttributeName.fontWeight),
      fontStyle: toXmlAttributeValue(XmlAttributeName.fontStyle),
      fontFamily: toXmlAttributeValue(XmlAttributeName.fontFamily),
      cssClass: toXmlAttributeValue(XmlAttributeName.className),
      inlineStyle: toXmlAttributeValue(XmlAttributeName.style),
      transform: toXmlAttributeValue(XmlAttributeName.transform),
    );
  }
}
