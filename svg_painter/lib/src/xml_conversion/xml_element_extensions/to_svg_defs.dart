import 'package:xml/xml.dart';

import '../../base/_base.dart';
import '../../svg_model/_svg_model.dart';
import '../../xml_model/_xml_model.dart';
import '../_xml_conversion.dart';

extension ToSvgDefs on XmlElement {
  /// Converts this [XmlElement] to an [SvgDefs].
  Result<SvgDefs> toSvgDefs() {
    final Result<List<SvgElement>> childrenResult = children
        .whereType<XmlElement>()
        .map((XmlElement child) => child.toSvgElement())
        .combine();

    final String? id = toXmlAttributeValue(XmlAttributeName.id);

    return childrenResult.map(
      (List<SvgElement> childElements) => SvgDefs(children: childElements, id: id),
    );
  }
}
