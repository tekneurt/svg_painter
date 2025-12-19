import 'package:xml/xml.dart';
import '../util/result.dart';

/// A utility class for parsing XML strings into an [XmlDocument].
///
/// This class provides a safe parsing method that returns a [Result]
/// encapsulating either a successful [XmlDocument] or a [Failure]
/// with an error message.
class XmlParser {
  const XmlParser._();

  /// Parses the given [xmlString] into an [XmlDocument].
  ///
  /// Returns a [Success] containing the [XmlDocument] if parsing is successful.
  /// Returns a [Failure] containing an error message if parsing fails (e.g., due to malformed XML).
  static Result<XmlDocument> parse(String xmlString) {
    try {
      final XmlDocument document = XmlDocument.parse(xmlString);
      return Success<XmlDocument>(document);
    } on XmlException catch (e) {
      return Failure<XmlDocument>('XML parsing failed: ${e.message}');
    } catch (e) {
      return Failure<XmlDocument>('An unknown error occurred during XML parsing: $e');
    }
  }
}
