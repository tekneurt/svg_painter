import 'package:xml/xml.dart';

import '../../svg_model/_svg_model.dart';
import '../../xml_model/_xml_model.dart';
import '../_xml_conversion.dart';

/// Extension to convert [XmlElement] to [SvgValue].
extension XmlElementToSvgValue on XmlElement {
  /// Converts an XML attribute to an [SvgBaseValue], falling back to the default value.
  T toSvgValue<T extends SvgBaseValue>(XmlElementName elementName, XmlAttributeName attributeName) {
    final T? value = toSvgValueOrNull<T>(elementName, attributeName);
    if (value != null) {
      return value;
    }

    final SvgBaseValue defaultValue = attributeName.getDefaultValue(elementName);
    if (defaultValue is T) {
      return defaultValue;
    }

    throw UnsupportedError(
      'Default value for ($elementName, $attributeName) is ${defaultValue.runtimeType}, expected $T',
    );
  }

  /// Converts an XML attribute to an [SvgBaseValue], or returns null if not present.
  T? toSvgValueOrNull<T extends SvgBaseValue>(
    XmlElementName elementName,
    XmlAttributeName attributeName,
  ) {
    final String? attributeValue = getXmlAttributeValue(attributeName);
    if (attributeValue == null) {
      return null;
    }

    final SvgBaseValue? parsedValue = switch (attributeName) {
      XmlAttributeName.x ||
      XmlAttributeName.y ||
      XmlAttributeName.x1 ||
      XmlAttributeName.y1 ||
      XmlAttributeName.x2 ||
      XmlAttributeName.y2 ||
      XmlAttributeName.cx ||
      XmlAttributeName.cy ||
      XmlAttributeName.r ||
      XmlAttributeName.fx ||
      XmlAttributeName.fy ||
      XmlAttributeName.fr ||
      XmlAttributeName.offset ||
      XmlAttributeName.stopOpacity ||
      XmlAttributeName.strokeWidth => attributeValue.toSvgLengthPercentage(),
      XmlAttributeName.rx ||
      XmlAttributeName.ry ||
      XmlAttributeName.width ||
      XmlAttributeName.height => attributeValue.toSvgLengthPercentageAuto(),
      XmlAttributeName.points => attributeValue.toSvgPointList(),
      XmlAttributeName.fill ||
      XmlAttributeName.stroke ||
      XmlAttributeName.stopColor => attributeValue.toSvgColor(),
      XmlAttributeName.viewBox ||
      XmlAttributeName.id ||
      XmlAttributeName.href ||
      XmlAttributeName.transform ||
      XmlAttributeName.gradientTransform =>
        null, // These are strings or special types handled elsewhere
    };

    if (parsedValue == null) {
      return null;
    }

    if (parsedValue is T) {
      return parsedValue;
    } else {
      throw UnsupportedError(
        'Encountered invalid type ${parsedValue.runtimeType} (expected $T) with element ($elementName, $attributeName)',
      );
    }
  }
}
