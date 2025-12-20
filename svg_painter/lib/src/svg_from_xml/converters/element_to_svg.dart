import 'package:xml/xml.dart';

import '../../svg_model/svg_element.dart';
import '../../svg_model/svg_value.dart';
import '../../util/result.dart';
import '../../xml_layer/xml_attribute_name.dart';
import '../../xml_layer/xml_element_extensions.dart';
import '../../xml_layer/xml_element_name.dart';
import 'string_to_length.dart';

/// Extension to convert [XmlElement] to [SvgElement].
extension ElementToSvg on XmlElement {
  /// Converts this [XmlElement] to an [SvgElement].
  Result<SvgElement> toSvgElement() {
    final XmlElementName? elementName = XmlElementName.from(name.local);

    if (elementName == null) {
      return Failure<SvgElement>(
        'Unsupported SVG element: <${name.local}>',
      );
    }

    switch (elementName) {
      case XmlElementName.svg:
        return toSvgRoot();
      case XmlElementName.circle:
        return toSvgCircle();
    }
  }

  /// Converts this [XmlElement] to an [SvgRoot].
  Result<SvgRoot> toSvgRoot() {
    final List<SvgElement> childElements = <SvgElement>[];

    for (final XmlNode child in children) {
      if (child is XmlElement) {
        final Result<SvgElement> result = child.toSvgElement();
        result.fold(
          (Failure<SvgElement> failure) {
            // Ignore unsupported children
          },
          (SvgElement value) {
            childElements.add(value);
          },
        );
      }
    }

    return Success<SvgRoot>(SvgRoot(children: childElements));
  }

  /// Converts this [XmlElement] to an [SvgCircle].
  Result<SvgCircle> toSvgCircle() {
    final String? cxStr = getAttributeValue(XmlAttributeName.cx);
    final String? cyStr = getAttributeValue(XmlAttributeName.cy);
    final String? rStr = getAttributeValue(XmlAttributeName.r);

    final SvgLengthPercentage cx =
        cxStr?.toSvgLengthPercentage() ?? const SvgLength(0.0);
    final SvgLengthPercentage cy =
        cyStr?.toSvgLengthPercentage() ?? const SvgLength(0.0);
    final SvgLengthPercentage r =
        rStr?.toSvgLengthPercentage() ?? const SvgLength(0.0);

    return Success<SvgCircle>(
      SvgCircle(
        cx: cx,
        cy: cy,
        r: r,
      ),
    );
  }
}
