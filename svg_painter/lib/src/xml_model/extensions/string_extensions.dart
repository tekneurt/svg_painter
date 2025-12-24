import 'package:xml/xml.dart';

import '../../base/result.dart';

/// Extension on [String] to parse it into an [XmlDocument].
extension StringToXml on String {
  /// Parses this string into an [XmlDocument].
  ///
  /// Returns a [Success] containing the [XmlDocument] if parsing is successful.
  /// Returns a [Failure] containing an error message if parsing fails (e.g., due to malformed XML).
  Result<XmlDocument> toXmlDocument() {
    try {
      final XmlDocument document = XmlDocument.parse(this);
      return Success<XmlDocument>(document);
    } on XmlException catch (e) {
      return Failure<XmlDocument>('XML parsing failed: ${e.message}');
    } catch (e) {
      return Failure<XmlDocument>('An unknown error occurred during XML parsing: $e');
    }
  }
}
