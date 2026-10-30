import 'package:xml/xml.dart';

import '../../base/result.dart';
import '../../svg_model/_svg_model.dart';
import '../../xml_model/_xml_model.dart';
import '../_xml_conversion.dart';

/// Extension to convert [XmlElement] to [SvgFeGaussianBlur].
extension ToSvgFeGaussianBlur on XmlElement {
  /// Converts this [XmlElement] to an [SvgFeGaussianBlur].
  Result<SvgFeGaussianBlur> toSvgFeGaussianBlur() {
    final String? rawStdDev = getAttribute(XmlAttributeName.stdDeviation.name);
    final (double stdDevX, double stdDevY) = _parseStdDeviation(rawStdDev);

    final String? inSource = getAttribute(XmlAttributeName.in_.name);
    final String? result = getAttribute(XmlAttributeName.result.name);
    final CommonAttributes common = toCommonAttributes(XmlElementName.feGaussianBlur);

    return Success<SvgFeGaussianBlur>(
      SvgFeGaussianBlur(
        stdDeviationX: stdDevX,
        stdDeviationY: stdDevY,
        inSource: inSource,
        result: result,
        coreAttributes: common.core,
      ),
    );
  }
}

(double, double) _parseStdDeviation(String? raw) {
  if (raw == null || raw.trim().isEmpty) {
    return (0.0, 0.0);
  }
  final List<String> parts = raw.trim().split(RegExp(r'[\s,]+')).where((String s) => s.isNotEmpty).toList();
  if (parts.isEmpty) {
    return (0.0, 0.0);
  }
  final double x = double.tryParse(parts[0]) ?? 0.0;
  final double y = parts.length > 1 ? (double.tryParse(parts[1]) ?? x) : x;
  return (x, y);
}
