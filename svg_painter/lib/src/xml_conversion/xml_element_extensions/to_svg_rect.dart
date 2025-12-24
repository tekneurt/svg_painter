import 'package:xml/xml.dart';

import '../../base/_base.dart';
import '../../svg_model/_svg_model.dart';
import '../../xml_model/_xml_model.dart';
import '../_xml_conversion.dart';

extension ElementToSvgRect on XmlElement {
  /// Converts this [XmlElement] to an [SvgRect].
  Result<SvgRect> toSvgRect() {
    const XmlElementName elementName = XmlElementName.rect;

    final SvgLengthPercentage x = toSvgValue<SvgLengthPercentage>(elementName, XmlAttributeName.x);
    final SvgLengthPercentage y = toSvgValue<SvgLengthPercentage>(elementName, XmlAttributeName.y);
    final SvgLengthPercentageAuto width = toSvgValue<SvgLengthPercentageAuto>(
      elementName,
      XmlAttributeName.width,
    );
    final SvgLengthPercentageAuto height = toSvgValue<SvgLengthPercentageAuto>(
      elementName,
      XmlAttributeName.height,
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

    return Success<SvgRect>(
      SvgRect(
        x: x,
        y: y,
        width: width,
        height: height,
        rx: rx,
        ry: ry,
        fill: common.fill,
        stroke: common.stroke,
        strokeWidth: common.strokeWidth,
        transform: common.transform,
        id: common.id,
      ),
    );
  }
}
