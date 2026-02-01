import 'package:xml/xml.dart';

import '../../base/_base.dart';
import '../../svg_model/_svg_model.dart';
import '../../xml_model/_xml_model.dart';
import '../_xml_conversion.dart';

extension ToSvgEllipse on XmlElement {
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
    final SvgNonNegativeNumber? pathLength = toSvgValueOrNull<SvgNonNegativeNumber>(
      elementName,
      XmlAttributeName.pathLength,
    );

    final CommonAttributes common = toCommonAttributes(elementName);

    return Success<SvgEllipse>(
      SvgEllipse(
        cx: cx,
        cy: cy,
        rx: rx,
        ry: ry,
        pathLength: pathLength,
        fillAttributes: common.fillAttributes,
        strokeAttributes: common.strokeAttributes,
        opacity: common.opacity,
        cssClass: common.cssClass,
        inlineStyle: common.inlineStyle,
        transform: common.transform,
        id: common.id,
      ),
    );
  }
}
