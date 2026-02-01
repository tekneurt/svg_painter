import 'package:xml/xml.dart';

import '../../svg_model/_svg_model.dart';
import '../../xml_model/_xml_model.dart';
import '../_xml_conversion.dart';

/// Extension to convert [XmlElement] to [SvgValue].
extension ToSvgValue on XmlElement {
  /// Converts an XML attribute to an [SvgBaseValue], falling back to the default value.
  T toSvgValue<T extends SvgBaseValue>(XmlElementName elementName, XmlAttributeName attributeName) {
    final T? value = toSvgValueOrNull<T>(elementName, attributeName);
    if (value == null) {
      final SvgBaseValue defaultValue = attributeName.toDefaultValue(elementName);
      if (defaultValue is T) {
        return defaultValue;
      } else {
        throw UnsupportedError(
          'Default value for ($elementName, $attributeName) is ${defaultValue.runtimeType}, expected $T',
        );
      }
    } else {
      return value;
    }
  }

  /// Converts an XML attribute to an [SvgBaseValue], or returns null if not present.
  T? toSvgValueOrNull<T extends SvgBaseValue>(
    XmlElementName elementName,
    XmlAttributeName attributeName,
  ) {
    final String? attributeValue = toXmlAttributeValue(attributeName);
    if (attributeValue == null) {
      return null;
    } else {
      final SvgBaseValue? parsedValue = switch (attributeName) {
        .x ||
        .y ||
        .x1 ||
        .y1 ||
        .x2 ||
        .y2 ||
        .cx ||
        .cy ||
        .r ||
        .fx ||
        .fy ||
        .fr ||
        .offset ||
        .opacity ||
        .fillOpacity ||
        .strokeOpacity ||
        .stopOpacity ||
        .fontSize ||
        .strokeWidth => attributeValue.toSvgLengthPercentage(),
        .rx || .ry || .width || .height => attributeValue.toSvgLengthPercentageAuto(),
        .pathLength => attributeValue.toSvgNonNegativeNumber(),
        .points || .strokeDasharray => attributeValue.toSvgPointList(),
        .fill || .stroke || .stopColor => attributeValue.toSvgColor(),
        .strokeLinecap => attributeValue.toSvgStrokeLinecap(),
        .strokeLinejoin => attributeValue.toSvgStrokeLinejoin(),
        .fontWeight => attributeValue.toSvgFontWeight(),
        .fontStyle => attributeValue.toSvgFontStyle(),
        .fontFamily => attributeValue.toSvgFontFamily(),
        .viewBox ||
        .id ||
        .d ||
        .className ||
        .style ||
        .href ||
        .transform ||
        .gradientTransform => null, // These are strings or special types handled elsewhere
      };

      if (parsedValue == null) {
        return null;
      } else if (parsedValue is T) {
        return parsedValue;
      } else {
        throw UnsupportedError(
          'Encountered invalid type ${parsedValue.runtimeType} (expected $T) with element ($elementName, $attributeName)',
        );
      }
    }
  }

  /// Parses the `pathLength` attribute as a non-negative [SvgNonNegativeNumber].
  ///
  /// Returns null if the attribute is missing, malformed, or negative.
  SvgNonNegativeNumber? toPathLength() {
    final String? value = toXmlAttributeValue(XmlAttributeName.pathLength);
    if (value == null) {
      return null;
    }

    final double? parsed = double.tryParse(value);
    if (parsed == null || parsed < 0) {
      return null;
    }

    return SvgNonNegativeNumber(parsed);
  }
}
