import 'package:xml/xml.dart';

import '../../base/_base.dart';
import '../../svg_model/_svg_model.dart';
import '../../xml_model/_xml_model.dart';
import '../_xml_conversion.dart';

extension ElementToSvgGroup on XmlElement {
  /// Converts this [XmlElement] to an [SvgGroup].
  Result<SvgGroup> toSvgGroup() {
    const XmlElementName elementName = XmlElementName.g;
    final List<SvgElement> childElements = <SvgElement>[];

    for (final XmlNode child in children) {
      if (child is XmlElement) {
        final Result<SvgElement> result = child.toSvgElement();
        result.fold(
          (Failure<SvgElement> failure) {
            // Ignore unsupported children
          },
          (SvgElement value) {
            childElements.add(value);
          },
        );
      }
    }

    final CommonAttributes common = getCommonAttributes(elementName);

    return Success<SvgGroup>(
      SvgGroup(
        children: childElements,
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
