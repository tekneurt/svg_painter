import 'package:xml/xml.dart';

import '../../base/_base.dart';
import '../../svg_model/_svg_model.dart';
import '../../xml_model/_xml_model.dart';
import '../_xml_conversion.dart';
import '../parsers/svg_transform_parser.dart';

extension ToSvgLinearGradient on XmlElement {
  /// Converts this [XmlElement] to an [SvgLinearGradient].
  Result<SvgLinearGradient> toSvgLinearGradient() {
    const XmlElementName elementName = XmlElementName.linearGradient;

    final SvgLengthPercentage? x1 = toSvgValueOrNull<SvgLengthPercentage>(
      elementName,
      XmlAttributeName.x1,
    );
    final SvgLengthPercentage? y1 = toSvgValueOrNull<SvgLengthPercentage>(
      elementName,
      XmlAttributeName.y1,
    );
    final SvgLengthPercentage? x2 = toSvgValueOrNull<SvgLengthPercentage>(
      elementName,
      XmlAttributeName.x2,
    );
    final SvgLengthPercentage? y2 = toSvgValueOrNull<SvgLengthPercentage>(
      elementName,
      XmlAttributeName.y2,
    );

    final Result<List<SvgStop>> stopsResult = children
        .whereType<XmlElement>()
        .where((XmlElement child) => child.name.local == XmlElementName.stop.tagName)
        .map((XmlElement child) => child.toSvgStop())
        .combine();

    final String? gradientTransform = toXmlAttributeValue(XmlAttributeName.gradientTransform);
    final SvgGradientUnits? gradientUnits =
        toXmlAttributeValue(XmlAttributeName.gradientUnits)?.toSvgGradientUnits();
    final SvgSpreadMethod? spreadMethod =
        toXmlAttributeValue(XmlAttributeName.spreadMethod)?.toSvgSpreadMethod();
    final String? href = toXmlAttributeValue(XmlAttributeName.href);

    final CommonAttributes common = toCommonAttributes(elementName);
    final SvgColor? color =
        common.presentation.color ??
        toSvgValueOrNull<SvgColor>(elementName, XmlAttributeName.color);

    return stopsResult.map(
      (List<SvgStop> stops) => SvgLinearGradient(
        stops: stops,
        x1: x1,
        y1: y1,
        x2: x2,
        y2: y2,
        gradientTransformAttributes: SvgTransformParser.parse(gradientTransform),
        gradientUnits: gradientUnits,
        spreadMethod: spreadMethod,
        href: href,
        color: color,
        coreAttributes: common.core,
      ),
    );
  }
}
