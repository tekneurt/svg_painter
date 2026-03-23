import 'package:xml/xml.dart';

import '../../base/_base.dart';
import '../../svg_model/_svg_model.dart';
import '../../xml_model/_xml_model.dart';
import '../_xml_conversion.dart';
import '_xml_element_extensions.dart';

extension ToSvgStyle on XmlElement {
  /// Converts this [XmlElement] to an [SvgStyle].
  Result<SvgStyle> toSvgStyle() {
    final CommonAttributes common = toCommonAttributes(XmlElementName.style);

    return Success<SvgStyle>(
      SvgStyle(
        content: innerText,
        type: toXmlAttributeValue(XmlAttributeName.type),
        media: toXmlAttributeValue(XmlAttributeName.media),
        title: toXmlAttributeValue(XmlAttributeName.title),
        coreAttributes: common.core,
      ),
    );
  }
}
