import 'package:xml/xml.dart';

import '../../base/_base.dart';
import '../../svg_model/_svg_model.dart';
import '../../xml_model/_xml_model.dart';
import '../_xml_conversion.dart';

extension ToSvgImage on XmlElement {
  /// Converts this [XmlElement] to an [SvgImage].
  Result<SvgImage> toSvgImage() {
    const XmlElementName elementName = XmlElementName.image;

    final String href = toXmlAttributeValue(XmlAttributeName.href) ?? '';

    final SvgLengthPercentageAuto? x = toSvgValueOrNull<SvgLengthPercentageAuto>(
      elementName,
      XmlAttributeName.x,
    );
    final SvgLengthPercentageAuto? y = toSvgValueOrNull<SvgLengthPercentageAuto>(
      elementName,
      XmlAttributeName.y,
    );
    final SvgLengthPercentageAuto? width = toSvgValueOrNull<SvgLengthPercentageAuto>(
      elementName,
      XmlAttributeName.width,
    );
    final SvgLengthPercentageAuto? height = toSvgValueOrNull<SvgLengthPercentageAuto>(
      elementName,
      XmlAttributeName.height,
    );

    final SvgViewBox? viewBox = toXmlAttributeValue(XmlAttributeName.viewBox)?.toSvgViewBox();
    final SvgPreserveAspectRatio? preserveAspectRatio =
        toXmlAttributeValue(XmlAttributeName.preserveAspectRatio)?.toSvgPreserveAspectRatio();

    final SvgImageDecoding decoding =
        toXmlAttributeValue(XmlAttributeName.decoding)?.toSvgImageDecoding() ?? SvgImageDecoding.auto;

    final CommonAttributes common = toCommonAttributes(elementName);

    return Success<SvgImage>(
      SvgImage(
        href: href,
        x: x,
        y: y,
        width: width,
        height: height,
        viewportAttributes: SvgViewportAttributes(
          viewBox: viewBox,
          preserveAspectRatio: preserveAspectRatio,
        ),
        decoding: decoding,
        presentationAttributes: common.presentation,
        coreAttributes: common.core,
      ),
    );
  }
}
