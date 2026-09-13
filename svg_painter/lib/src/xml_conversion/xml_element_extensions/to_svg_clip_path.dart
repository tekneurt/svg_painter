import 'package:xml/xml.dart';

import '../../base/result.dart';
import '../../svg_model/_svg_model.dart';
import '../../xml_model/_xml_model.dart';
import '../_xml_conversion.dart';

/// Extension to convert [XmlElement] to [SvgClipPath].
extension ToSvgClipPath on XmlElement {
  /// Converts this [XmlElement] to an [SvgClipPath].
  Result<SvgClipPath> toSvgClipPath() {
    final svgChildren = <SvgElement>[];
    for (final XmlNode node in children) {
      if (node is XmlElement) {
        final Result<SvgElement> result = node.toSvgElement();
        result.fold(
          (failure) => null, // Skip invalid children
          (element) => svgChildren.add(element),
        );
      }
    }

    final SvgClipPathUnits clipPathUnits = SvgClipPathUnits.from(
          getAttribute(XmlAttributeName.clipPathUnits.name),
        ) ??
        SvgClipPathUnits.userSpaceOnUse;

    final CommonAttributes common = toCommonAttributes(XmlElementName.clipPath);

    return Success<SvgClipPath>(
      SvgClipPath(
        children: svgChildren,
        clipPathUnits: clipPathUnits,
        presentationAttributes: common.presentation,
        coreAttributes: common.core,
      ),
    );
  }
}
