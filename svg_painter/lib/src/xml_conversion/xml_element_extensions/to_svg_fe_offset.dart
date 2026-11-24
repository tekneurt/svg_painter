import 'package:xml/xml.dart';

import '../../base/result.dart';
import '../../svg_model/_svg_model.dart';
import '../../xml_model/_xml_model.dart';
import '../_xml_conversion.dart';

/// Extension to convert [XmlElement] to [SvgFeOffset].
extension ToSvgFeOffset on XmlElement {
  /// Converts this [XmlElement] to an [SvgFeOffset].
  Result<SvgFeOffset> toSvgFeOffset() {
    final double dx = double.tryParse(getAttribute(XmlAttributeName.dx.name) ?? '0') ?? 0.0;
    final double dy = double.tryParse(getAttribute(XmlAttributeName.dy.name) ?? '0') ?? 0.0;
    final String? inSource = getAttribute(XmlAttributeName.in_.name);
    final String? result = getAttribute(XmlAttributeName.result.name);
    final CommonAttributes common = toCommonAttributes(XmlElementName.feOffset);

    return Success<SvgFeOffset>(
      SvgFeOffset(
        dx: dx,
        dy: dy,
        inSource: inSource,
        result: result,
        coreAttributes: common.core,
      ),
    );
  }
}
