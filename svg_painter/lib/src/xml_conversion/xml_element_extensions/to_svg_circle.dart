import 'package:xml/xml.dart';

import '../../base/_base.dart';
import '../../svg_model/_svg_model.dart';
import '../../xml_model/_xml_model.dart';
import '../_xml_conversion.dart';

extension ElementToSvg on XmlElement {
  /// Converts this [XmlElement] to an [SvgCircle].
  Result<SvgCircle> toSvgCircle() {
    const XmlElementName elementName = XmlElementName.circle;

    final SvgLengthPercentage cx = toSvgValue<SvgLengthPercentage>(
      elementName,
      XmlAttributeName.cx,
    );
    final SvgLengthPercentage cy = toSvgValue<SvgLengthPercentage>(
      elementName,
      XmlAttributeName.cy,
    );
    final SvgLengthPercentage r = toSvgValue<SvgLengthPercentage>(elementName, XmlAttributeName.r);

    final CommonAttributes common = getCommonAttributes(elementName);

    return Success<SvgCircle>(
      SvgCircle(
        cx: cx,
        cy: cy,
        r: r,
        fill: common.fill,
        stroke: common.stroke,
        strokeWidth: common.strokeWidth,
        strokeLinecap: common.strokeLinecap,
        strokeLinejoin: common.strokeLinejoin,
        opacity: common.opacity,
        cssClass: common.cssClass,
        inlineStyle: common.inlineStyle,
        transform: common.transform,
        id: common.id,
      ),
    );
  }
}
