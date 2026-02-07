import 'package:xml/xml.dart';

import '../../base/_base.dart';
import '../../svg_model/_svg_model.dart';
import '../../xml_model/_xml_model.dart';
import '../_xml_conversion.dart';

extension ToSvgPolygon on XmlElement {
  /// Converts this [XmlElement] to an [SvgPolygon].
  Result<SvgPolygon> toSvgPolygon() {
    const XmlElementName elementName = XmlElementName.polygon;

    final SvgPointList points = toSvgValue<SvgPointList>(elementName, XmlAttributeName.points);
    final SvgNonNegativeNumber? pathLength = toSvgValueOrNull<SvgNonNegativeNumber>(
      elementName,
      XmlAttributeName.pathLength,
    );

    final CommonAttributes common = toCommonAttributes(elementName);

    return Success<SvgPolygon>(
      SvgPolygon(
        points: points,
        pathLength: pathLength,
        fillAttributes: common.fillAttributes,
        strokeAttributes: common.strokeAttributes,
        opacity: common.opacity,
        cssClass: common.cssClass,
        inlineStyle: common.inlineStyle,
        transformAttributes: common.transformAttributes,
        id: common.id,
      ),
    );
  }
}
