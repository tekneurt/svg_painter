import 'package:xml/xml.dart';

import '../../base/result.dart';
import '../../svg_model/_svg_model.dart';
import '../../xml_model/_xml_model.dart';
import '../_xml_conversion.dart';

/// Extension to convert [XmlElement] to [SvgFeDropShadow].
extension ToSvgFeDropShadow on XmlElement {
  /// Converts this [XmlElement] to an [SvgFeDropShadow].
  Result<SvgFeDropShadow> toSvgFeDropShadow() {
    final double dx = double.tryParse(getAttribute(XmlAttributeName.dx.name) ?? '2') ?? 2.0;
    final double dy = double.tryParse(getAttribute(XmlAttributeName.dy.name) ?? '2') ?? 2.0;
    final String? rawStdDev = getAttribute(XmlAttributeName.stdDeviation.name);
    final (double stdDevX, double stdDevY) = _parseStdDeviation(rawStdDev);

    final SvgColor floodColor = toSvgValueOrNull<SvgColor>(
          XmlElementName.feDropShadow,
          XmlAttributeName.floodColor,
        ) ??
        const SvgNamedColor(SvgColorName.black);

    final SvgLengthPercentage? floodOpacityVal = toSvgValueOrNull<SvgLengthPercentage>(
      XmlElementName.feDropShadow,
      XmlAttributeName.floodOpacity,
    );
    final double floodOpacity = switch (floodOpacityVal) {
      final SvgLength l => l.value.clamp(0.0, 1.0),
      final SvgPercentage p => (p.value / 100.0).clamp(0.0, 1.0),
      _ => 1.0,
    };

    final String? inSource = getAttribute(XmlAttributeName.in_.name);
    final String? result = getAttribute(XmlAttributeName.result.name);
    final CommonAttributes common = toCommonAttributes(XmlElementName.feDropShadow);

    return Success<SvgFeDropShadow>(
      SvgFeDropShadow(
        dx: dx,
        dy: dy,
        stdDeviationX: stdDevX,
        stdDeviationY: stdDevY,
        floodColor: floodColor,
        floodOpacity: floodOpacity,
        inSource: inSource,
        result: result,
        coreAttributes: common.core,
      ),
    );
  }
}

(double, double) _parseStdDeviation(String? raw) {
  if (raw == null || raw.trim().isEmpty) {
    return (2.0, 2.0);
  }
  final List<String> parts =
      raw.trim().split(RegExp(r'[\s,]+')).where((String s) => s.isNotEmpty).toList();
  if (parts.isEmpty) {
    return (2.0, 2.0);
  }
  final double x = double.tryParse(parts[0]) ?? 2.0;
  final double y = parts.length > 1 ? (double.tryParse(parts[1]) ?? x) : x;
  return (x, y);
}
