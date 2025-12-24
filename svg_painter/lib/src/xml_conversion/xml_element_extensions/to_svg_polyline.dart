import 'package:xml/xml.dart';

import '../../base/_base.dart';
import '../../svg_model/_svg_model.dart';
import '../../xml_model/_xml_model.dart';
import '../_xml_conversion.dart';

extension ElementToSvgPolyline on XmlElement {
  /// Converts this [XmlElement] to an [SvgPolyline].
  Result<SvgPolyline> toSvgPolyline() {
    const XmlElementName elementName = XmlElementName.polyline;

    final SvgPointList points = toSvgValue<SvgPointList>(elementName, XmlAttributeName.points);

    final CommonAttributes common = getCommonAttributes(elementName);

    return Success<SvgPolyline>(
      SvgPolyline(
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
