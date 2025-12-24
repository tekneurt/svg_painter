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

    final CommonAttributes common = getCommonAttributes(elementName);

    return Success<SvgPolygon>(
      SvgPolygon(
        points: points,
        fill: common.fill,
        stroke: common.stroke,
        strokeWidth: common.strokeWidth,
        transform: common.transform,
        id: common.id,
      ),
    );
  }
}
