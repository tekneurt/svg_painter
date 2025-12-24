import 'package:xml/xml.dart';

import '../../base/_base.dart';
import '../../svg_model/_svg_model.dart';
import '../../xml_model/_xml_model.dart';
import '../_xml_conversion.dart';

extension ElementToSvgPolygon on XmlElement {
  /// Converts this [XmlElement] to an [SvgPolygon].
  Result<SvgPolygon> toSvgPolygon() {
    const XmlElementName elementName = XmlElementName.polygon;

    final SvgPointList points = toSvgValue<SvgPointList>(elementName, XmlAttributeName.points);

    final SvgColor? fill = toSvgValueOrNull<SvgColor>(elementName, XmlAttributeName.fill);
    final SvgColor? stroke = toSvgValueOrNull<SvgColor>(elementName, XmlAttributeName.stroke);
    final SvgLengthPercentage? strokeWidth = toSvgValueOrNull<SvgLengthPercentage>(
      elementName,
      XmlAttributeName.strokeWidth,
    );

    final String? id = getXmlAttributeValue(XmlAttributeName.id);
    final String? transform = getXmlAttributeValue(XmlAttributeName.transform);

    return Success<SvgPolygon>(
      SvgPolygon(
        points: points,
        fill: fill,
        stroke: stroke,
        strokeWidth: strokeWidth,
        transform: transform,
        id: id,
      ),
    );
  }
}
