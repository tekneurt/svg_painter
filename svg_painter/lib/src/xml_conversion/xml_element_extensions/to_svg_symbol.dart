import 'package:xml/xml.dart';

import '../../base/_base.dart';
import '../../svg_model/_svg_model.dart';
import '../../xml_model/_xml_model.dart';
import '../_xml_conversion.dart';

extension ToSvgSymbol on XmlElement {
  /// Converts this [XmlElement] to an [SvgSymbol].
  Result<SvgSymbol> toSvgSymbol() {
    const XmlElementName elementName = XmlElementName.symbol;
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
    final SvgViewBox? viewBox = toXmlAttributeValue(XmlAttributeName.viewBox)?.toSvgViewBox();
    final SvgPreserveAspectRatio? preserveAspectRatio =
        toXmlAttributeValue(XmlAttributeName.preserveAspectRatio)?.toSvgPreserveAspectRatio();

    final CommonAttributes common = toCommonAttributes(elementName);

    return childrenResult.map(
      (List<SvgElement> childElements) => SvgSymbol(
        children: childElements,
        x: x,
        y: y,
        width: width,
        height: height,
        viewportAttributes: SvgViewportAttributes(
          viewBox: viewBox,
          preserveAspectRatio: preserveAspectRatio,
        ),
        presentationAttributes: common.presentation,
        coreAttributes: common.core,
      ),
    );
  }
}
