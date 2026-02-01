import 'package:xml/xml.dart';

import '../../base/_base.dart';
import '../../svg_model/_svg_model.dart';
import '../../xml_model/_xml_model.dart';
import '../_xml_conversion.dart';

extension ToSvgGroup on XmlElement {
  /// Converts this [XmlElement] to an [SvgGroup].
  Result<SvgGroup> toSvgGroup() {
    const XmlElementName elementName = XmlElementName.g;

    final Result<List<SvgElement>> childrenResult = children
        .whereType<XmlElement>()
        .map((XmlElement child) => child.toSvgElement())
        .combine();

    final CommonAttributes common = toCommonAttributes(elementName);

    return childrenResult.map(
      (List<SvgElement> childElements) => SvgGroup(
        children: childElements,
        fillAttributes: common.fillAttributes,
        strokeAttributes: common.strokeAttributes,
        fontAttributes: common.fontAttributes,
        opacity: common.opacity,
        cssClass: common.cssClass,
        inlineStyle: common.inlineStyle,
        transform: common.transform,
        id: common.id,
      ),
    );
  }
}
