import 'package:xml/xml.dart';

import '../../base/result.dart';
import '../../svg_model/_svg_model.dart';
import '../../xml_model/_xml_model.dart';
import '../_xml_conversion.dart';

/// Extension to convert [XmlElement] to [SvgFilter].
extension ToSvgFilter on XmlElement {
  /// Converts this [XmlElement] to an [SvgFilter].
  Result<SvgFilter> toSvgFilter() {
    final svgChildren = <SvgElement>[];
    for (final XmlNode node in children) {
      if (node is XmlElement) {
        final Result<SvgElement> result = node.toSvgElement();
        result.fold(
          (failure) => null,
          (element) => svgChildren.add(element),
        );
      }
    }

    final SvgFilterUnits filterUnits =
        SvgFilterUnits.from(
          getAttribute(XmlAttributeName.filterUnits.name),
        ) ??
        SvgFilterUnits.objectBoundingBox;

    final SvgFilterUnits primitiveUnits =
        SvgFilterUnits.from(
          getAttribute(XmlAttributeName.primitiveUnits.name),
        ) ??
        SvgFilterUnits.userSpaceOnUse;

    final SvgLengthPercentageAuto? x =
        getAttribute(XmlAttributeName.x.name)?.toSvgLengthPercentage();
    final SvgLengthPercentageAuto? y =
        getAttribute(XmlAttributeName.y.name)?.toSvgLengthPercentage();
    final SvgLengthPercentageAuto? width =
        getAttribute(XmlAttributeName.width.name)?.toSvgLengthPercentage();
    final SvgLengthPercentageAuto? height =
        getAttribute(XmlAttributeName.height.name)?.toSvgLengthPercentage();

    final CommonAttributes common = toCommonAttributes(XmlElementName.filter);

    return Success<SvgFilter>(
      SvgFilter(
        children: svgChildren,
        x: x,
        y: y,
        width: width,
        height: height,
        filterUnits: filterUnits,
        primitiveUnits: primitiveUnits,
        title: common.title,
        desc: common.desc,
        presentationAttributes: common.presentation,
        coreAttributes: common.core,
      ),
    );
  }
}
