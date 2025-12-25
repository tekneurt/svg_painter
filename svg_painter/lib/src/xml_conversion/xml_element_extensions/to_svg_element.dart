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
      case XmlElementName.line:
        return toSvgLine();
      case XmlElementName.path:
        return toSvgPath();
      case XmlElementName.polyline:
        return toSvgPolyline();
      case XmlElementName.polygon:
        return toSvgPolygon();
      case XmlElementName.defs:
        return toSvgDefs();
      case XmlElementName.g:
        return toSvgGroup();
      case XmlElementName.use:
        return toSvgUse();
      case XmlElementName.radialGradient:
        return toSvgRadialGradient();
      case XmlElementName.linearGradient:
        return toSvgLinearGradient();
      case XmlElementName.stop:
        return toSvgStop();
    }
  }
}
