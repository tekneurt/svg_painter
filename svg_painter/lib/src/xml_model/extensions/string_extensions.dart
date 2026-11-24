import 'package:xml/xml.dart';

import '../../base/_base.dart';

/// Extension on [String] to facilitate conversion to XML.
extension ToXml on String {
  /// Parses the string as an [XmlDocument].
  ///
  /// Expands any internal DTD `<!ENTITY ...>` declarations before parsing.
  /// Returns a [Success] containing the [XmlDocument] if parsing is successful.
  /// Returns a [Failure] containing an error message if parsing fails (e.g., due to malformed XML).
  Result<XmlDocument> toXmlDocument() {
    try {
      final String expanded = _expandXmlEntities(this);
      final document = XmlDocument.parse(expanded);
      return Success<XmlDocument>(document);
    } on XmlException catch (e) {
      return Failure<XmlDocument>('XML parsing failed: ${e.message}');
    } catch (e) {
      // Defensive catch-all for untreatable Errors (all expected Exceptions are handled explicitly).
      // coverage:ignore-start
      return Failure<XmlDocument>('$untreatableErrorPrefix during XML parsing: $e');
      // coverage:ignore-end
    }
  }

  static final RegExp _dtdRegex = RegExp(r'<!DOCTYPE\s+[^>\[]*\[(.*?)\]>', dotAll: true);
  static final RegExp _entityRegex = RegExp(
    r'''<!ENTITY\s+([a-zA-Z0-9_\-]+)\s+(?:"([^"]*)"|'([^']*)')\s*>''',
    dotAll: true,
  );

  static String _expandXmlEntities(String xml) {
    final RegExpMatch? dtdMatch = _dtdRegex.firstMatch(xml);
    if (dtdMatch == null) {
      return xml;
    }
    final String? dtdContent = dtdMatch.group(1);
    if (dtdContent == null) {
      return xml;
    }
    final entities = <String, String>{};
    for (final RegExpMatch match in _entityRegex.allMatches(dtdContent)) {
      final String? name = match.group(1);
      final String? value = match.group(2) ?? match.group(3);
      if (name != null && value != null) {
        entities[name] = value;
      }
    }
    if (entities.isEmpty) {
      return xml;
    }
    var expanded = xml;
    for (final MapEntry<String, String> entry in entities.entries) {
      expanded = expanded.replaceAll('&${entry.key};', entry.value);
    }
    return expanded;
  }
}
