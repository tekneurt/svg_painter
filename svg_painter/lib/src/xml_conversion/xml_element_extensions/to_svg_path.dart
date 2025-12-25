import 'package:xml/xml.dart';

import '../../base/_base.dart';
import '../../svg_model/_svg_model.dart';
import '../../xml_model/_xml_model.dart';
import '../_xml_conversion.dart';

extension ElementToSvgPath on XmlElement {
  /// Converts this [XmlElement] to an [SvgPath].
  Result<SvgPath> toSvgPath() {
    const XmlElementName elementName = XmlElementName.path;

    final String? d = getXmlAttributeValue(XmlAttributeName.d);
    if (d == null) {
      return const Failure<SvgPath>('Path element must have a "d" attribute');
    }

    final CommonAttributes common = getCommonAttributes(elementName);

    return Success<SvgPath>(
      SvgPath(
        d: d,
        fill: common.fill,
        stroke: common.stroke,
        strokeWidth: common.strokeWidth,
        strokeLinecap: common.strokeLinecap,
        strokeLinejoin: common.strokeLinejoin,
        opacity: common.opacity,
        transform: common.transform,
        id: common.id,
      ),
    );
  }
}
