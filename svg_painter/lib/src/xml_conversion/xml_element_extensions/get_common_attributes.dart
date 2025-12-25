import 'package:xml/xml.dart';

import '../../svg_model/_svg_model.dart';
import '../../xml_model/_xml_model.dart';
import '_xml_element_extensions.dart';

/// Resolved common attributes for a graphics element.
typedef CommonAttributes = ({
  String? id,
  SvgColor? fill,
  SvgColor? stroke,
  SvgLengthPercentage? strokeWidth,
  SvgStrokeLinecap? strokeLinecap,
  SvgStrokeLinejoin? strokeLinejoin,
  SvgLengthPercentage? opacity,
  String? transform,
});

extension XmlElementCommonAttributes on XmlElement {
  /// Extracts common graphics attributes from this element.
  CommonAttributes getCommonAttributes(XmlElementName elementName) {
    return (
      id: getXmlAttributeValue(XmlAttributeName.id),
      fill: toSvgValueOrNull<SvgColor>(elementName, XmlAttributeName.fill),
      stroke: toSvgValueOrNull<SvgColor>(elementName, XmlAttributeName.stroke),
      strokeWidth: toSvgValueOrNull<SvgLengthPercentage>(elementName, XmlAttributeName.strokeWidth),
      strokeLinecap: toSvgValueOrNull<SvgStrokeLinecap>(elementName, XmlAttributeName.strokeLinecap),
      strokeLinejoin:
          toSvgValueOrNull<SvgStrokeLinejoin>(elementName, XmlAttributeName.strokeLinejoin),
      opacity: toSvgValueOrNull<SvgLengthPercentage>(elementName, XmlAttributeName.opacity),
      transform: getXmlAttributeValue(XmlAttributeName.transform),
    );
  }
}
