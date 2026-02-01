import 'package:xml/xml.dart';

import '../../base/_base.dart';
import '../../svg_model/_svg_model.dart';
import '../../xml_model/_xml_model.dart';
import '../_xml_conversion.dart';

extension ToSvgRect on XmlElement {
  /// Converts this [XmlElement] to an [SvgRect].
  Result<SvgRect> toSvgRect() {
    const XmlElementName elementName = XmlElementName.rect;

    final SvgLengthPercentage x = toSvgValue<SvgLengthPercentage>(elementName, XmlAttributeName.x);
    final SvgLengthPercentage y = toSvgValue<SvgLengthPercentage>(elementName, XmlAttributeName.y);
    final SvgLengthPercentageAuto width = toSvgValue<SvgLengthPercentageAuto>(
      elementName,
      XmlAttributeName.width,
    );
    final SvgLengthPercentageAuto height = toSvgValue<SvgLengthPercentageAuto>(
      elementName,
      XmlAttributeName.height,
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

    return Success<SvgRect>(
      SvgRect(
        x: x,
        y: y,
        width: width,
        height: height,
        rx: rx,
        ry: ry,
        pathLength: pathLength,
        fill: common.fill,
        stroke: common.stroke,
        opacity: common.opacity,
        cssClass: common.cssClass,
        inlineStyle: common.inlineStyle,
        transform: common.transform,
        id: common.id,
      ),
    );
  }
}
