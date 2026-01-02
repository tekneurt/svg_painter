import 'package:xml/xml.dart';

import '../../base/_base.dart';
import '../../svg_model/_svg_model.dart';
import '../../xml_model/_xml_model.dart';
import '../_xml_conversion.dart';

extension ToSvgLinearGradient on XmlElement {
  /// Converts this [XmlElement] to an [SvgLinearGradient].
  Result<SvgLinearGradient> toSvgLinearGradient() {
    const XmlElementName elementName = XmlElementName.linearGradient;

    final SvgLengthPercentage x1 = toSvgValue<SvgLengthPercentage>(
      elementName,
      XmlAttributeName.x1,
    );
    final SvgLengthPercentage y1 = toSvgValue<SvgLengthPercentage>(
      elementName,
      XmlAttributeName.y1,
    );
    final SvgLengthPercentage x2 = toSvgValue<SvgLengthPercentage>(
      elementName,
      XmlAttributeName.x2,
    );
    final SvgLengthPercentage y2 = toSvgValue<SvgLengthPercentage>(
      elementName,
      XmlAttributeName.y2,
    );

    final Result<List<SvgStop>> stopsResult = children
        .whereType<XmlElement>()
        .where((XmlElement child) => child.name.local == XmlElementName.stop.tagName)
        .map((XmlElement child) => child.toSvgStop())
        .combine();

    final String? id = toXmlAttributeValue(XmlAttributeName.id);
    final String? gradientTransform = toXmlAttributeValue(XmlAttributeName.gradientTransform);

    return stopsResult.map(
      (List<SvgStop> stops) => SvgLinearGradient(
        stops: stops,
        x1: x1,
        y1: y1,
        x2: x2,
        y2: y2,
        gradientTransform: gradientTransform,
        id: id,
      ),
    );
  }
}
