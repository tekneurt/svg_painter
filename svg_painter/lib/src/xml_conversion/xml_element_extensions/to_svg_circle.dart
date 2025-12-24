import 'package:xml/xml.dart';

import '../../base/_base.dart';
import '../../svg_model/_svg_model.dart';
import '../../xml_model/_xml_model.dart';
import '../_xml_conversion.dart';

extension ElementToSvg on XmlElement {
  /// Converts this [XmlElement] to an [SvgCircle].
  Result<SvgCircle> toSvgCircle() {
    const XmlElementName elementName = XmlElementName.circle; // Context for defaults

    final SvgLengthPercentage cx = toSvgValue<SvgLengthPercentage>(
      elementName,
      XmlAttributeName.cx,
    );
    final SvgLengthPercentage cy = toSvgValue<SvgLengthPercentage>(
      elementName,
      XmlAttributeName.cy,
    );
    final SvgLengthPercentage r = toSvgValue<SvgLengthPercentage>(elementName, XmlAttributeName.r);

    final SvgColor? fill = toSvgValueOrNull<SvgColor>(elementName, XmlAttributeName.fill);
    final SvgColor? stroke = toSvgValueOrNull<SvgColor>(elementName, XmlAttributeName.stroke);
    final SvgLengthPercentage? strokeWidth = toSvgValueOrNull<SvgLengthPercentage>(
      elementName,
      XmlAttributeName.strokeWidth,
    );

    final String? id = getXmlAttributeValue(XmlAttributeName.id);
    final String? transform = getXmlAttributeValue(XmlAttributeName.transform);

    return Success<SvgCircle>(
      SvgCircle(
        cx: cx,
        cy: cy,
        r: r,
        fill: fill,
        stroke: stroke,
        strokeWidth: strokeWidth,
        transform: transform,
        id: id,
      ),
    );
  }
}
