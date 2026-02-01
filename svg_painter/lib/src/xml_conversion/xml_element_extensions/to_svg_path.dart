import 'package:xml/xml.dart';

import '../../base/_base.dart';
import '../../svg_model/_svg_model.dart';
import '../../xml_model/_xml_model.dart';
import '../_xml_conversion.dart';

extension ToSvgPath on XmlElement {
  /// Converts this [XmlElement] to an [SvgPath].
  Result<SvgPath> toSvgPath() {
    const XmlElementName elementName = XmlElementName.path;

    final String? d = toXmlAttributeValue(XmlAttributeName.d);
    if (d == null) {
      return const Failure<SvgPath>('Path element must have a "d" attribute');
    }
    final SvgNonNegativeNumber? pathLength = toSvgValueOrNull<SvgNonNegativeNumber>(
      elementName,
      XmlAttributeName.pathLength,
    );

    final CommonAttributes common = toCommonAttributes(elementName);

    return Success<SvgPath>(
      SvgPath(
        d: d,
        pathLength: pathLength,
        fill: common.fill,
        fillOpacity: common.fillOpacity,
        stroke: common.stroke,
        opacity: common.opacity,
        cssClass: common.cssClass,
        inlineStyle: common.inlineStyle,
        transform: common.transform,
        id: common.id,
      ),
    );
  }
}
