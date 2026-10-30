import 'package:xml/xml.dart';

import '../../base/_base.dart';
import '../../svg_model/_svg_model.dart';
import '../../xml_model/_xml_model.dart';
import '../_xml_conversion.dart';
import '../parsers/svg_transform_parser.dart';

/// Extension on [XmlElement] to convert `<pattern>` to [SvgPattern].
extension ToSvgPattern on XmlElement {
  /// Converts this [XmlElement] to an [SvgPattern].
  Result<SvgPattern> toSvgPattern() {
    const XmlElementName elementName = XmlElementName.pattern;
    final Result<List<SvgElement>> childrenResult = children
        .whereType<XmlElement>()
        .map((XmlElement child) => child.toSvgElement())
        .combine();

    final SvgLengthPercentageAuto? width = toSvgValueOrNull<SvgLengthPercentageAuto>(
      elementName,
      XmlAttributeName.width,
    );
    final SvgLengthPercentageAuto? height = toSvgValueOrNull<SvgLengthPercentageAuto>(
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

    final SvgPatternUnits patternUnits =
        toXmlAttributeValue(XmlAttributeName.patternUnits)?.toSvgPatternUnits() ??
        SvgPatternUnits.objectBoundingBox;

    final SvgPatternUnits patternContentUnits =
        toXmlAttributeValue(XmlAttributeName.patternContentUnits)?.toSvgPatternUnits() ??
        SvgPatternUnits.userSpaceOnUse;

    final String? patternTransform = toXmlAttributeValue(XmlAttributeName.patternTransform);

    final String? href =
        toXmlAttributeValue(XmlAttributeName.href) ?? getAttribute('xlink:href');

    final SvgViewBox? viewBox = toXmlAttributeValue(XmlAttributeName.viewBox)?.toSvgViewBox();
    final SvgPreserveAspectRatio? preserveAspectRatio = toXmlAttributeValue(
      XmlAttributeName.preserveAspectRatio,
    )?.toSvgPreserveAspectRatio();

    final CommonAttributes common = toCommonAttributes(elementName);

    return childrenResult.map(
      (List<SvgElement> childElements) => SvgPattern(
        children: childElements,
        title: common.title,
        desc: common.desc,
        x: x,
        y: y,
        width: width,
        height: height,
        patternUnits: patternUnits,
        patternContentUnits: patternContentUnits,
        patternTransformAttributes: SvgTransformParser.parse(patternTransform),
        href: href,
        viewportAttributes: (viewBox != null || preserveAspectRatio != null)
            ? SvgViewportAttributes(
                viewBox: viewBox,
                preserveAspectRatio: preserveAspectRatio,
              )
            : null,
        presentationAttributes: common.presentation,
        coreAttributes: common.core,
      ),
    );
  }
}
