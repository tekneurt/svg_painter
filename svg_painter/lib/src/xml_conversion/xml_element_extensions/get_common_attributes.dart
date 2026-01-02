import 'package:xml/xml.dart';

import '../../svg_model/_svg_model.dart';
import '../../xml_model/_xml_model.dart';
import '_xml_element_extensions.dart';

/// Resolved common attributes for a graphics element.
typedef CommonAttributes = ({
  String? id,
  SvgColor? fill,
  SvgLengthPercentage? fillOpacity,
  SvgColor? stroke,
  SvgLengthPercentage? strokeOpacity,
  SvgLengthPercentage? strokeWidth,
  SvgStrokeLinecap? strokeLinecap,
  SvgStrokeLinejoin? strokeLinejoin,
  SvgLengthPercentage? opacity,
  SvgLengthPercentage? fontSize,
  String? fontWeight,
  String? fontStyle,
  String? fontFamily,
  String? cssClass,
  String? inlineStyle,
  String? transform,
  SvgLength? pathLength,
  SvgPointList? strokeDasharray,
});

extension XmlElementCommonAttributes on XmlElement {
  /// Extracts common graphics attributes from this element.
  CommonAttributes getCommonAttributes(XmlElementName elementName) {
    return (
      id: getXmlAttributeValue(XmlAttributeName.id),
      fill: toSvgValueOrNull<SvgColor>(elementName, XmlAttributeName.fill),
      fillOpacity: toSvgValueOrNull<SvgLengthPercentage>(elementName, XmlAttributeName.fillOpacity),
      stroke: toSvgValueOrNull<SvgColor>(elementName, XmlAttributeName.stroke),
      strokeOpacity: toSvgValueOrNull<SvgLengthPercentage>(
        elementName,
        XmlAttributeName.strokeOpacity,
      ),
      strokeWidth: toSvgValueOrNull<SvgLengthPercentage>(elementName, XmlAttributeName.strokeWidth),
      strokeDasharray: toSvgValueOrNull<SvgPointList>(
        elementName,
        XmlAttributeName.strokeDasharray,
      ),
      strokeLinecap: toSvgValueOrNull<SvgStrokeLinecap>(
        elementName,
        XmlAttributeName.strokeLinecap,
      ),
      strokeLinejoin: toSvgValueOrNull<SvgStrokeLinejoin>(
        elementName,
        XmlAttributeName.strokeLinejoin,
      ),
      opacity: toSvgValueOrNull<SvgLengthPercentage>(elementName, XmlAttributeName.opacity),
      fontSize: toSvgValueOrNull<SvgLengthPercentage>(elementName, XmlAttributeName.fontSize),
      fontWeight: getXmlAttributeValue(XmlAttributeName.fontWeight),
      fontStyle: getXmlAttributeValue(XmlAttributeName.fontStyle),
      fontFamily: getXmlAttributeValue(XmlAttributeName.fontFamily),
      cssClass: getXmlAttributeValue(XmlAttributeName.className),
      inlineStyle: getXmlAttributeValue(XmlAttributeName.style),
      transform: getXmlAttributeValue(XmlAttributeName.transform),
      pathLength: toSvgValueOrNull<SvgLength>(elementName, XmlAttributeName.pathLength),
    );
  }
}
