import 'package:xml/xml.dart';

import '../../base/_base.dart';
import '../../svg_model/_svg_model.dart';
import '../../xml_model/_xml_model.dart';
import '../_xml_conversion.dart';
import '_xml_element_extensions.dart';

extension XmlElementToSvgElement on XmlElement {
  /// Converts this [XmlElement] to an [SvgElement].
  Result<SvgElement> toSvgElement() {
    final XmlElementName? elementName = XmlElementName.from(name.local);

    if (elementName == null) {
      return Failure<SvgElement>('Unsupported SVG element: <${name.local}>');
    }

    switch (elementName) {
      case .svg:
        return toSvgRoot();
      case .circle:
        return toSvgCircle();
      case .ellipse:
        return toSvgEllipse();
      case .rect:
        return toSvgRect();
      case .line:
        return toSvgLine();
      case .path:
        return toSvgPath();
      case .polyline:
        return toSvgPolyline();
      case .polygon:
        return toSvgPolygon();
      case .defs:
        return toSvgDefs();
      case .g:
        return toSvgGroup();
      case .use:
        return toSvgUse();
      case .radialGradient:
        return toSvgRadialGradient();
      case .linearGradient:
        return toSvgLinearGradient();
      case .stop:
        return toSvgStop();
      case .style:
        return toSvgStyle();
      case .text:
        return toSvgText();
      case .title:
        return Success<SvgTitle>(SvgTitle(
          content: innerText.trim(),
          id: getXmlAttributeValue(XmlAttributeName.id),
        ));
      case .desc:
        return Success<SvgDesc>(SvgDesc(
          content: innerText.trim(),
          id: getXmlAttributeValue(XmlAttributeName.id),
        ));
    }
  }
}
