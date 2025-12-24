import 'package:xml/xml.dart';

import '../../base/_base.dart';
import '../../svg_model/_svg_model.dart';
import '../../xml_model/_xml_model.dart';
import '../_xml_conversion.dart';

extension ElementToSvgStop on XmlElement {
  /// Converts this [XmlElement] to an [SvgStop].
  Result<SvgStop> toSvgStop() {
    const XmlElementName elementName = XmlElementName.stop;

    final SvgLengthPercentage offset = toSvgValue<SvgLengthPercentage>(
      elementName,
      XmlAttributeName.offset,
    );
    final SvgColor? stopColor = toSvgValueOrNull<SvgColor>(elementName, XmlAttributeName.stopColor);
    final SvgLengthPercentage stopOpacity = toSvgValue<SvgLengthPercentage>(
      elementName,
      XmlAttributeName.stopOpacity,
    );

    final String? id = getXmlAttributeValue(XmlAttributeName.id);

    return Success<SvgStop>(
      SvgStop(offset: offset, stopColor: stopColor, stopOpacity: stopOpacity, id: id),
    );
  }
}
