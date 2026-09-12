import 'package:xml/xml.dart';

import '../../base/result.dart';
import '../../svg_model/_svg_model.dart';
import '../../xml_model/_xml_model.dart';
import '../_xml_conversion.dart';

/// Extension to convert [XmlElement] to [SvgMask].
extension ToSvgMask on XmlElement {
  /// Converts this [XmlElement] to an [SvgMask].
  Result<SvgMask> toSvgMask() {
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

    final SvgMaskUnits maskUnits = SvgMaskUnits.from(
          getAttribute(XmlAttributeName.maskUnits.name),
        ) ??
        SvgMaskUnits.objectBoundingBox;

    final SvgMaskUnits maskContentUnits = SvgMaskUnits.from(
          getAttribute(XmlAttributeName.maskContentUnits.name),
        ) ??
        SvgMaskUnits.userSpaceOnUse;

    final SvgLengthPercentage x = getAttribute(XmlAttributeName.x.name)?.toSvgLengthPercentage() ??
        const SvgPercentage(-10);
    final SvgLengthPercentage y = getAttribute(XmlAttributeName.y.name)?.toSvgLengthPercentage() ??
        const SvgPercentage(-10);
    final SvgLengthPercentageAuto width =
        getAttribute(XmlAttributeName.width.name)?.toSvgLengthPercentage() ??
        const SvgPercentage(120);
    final SvgLengthPercentageAuto height =
        getAttribute(XmlAttributeName.height.name)?.toSvgLengthPercentage() ??
        const SvgPercentage(120);

    final CommonAttributes common = toCommonAttributes(XmlElementName.mask);

    return Success<SvgMask>(
      SvgMask(
        children: svgChildren,
        x: x,
        y: y,
        width: width,
        height: height,
        maskUnits: maskUnits,
        maskContentUnits: maskContentUnits,
        presentationAttributes: common.presentation,
        coreAttributes: common.core,
      ),
    );
  }
}
