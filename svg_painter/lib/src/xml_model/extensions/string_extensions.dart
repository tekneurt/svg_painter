import 'package:xml/xml.dart';

import '../../base/_base.dart';

/// Extension on [String] to facilitate conversion to XML.
extension ToXml on String {
  /// Parses the string as an [XmlDocument].
  ///
  /// Returns a [Success] containing the [XmlDocument] if parsing is successful.
  /// Returns a [Failure] containing an error message if parsing fails (e.g., due to malformed XML).
  Result<XmlDocument> toXmlDocument() {
    try {
      final document = XmlDocument.parse(this);
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
}
