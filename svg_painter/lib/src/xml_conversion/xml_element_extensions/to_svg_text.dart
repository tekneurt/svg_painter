import 'package:xml/xml.dart';

import '../../base/_base.dart';
import '../../svg_model/_svg_model.dart';
import '../../xml_model/_xml_model.dart';
import '../_xml_conversion.dart';

extension ToSvgText on XmlElement {
  /// Converts this [XmlElement] to an [SvgText].
  Result<SvgText> toSvgText() {
    const XmlElementName elementName = XmlElementName.text;

    final SvgLengthPercentage x = toSvgValue<SvgLengthPercentage>(elementName, XmlAttributeName.x);
    final SvgLengthPercentage y = toSvgValue<SvgLengthPercentage>(elementName, XmlAttributeName.y);

    final CommonAttributes common = toCommonAttributes(elementName);

    // Extract text content. This handles nested text nodes.
    // We trim to handle basic whitespace normalization (e.g. indentation in XML).
    final String textContent = innerText.trim();

    return Success<SvgText>(
      SvgText(
        x: x,
        y: y,
        text: textContent,
        fillAttributes: common.fillAttributes,
        strokeAttributes: common.strokeAttributes,
        fontAttributes: common.fontAttributes,
        opacity: common.opacity,
        cssClass: common.cssClass,
        inlineStyle: common.inlineStyle,
        transformAttributes: common.transformAttributes,
        id: common.id,
      ),
    );
  }
}
