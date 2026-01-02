import 'package:xml/xml.dart';
import '../../xml_model/_xml_model.dart';

/// Extensions on [XmlElement] to facilitate working with [XmlAttributeName]s.
extension ToXmlAttributeValue on XmlElement {
  /// Retrieves the value of the given [attribute].
  ///
  /// Returns `null` if the attribute is not present.
  String? toXmlAttributeValue(XmlAttributeName attribute) {
    return getAttribute(attribute.name);
  }
}
