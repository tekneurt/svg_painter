import 'package:xml/xml.dart';

import '../../base/_base.dart';
import '../../svg_model/_svg_model.dart';
import '../../xml_model/_xml_model.dart';
import '../_xml_conversion.dart';
import 'get_common_attributes.dart';
import 'get_xml_attribute_value.dart';

extension ElementToSvgPath on XmlElement {
  /// Converts this [XmlElement] to an [SvgPath].
  Result<SvgPath> toSvgPath() {
    const XmlElementName elementName = XmlElementName.path;

    final String? d = getXmlAttributeValue(XmlAttributeName.d);
    if (d == null) {
      return Failure<SvgPath>('Path element must have a "d" attribute');
    }

    final CommonAttributes common = getCommonAttributes(elementName);

    return Success<SvgPath>(
      SvgPath(
        d: d,
        fill: common.fill,
        stroke: common.stroke,
        strokeWidth: common.strokeWidth,
        transform: common.transform,
        id: common.id,
      ),
    );
  }
}
