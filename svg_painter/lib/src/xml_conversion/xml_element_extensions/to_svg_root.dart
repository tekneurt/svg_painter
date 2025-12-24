import 'package:xml/xml.dart';

import '../../base/_base.dart';
import '../../svg_model/_svg_model.dart';
import '../../xml_model/_xml_model.dart';
import '../_xml_conversion.dart';

extension ElementToSvgRoot on XmlElement {
  /// Converts this [XmlElement] to an [SvgRoot].
  Result<SvgRoot> toSvgRoot() {
    const XmlElementName elementName = XmlElementName.svg;
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

    final SvgLengthPercentageAuto width = toSvgValue<SvgLengthPercentageAuto>(
      elementName,
      XmlAttributeName.width,
    );
    final SvgLengthPercentageAuto height = toSvgValue<SvgLengthPercentageAuto>(
      elementName,
      XmlAttributeName.height,
    );
    final SvgLengthPercentage? x = toSvgValueOrNull<SvgLengthPercentage>(
      elementName,
      XmlAttributeName.x,
    );
    final SvgLengthPercentage? y = toSvgValueOrNull<SvgLengthPercentage>(
      elementName,
      XmlAttributeName.y,
    );
    final SvgViewBox? viewBox = getXmlAttributeValue(XmlAttributeName.viewBox)?.toSvgViewBox();

    final SvgColor? fill = toSvgValueOrNull<SvgColor>(elementName, XmlAttributeName.fill);
    final SvgColor? stroke = toSvgValueOrNull<SvgColor>(elementName, XmlAttributeName.stroke);
    final SvgLengthPercentage? strokeWidth = toSvgValueOrNull<SvgLengthPercentage>(
      elementName,
      XmlAttributeName.strokeWidth,
    );

    final String? id = getXmlAttributeValue(XmlAttributeName.id);
    final String? transform = getXmlAttributeValue(XmlAttributeName.transform);

    return Success<SvgRoot>(
      SvgRoot(
        children: childElements,
        x: x,
        y: y,
        width: width,
        height: height,
        viewBox: viewBox,
        fill: fill,
        stroke: stroke,
        strokeWidth: strokeWidth,
        transform: transform,
        id: id,
      ),
    );
  }
}
