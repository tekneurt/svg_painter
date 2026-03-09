import 'package:xml/xml.dart';

import '../../svg_model/_svg_model.dart';
import '../../xml_model/_xml_model.dart';
import '../parsers/svg_transform_parser.dart';
import '_xml_element_extensions.dart';

/// Resolved common attributes for a graphics element.
typedef CommonAttributes = ({
  String? id,
  SvgFillAttributes fillAttributes,
  SvgStrokeAttributes strokeAttributes,
  SvgFontAttributes fontAttributes,
  SvgLengthPercentage? opacity,
  String? cssClass,
  String? inlineStyle,
  SvgTransformAttributes? transformAttributes,
});

extension ToCommonAttributes on XmlElement {
  /// Extracts common graphics attributes from this element.
  CommonAttributes toCommonAttributes(XmlElementName elementName) {
    return (
      id: toXmlAttributeValue(XmlAttributeName.id),
      fillAttributes: SvgFillAttributes(
        color: toSvgValueOrNull<SvgColor>(elementName, XmlAttributeName.fill),
        opacity: toSvgValueOrNull<SvgLengthPercentage>(elementName, XmlAttributeName.fillOpacity),
      ),
      strokeAttributes: SvgStrokeAttributes(
        color: toSvgValueOrNull<SvgColor>(elementName, XmlAttributeName.stroke),
        opacity: toSvgValueOrNull<SvgLengthPercentage>(elementName, XmlAttributeName.strokeOpacity),
        width: toSvgValueOrNull<SvgLengthPercentage>(elementName, XmlAttributeName.strokeWidth),
        dashArray: toSvgValueOrNull<SvgPointList>(elementName, XmlAttributeName.strokeDasharray),
        linecap: toSvgValueOrNull<SvgStrokeLinecap>(elementName, XmlAttributeName.strokeLinecap),
        linejoin: toSvgValueOrNull<SvgStrokeLinejoin>(elementName, XmlAttributeName.strokeLinejoin),
      ),
      fontAttributes: SvgFontAttributes(
        size: toSvgValueOrNull<SvgLengthPercentage>(elementName, XmlAttributeName.fontSize),
        weight: toSvgValueOrNull<SvgFontWeight>(elementName, XmlAttributeName.fontWeight),
        style: toSvgValueOrNull<SvgFontStyle>(elementName, XmlAttributeName.fontStyle),
        family: toSvgValueOrNull<SvgFontFamily>(elementName, XmlAttributeName.fontFamily),
      ),
      opacity: toSvgValueOrNull<SvgLengthPercentage>(elementName, XmlAttributeName.opacity),
      cssClass: toXmlAttributeValue(XmlAttributeName.className),
      inlineStyle: toXmlAttributeValue(XmlAttributeName.style),
      transformAttributes: SvgTransformParser.parse(
        toXmlAttributeValue(XmlAttributeName.transform),
      ),
    );
  }
}
