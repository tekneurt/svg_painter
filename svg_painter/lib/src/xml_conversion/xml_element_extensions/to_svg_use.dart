import 'package:xml/xml.dart';

import '../../base/_base.dart';
import '../../svg_model/_svg_model.dart';
import '../../xml_model/_xml_model.dart';
import '../_xml_conversion.dart';

extension ToSvgUse on XmlElement {
  /// Converts this [XmlElement] to an [SvgUse].
  Result<SvgUse> toSvgUse() {
    const XmlElementName elementName = XmlElementName.use;

    final String? href = toXmlAttributeValue(XmlAttributeName.href);
    if (href == null) {
      return const Failure<SvgUse>('use element must have an href attribute.');
    }

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

    final CommonAttributes common = toCommonAttributes(elementName);

    return Success<SvgUse>(
      SvgUse(
        x: x,
        y: y,
        width: width,
        height: height,
        href: href,
        fill: common.fill,
        stroke: common.stroke,
        font: common.font,
        opacity: common.opacity,
        cssClass: common.cssClass,
        inlineStyle: common.inlineStyle,
        transform: common.transform,
        id: common.id,
      ),
    );
  }
}
