import '../svg_model/_svg_model.dart';
import '../xml_model/_xml_model.dart';

extension XmlAttributeDefaultValues on XmlAttributeName {
  SvgBaseValue getDefaultValue(final XmlElementName elementName) {
    switch (this) {
      case XmlAttributeName.cx:
      case XmlAttributeName.cy:
      case XmlAttributeName.r:
        return switch (elementName) {
          XmlElementName.circle => const SvgLength(0.0),
          (_) => throw UnsupportedError('Invalid combination $this x $elementName '),
        };
    }
  }

  bool isSupported(final XmlElementName elementName) {
    switch (this) {
      case XmlAttributeName.cx:
      case XmlAttributeName.cy:
      case XmlAttributeName.r:
        return switch (elementName) {
          XmlElementName.circle => true,
          _ => false,
        };
    }
  }
}
