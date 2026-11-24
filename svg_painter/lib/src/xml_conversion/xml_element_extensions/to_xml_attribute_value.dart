import 'package:xml/xml.dart';
import '../../xml_model/_xml_model.dart';

/// Extensions on [XmlElement] to facilitate working with [XmlAttributeName]s.
extension ToXmlAttributeValue on XmlElement {
  /// Retrieves the value of the given [attribute].
  ///
  /// Returns `null` if the attribute is not present.
  String? toXmlAttributeValue(XmlAttributeName attribute) {
    final String? value = getAttribute(attribute.name);

    if (value != null) {
      return value;
    } else if (attribute == XmlAttributeName.href) {
      return getAttribute('href', namespaceUri: 'http://www.w3.org/1999/xlink') ??
          getAttribute('xlink:href');
    } else if (attribute == XmlAttributeName.xlinkHref) {
      return getAttribute('href', namespaceUri: 'http://www.w3.org/1999/xlink') ??
          getAttribute('href');
    } else {
      return null;
    }
  }
}
