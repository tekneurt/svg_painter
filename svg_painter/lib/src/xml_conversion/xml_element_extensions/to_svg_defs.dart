import 'package:xml/xml.dart';

import '../../base/_base.dart';
import '../../svg_model/_svg_model.dart';
import '../../xml_model/_xml_model.dart';
import '../_xml_conversion.dart';

extension ElementToSvgDefs on XmlElement {
  /// Converts this [XmlElement] to an [SvgDefs].
  Result<SvgDefs> toSvgDefs() {
    final List<SvgElement> childElements = <SvgElement>[];

    for (final XmlNode child in children) {
      if (child is XmlElement) {
        final Result<SvgElement> result = child.toSvgElement();
        result.fold(
          (Failure<SvgElement> failure) {
            // Ignore unsupported children in defs
          },
          (SvgElement value) {
            childElements.add(value);
          },
        );
      }
    }

    final String? id = getXmlAttributeValue(XmlAttributeName.id);

    return Success<SvgDefs>(SvgDefs(children: childElements, id: id));
  }
}
