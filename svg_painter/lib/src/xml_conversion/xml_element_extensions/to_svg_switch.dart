import 'package:xml/xml.dart';

import '../../base/_base.dart';
import '../../svg_model/_svg_model.dart';
import '../../xml_model/_xml_model.dart';
import '../_xml_conversion.dart';

extension ToSvgSwitch on XmlElement {
  /// Converts this [XmlElement] to an [SvgSwitch].
  Result<SvgSwitch> toSvgSwitch() {
    const XmlElementName elementName = XmlElementName.switch_;

    final Result<List<SvgElement>> childrenResult = children
        .whereType<XmlElement>()
        .map((XmlElement child) => child.toSvgElement())
        .combine();

    final CommonAttributes common = toCommonAttributes(elementName);

    return childrenResult.map(
      (List<SvgElement> childElements) => SvgSwitch(
        children: childElements,
        title: common.title,
        desc: common.desc,
        coreAttributes: common.core,
        presentationAttributes: common.presentation,
      ),
    );
  }
}
