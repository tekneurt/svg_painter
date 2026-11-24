import 'package:xml/xml.dart';

import '../../base/_base.dart';
import '../../svg_model/_svg_model.dart';
import '../../xml_model/_xml_model.dart';
import '../_xml_conversion.dart';
import '../parsers/svg_transform_parser.dart';

extension ToSvgRadialGradient on XmlElement {
  /// Converts this [XmlElement] to an [SvgRadialGradient].
  Result<SvgRadialGradient> toSvgRadialGradient() {
    const XmlElementName elementName = XmlElementName.radialGradient;

    final SvgLengthPercentage? cx = toSvgValueOrNull<SvgLengthPercentage>(
      elementName,
      XmlAttributeName.cx,
    );
    final SvgLengthPercentage? cy = toSvgValueOrNull<SvgLengthPercentage>(
      elementName,
      XmlAttributeName.cy,
    );
    final SvgLengthPercentage? r =
        toSvgValueOrNull<SvgLengthPercentage>(elementName, XmlAttributeName.r);

    final SvgLengthPercentage? fr = toSvgValueOrNull<SvgLengthPercentage>(
      elementName,
      XmlAttributeName.fr,
    );
    final SvgLengthPercentage? fx =
        toSvgValueOrNull<SvgLengthPercentage>(elementName, XmlAttributeName.fx);
    final SvgLengthPercentage? fy =
        toSvgValueOrNull<SvgLengthPercentage>(elementName, XmlAttributeName.fy);

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
    final SvgColorInterpolation? colorInterpolation =
        common.presentation.colorInterpolation ??
        toSvgValueOrNull<SvgColorInterpolation>(elementName, XmlAttributeName.colorInterpolation);

    return stopsResult.map(
      (List<SvgStop> stops) => SvgRadialGradient(
        stops: stops,
        cx: cx,
        cy: cy,
        r: r,
        fx: fx,
        fy: fy,
        fr: fr,
        gradientTransformAttributes: SvgTransformParser.parse(gradientTransform),
        gradientUnits: gradientUnits,
        spreadMethod: spreadMethod,
        href: href,
        color: color,
        colorInterpolation: colorInterpolation,
        coreAttributes: common.core,
      ),
    );
  }
}
