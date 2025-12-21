import 'package:xml/xml.dart';

import '../../svg_model/_svg_model.dart';
import '../../xml_model/_xml_model.dart';
import '../_xml_conversion.dart';

/// Extension to convert [XmlElement] to [SvgValue].
extension XmlElementToSvgValue on XmlElement {
  T toSvgValue<T extends SvgBaseValue>(XmlElementName elementName, XmlAttributeName attributeName) {
    final String? attributeValue = getXmlAttributeValue(attributeName);
    final SvgBaseValue result =
        switch (elementName) {
          XmlElementName.circle => attributeValue?.toSvgLengthPercentage(),

          XmlElementName.svg => throw UnimplementedError(),
        } ?? // Or the default value when null...
        attributeName.getDefaultValue(elementName);

    if (result is T) {
      return result;
    } else {
      throw UnsupportedError(
        'Encountered invalid type ${T.runtimeType} with element ($elementName, $attributeName)',
      );
    }
  }
}
