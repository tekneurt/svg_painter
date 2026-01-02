import 'package:xml/xml.dart';

import '../../base/_base.dart';
import '../../svg_model/_svg_model.dart';
import '../../xml_model/_xml_model.dart';
import '../_xml_conversion.dart';

extension ElementToSvgEllipse on XmlElement {
  /// Converts this [XmlElement] to an [SvgEllipse].
  Result<SvgEllipse> toSvgEllipse() {
    const XmlElementName elementName = XmlElementName.ellipse;

    final SvgLengthPercentage cx = toSvgValue<SvgLengthPercentage>(
      elementName,
      XmlAttributeName.cx,
    );
    final SvgLengthPercentage cy = toSvgValue<SvgLengthPercentage>(
      elementName,
      XmlAttributeName.cy,
    );
    final SvgLengthPercentageAuto rx = toSvgValue<SvgLengthPercentageAuto>(
      elementName,
      XmlAttributeName.rx,
    );
    final SvgLengthPercentageAuto ry = toSvgValue<SvgLengthPercentageAuto>(
      elementName,
      XmlAttributeName.ry,
    );

    final CommonAttributes common = getCommonAttributes(elementName);

    return Success<SvgEllipse>(
      SvgEllipse(
        cx: cx,
        cy: cy,
        rx: rx,
        ry: ry,
        fill: common.fill,
        fillOpacity: common.fillOpacity,
        stroke: common.stroke,
        strokeOpacity: common.strokeOpacity,
        strokeWidth: common.strokeWidth,
        strokeLinecap: common.strokeLinecap,
        strokeLinejoin: common.strokeLinejoin,
        opacity: common.opacity,
        cssClass: common.cssClass,
        inlineStyle: common.inlineStyle,
        transform: common.transform,
        pathLength: common.pathLength,
        strokeDasharray: common.strokeDasharray,
        id: common.id,
      ),
    );
  }
}
