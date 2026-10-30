import 'package:xml/xml.dart';

import '../../base/_base.dart';
import '../../svg_model/_svg_model.dart';
import '../../xml_model/_xml_model.dart';
import '../_xml_conversion.dart';

extension ToSvgA on XmlElement {
  /// Converts this [XmlElement] to an [SvgA].
  Result<SvgA> toSvgA() {
    const XmlElementName elementName = .a;

    final Result<List<SvgElement>> childrenResult = children
        .whereType<XmlElement>()
        .map((XmlElement child) => child.toSvgElement())
        .combine();

    final CommonAttributes common = toCommonAttributes(elementName);
    final String? href = toXmlAttributeValue(XmlAttributeName.href);

    return childrenResult.map(
      (List<SvgElement> childElements) => SvgA(
        children: childElements,
        href: href,
        title: common.title,
        desc: common.desc,
        coreAttributes: common.core,
        presentationAttributes: common.presentation,
      ),
    );
  }
}
