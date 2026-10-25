import 'package:xml/xml.dart';

import '../../base/result.dart';
import '../../svg_model/_svg_model.dart';
import '../../xml_model/_xml_model.dart';
import '../_xml_conversion.dart';

/// Extension to convert [XmlElement] to [SvgFeFlood].
extension ToSvgFeFlood on XmlElement {
  /// Converts this [XmlElement] to an [SvgFeFlood].
  Result<SvgFeFlood> toSvgFeFlood() {
    const XmlElementName elementName = XmlElementName.feFlood;

    final SvgColor floodColor = toSvgValueOrNull<SvgColor>(
          elementName,
          XmlAttributeName.floodColor,
        ) ??
        const SvgNamedColor(SvgColorName.black);

    final SvgLengthPercentage? floodOpacityVal = toSvgValueOrNull<SvgLengthPercentage>(
      elementName,
      XmlAttributeName.floodOpacity,
    );
    final double floodOpacity = switch (floodOpacityVal) {
      final SvgLength l => l.value.clamp(0.0, 1.0),
      final SvgPercentage p => (p.value / 100.0).clamp(0.0, 1.0),
      _ => 1.0,
    };

    final SvgLengthPercentage? x = toSvgValueOrNull<SvgLengthPercentage>(elementName, XmlAttributeName.x);
    final SvgLengthPercentage? y = toSvgValueOrNull<SvgLengthPercentage>(elementName, XmlAttributeName.y);
    final SvgLengthPercentage? width = toSvgValueOrNull<SvgLengthPercentage>(elementName, XmlAttributeName.width);
    final SvgLengthPercentage? height = toSvgValueOrNull<SvgLengthPercentage>(elementName, XmlAttributeName.height);

    final String? inSource = getAttribute(XmlAttributeName.in_.name);
    final String? result = getAttribute(XmlAttributeName.result.name);
    final CommonAttributes common = toCommonAttributes(elementName);

    return Success<SvgFeFlood>(
      SvgFeFlood(
        floodColor: floodColor,
        floodOpacity: floodOpacity,
        x: x,
        y: y,
        width: width,
        height: height,
        inSource: inSource,
        result: result,
        coreAttributes: common.core,
      ),
    );
  }
}
