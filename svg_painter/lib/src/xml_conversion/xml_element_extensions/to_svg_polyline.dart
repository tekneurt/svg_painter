import 'package:xml/xml.dart';

import '../../base/_base.dart';
import '../../svg_model/_svg_model.dart';
import '../../xml_model/_xml_model.dart';
import '../_xml_conversion.dart';

extension ToSvgPolyline on XmlElement {
  /// Converts this [XmlElement] to an [SvgPolyline].
  Result<SvgPolyline> toSvgPolyline() {
    const XmlElementName elementName = XmlElementName.polyline;

    final SvgPointList points = toSvgValue<SvgPointList>(elementName, XmlAttributeName.points);

    final CommonAttributes common = toCommonAttributes(elementName);

    return Success<SvgPolyline>(
      SvgPolyline(
        points: points,
        fill: common.fill,
        fillOpacity: common.fillOpacity,
        stroke: common.stroke,
        opacity: common.opacity,
        cssClass: common.cssClass,
        inlineStyle: common.inlineStyle,
        transform: common.transform,
        pathLength: common.pathLength,
        id: common.id,
      ),
    );
  }
}
