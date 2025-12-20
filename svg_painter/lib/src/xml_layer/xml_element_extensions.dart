import 'package:xml/xml.dart';
import 'xml_attribute_name.dart';

/// Extensions on [XmlElement] to facilitate working with [XmlAttributeName]s.
extension XmlElementExtensions on XmlElement {
  /// Retrieves the value of the given [attribute].
  ///
  /// Returns `null` if the attribute is not present.
  String? getAttributeValue(XmlAttributeName attribute) {
    return getAttribute(attribute.name);
  }
}
