import 'package:xml/xml.dart';

import '../../base/_base.dart';
import '../../svg_model/_svg_model.dart';
import '../../xml_model/_xml_model.dart';
import '../_xml_conversion.dart';

extension ElementToSvgUse on XmlElement {
  /// Converts this [XmlElement] to an [SvgUse].
  Result<SvgUse> toSvgUse() {
    const XmlElementName elementName = XmlElementName.use;

    final String? href = getXmlAttributeValue(XmlAttributeName.href);
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

    final SvgColor? fill = toSvgValueOrNull<SvgColor>(elementName, XmlAttributeName.fill);
    final SvgColor? stroke = toSvgValueOrNull<SvgColor>(elementName, XmlAttributeName.stroke);
    final SvgLengthPercentage? strokeWidth = toSvgValueOrNull<SvgLengthPercentage>(
      elementName,
      XmlAttributeName.strokeWidth,
    );

    final String? id = getXmlAttributeValue(XmlAttributeName.id);
    final String? transform = getXmlAttributeValue(XmlAttributeName.transform);

    return Success<SvgUse>(
      SvgUse(
        href: href,
        x: x,
        y: y,
        width: width,
        height: height,
        fill: fill,
        stroke: stroke,
        strokeWidth: strokeWidth,
        transform: transform,
        id: id,
      ),
    );
  }
}
