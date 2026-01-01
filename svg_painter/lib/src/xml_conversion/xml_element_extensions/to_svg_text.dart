import 'package:xml/xml.dart';

import '../../base/_base.dart';
import '../../svg_model/_svg_model.dart';
import '../../xml_model/_xml_model.dart';
import '../_xml_conversion.dart';

extension TextElementToSvg on XmlElement {
  /// Converts this [XmlElement] to an [SvgText].
  Result<SvgText> toSvgText() {
    const XmlElementName elementName = XmlElementName.text;

    final SvgLengthPercentage x = toSvgValue<SvgLengthPercentage>(elementName, XmlAttributeName.x);
    final SvgLengthPercentage y = toSvgValue<SvgLengthPercentage>(elementName, XmlAttributeName.y);

    final CommonAttributes common = getCommonAttributes(elementName);

    // Extract text content. This handles nested text nodes.
    // We trim to handle basic whitespace normalization (e.g. indentation in XML).
    final String textContent = innerText.trim();

    return Success<SvgText>(
      SvgText(
        x: x,
        y: y,
        text: textContent,
        fill: common.fill,
        stroke: common.stroke,
        strokeWidth: common.strokeWidth,
        strokeLinecap: common.strokeLinecap,
        strokeLinejoin: common.strokeLinejoin,
        opacity: common.opacity,
        fontSize: common.fontSize,
        fontWeight: common.fontWeight,
        fontStyle: common.fontStyle,
        fontFamily: common.fontFamily,
        cssClass: common.cssClass,
        inlineStyle: common.inlineStyle,
        transform: common.transform,
        pathLength: common.pathLength,
        strokeDasharray: common.strokeDasharray,
        id: common.id,
      ),
    );
  }
}
