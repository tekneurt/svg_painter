import 'package:xml/xml.dart';

import '../../base/_base.dart';
import '../../svg_model/_svg_model.dart';
import '../../xml_model/_xml_model.dart';
import '../_xml_conversion.dart';

extension ElementToSvgEllipse on XmlElement {
  /// Converts this [XmlElement] to an [SvgEllipse].
  Result<SvgEllipse> toSvgEllipse() {
    const XmlElementName elementName = XmlElementName.ellipse;

    final SvgLengthPercentage cx = toSvgValue<SvgLengthPercentage>(
      elementName,
      XmlAttributeName.cx,
    );
    final SvgLengthPercentage cy = toSvgValue<SvgLengthPercentage>(
      elementName,
      XmlAttributeName.cy,
    );
    final SvgLengthPercentageAuto rx = toSvgValue<SvgLengthPercentageAuto>(
      elementName,
      XmlAttributeName.rx,
    );
    final SvgLengthPercentageAuto ry = toSvgValue<SvgLengthPercentageAuto>(
      elementName,
      XmlAttributeName.ry,
    );

    final SvgColor? fill = toSvgValueOrNull<SvgColor>(elementName, XmlAttributeName.fill);
    final SvgColor? stroke = toSvgValueOrNull<SvgColor>(elementName, XmlAttributeName.stroke);
    final SvgLengthPercentage? strokeWidth = toSvgValueOrNull<SvgLengthPercentage>(
      elementName,
      XmlAttributeName.strokeWidth,
    );

    return Success<SvgEllipse>(
      SvgEllipse(
        cx: cx,
        cy: cy,
        rx: rx,
        ry: ry,
        fill: fill,
        stroke: stroke,
        strokeWidth: strokeWidth,
      ),
    );
  }
}
