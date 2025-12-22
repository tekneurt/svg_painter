import 'package:xml/xml.dart';

import '../../base/_base.dart';
import '../../svg_model/_svg_model.dart';
import '../../xml_model/_xml_model.dart';
import '../_xml_conversion.dart';

extension ElementToSvgPolyline on XmlElement {
  /// Converts this [XmlElement] to an [SvgPolyline].
  Result<SvgPolyline> toSvgPolyline() {
    const XmlElementName elementName = XmlElementName.polyline;

    final SvgPointList points = toSvgValue<SvgPointList>(
      elementName,
      XmlAttributeName.points,
    );

    final SvgColor? fill = toSvgValueOrNull<SvgColor>(elementName, XmlAttributeName.fill);
    final SvgColor? stroke = toSvgValueOrNull<SvgColor>(elementName, XmlAttributeName.stroke);
    final SvgLengthPercentage? strokeWidth = toSvgValueOrNull<SvgLengthPercentage>(
      elementName,
      XmlAttributeName.strokeWidth,
    );

    final String? id = getXmlAttributeValue(XmlAttributeName.id);

    return Success<SvgPolyline>(
      SvgPolyline(
        points: points,
        fill: fill,
        stroke: stroke,
        strokeWidth: strokeWidth,
        id: id,
      ),
    );
  }
}
