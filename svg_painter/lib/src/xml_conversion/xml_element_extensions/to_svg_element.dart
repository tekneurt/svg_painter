import 'package:xml/xml.dart';

import '../../base/_base.dart';
import '../../svg_model/_svg_model.dart';
import '../../xml_model/_xml_model.dart';
import '../_xml_conversion.dart';

extension XmlElementToSvgElement on XmlElement {
  /// Converts this [XmlElement] to an [SvgElement].
  Result<SvgElement> toSvgElement() {
    final XmlElementName? elementName = XmlElementName.from(name.local);

    if (elementName == null) {
      return Failure<SvgElement>('Unsupported SVG element: <${name.local}>');
    }

    switch (elementName) {
      case XmlElementName.svg:
        return toSvgRoot();
      case XmlElementName.circle:
        return toSvgCircle();
      case XmlElementName.ellipse:
        return toSvgEllipse();
      case XmlElementName.rect:
        return toSvgRect();
    }
  }
}
