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

    final SvgLengthPercentage cx = toSvgValue<SvgLengthPercentage>(
      elementName,
      XmlAttributeName.cx,
    );
    final SvgLengthPercentage cy = toSvgValue<SvgLengthPercentage>(
      elementName,
      XmlAttributeName.cy,
    );
    final SvgLengthPercentage r = toSvgValue<SvgLengthPercentage>(elementName, XmlAttributeName.r);

    final SvgLengthPercentage fr = toSvgValue<SvgLengthPercentage>(
      elementName,
      XmlAttributeName.fr,
    );

    // fx defaults to cx if not specified.
    final SvgLengthPercentage fx =
        toSvgValueOrNull<SvgLengthPercentage>(elementName, XmlAttributeName.fx) ?? cx;

    // fy defaults to cy if not specified.
    final SvgLengthPercentage fy =
        toSvgValueOrNull<SvgLengthPercentage>(elementName, XmlAttributeName.fy) ?? cy;

    final Result<List<SvgStop>> stopsResult = children
        .whereType<XmlElement>()
        .where((XmlElement child) => child.name.local == XmlElementName.stop.tagName)
        .map((XmlElement child) => child.toSvgStop())
        .combine();

    final String? gradientTransform = toXmlAttributeValue(XmlAttributeName.gradientTransform);
    final SvgGradientUnits gradientUnits = toXmlAttributeValue(XmlAttributeName.gradientUnits)
            ?.toSvgGradientUnits() ??
        XmlAttributeName.gradientUnits.toDefaultValue(elementName) as SvgGradientUnits;
    final SvgSpreadMethod spreadMethod = toXmlAttributeValue(XmlAttributeName.spreadMethod)
            ?.toSvgSpreadMethod() ??
        XmlAttributeName.spreadMethod.toDefaultValue(elementName) as SvgSpreadMethod;

    final CommonAttributes common = toCommonAttributes(elementName);

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
        coreAttributes: common.core,
      ),
    );
  }
}
