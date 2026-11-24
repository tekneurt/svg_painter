import 'package:xml/xml.dart';

import '../../base/_base.dart';
import '../../svg_model/_svg_model.dart';
import '../../xml_model/_xml_model.dart';
import '../_xml_conversion.dart';

extension ToSvgStop on XmlElement {
  /// Converts this [XmlElement] to an [SvgStop].
  Result<SvgStop> toSvgStop() {
    const XmlElementName elementName = XmlElementName.stop;

    final SvgLengthPercentage offset = toSvgValue<SvgLengthPercentage>(
      elementName,
      XmlAttributeName.offset,
    );
    final String? rawStopColor = _getStopProperty(this, XmlAttributeName.stopColor);
    final String? effectiveStopColor = (rawStopColor?.toLowerCase() == 'inherit')
        ? _resolveInheritedStopProperty(this, XmlAttributeName.stopColor)
        : rawStopColor;
    final SvgColor? stopColor = effectiveStopColor?.toSvgColor();

    final String? rawStopOpacity = _getStopProperty(this, XmlAttributeName.stopOpacity);
    final String? effectiveStopOpacity = (rawStopOpacity?.toLowerCase() == 'inherit')
        ? _resolveInheritedStopProperty(this, XmlAttributeName.stopOpacity)
        : rawStopOpacity;
    final SvgLengthPercentage? stopOpacity = effectiveStopOpacity?.toSvgLengthPercentage();

    final CommonAttributes common = toCommonAttributes(elementName);
    final String? rawColor = _getStopProperty(this, XmlAttributeName.color);
    final String? effectiveColor = (rawColor == null || rawColor.toLowerCase() == 'inherit')
        ? _resolveInheritedStopProperty(this, XmlAttributeName.color)
        : rawColor;
    final SvgColor? color =
        common.presentation.color ?? effectiveColor?.toSvgColor();

    return Success<SvgStop>(
      SvgStop(
        offset: offset,
        stopColor: stopColor,
        stopOpacity: stopOpacity,
        color: color,
        coreAttributes: common.core,
      ),
    );
  }
}

String? _getStopProperty(XmlElement element, XmlAttributeName attr) {
  final String? attrVal = element.toXmlAttributeValue(attr);
  if (attrVal != null) {
    return attrVal.trim();
  }
  final String? style = element.toXmlAttributeValue(XmlAttributeName.style);
  if (style != null) {
    for (final String decl in style.split(';')) {
      final int colonIndex = decl.indexOf(':');
      if (colonIndex != -1) {
        final String property = decl.substring(0, colonIndex).trim();
        final String value = decl.substring(colonIndex + 1).trim();
        if (property == attr.name) {
          return value;
        }
      }
    }
  }
  return null;
}

String? _resolveInheritedStopProperty(XmlElement element, XmlAttributeName attr) {
  XmlElement? current = element.parentElement;
  while (current != null) {
    final String? val = _getStopProperty(current, attr);
    if (val != null && val.toLowerCase() != 'inherit') {
      return val;
    }
    current = current.parentElement;
  }
  return null;
}
