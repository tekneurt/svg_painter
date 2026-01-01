import 'package:xml/xml.dart';

import '../../base/_base.dart';
import '../../svg_model/_svg_model.dart';
import '../../xml_model/_xml_model.dart';
import '../_xml_conversion.dart';

extension ElementToSvgLine on XmlElement {
  /// Converts this [XmlElement] to an [SvgLine].
  Result<SvgLine> toSvgLine() {
    const XmlElementName elementName = XmlElementName.line;

    final SvgLengthPercentage x1 = toSvgValue<SvgLengthPercentage>(
      elementName,
      XmlAttributeName.x1,
    );
    final SvgLengthPercentage y1 = toSvgValue<SvgLengthPercentage>(
      elementName,
      XmlAttributeName.y1,
    );
    final SvgLengthPercentage x2 = toSvgValue<SvgLengthPercentage>(
      elementName,
      XmlAttributeName.x2,
    );
    final SvgLengthPercentage y2 = toSvgValue<SvgLengthPercentage>(
      elementName,
      XmlAttributeName.y2,
    );

    final CommonAttributes common = getCommonAttributes(elementName);

    return Success<SvgLine>(
      SvgLine(
        x1: x1,
        y1: y1,
        x2: x2,
        y2: y2,
        fill: common.fill,
        stroke: common.stroke,
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
