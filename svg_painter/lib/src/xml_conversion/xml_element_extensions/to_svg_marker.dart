import 'package:xml/xml.dart';

import '../../base/result.dart';
import '../../svg_model/_svg_model.dart';
import '../../xml_model/_xml_model.dart';
import '../_xml_conversion.dart';

/// Extension to convert [XmlElement] to [SvgMarker].
extension ToSvgMarker on XmlElement {
  /// Converts this [XmlElement] to an [SvgMarker].
  Result<SvgMarker> toSvgMarker() {
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

    final SvgMarkerUnits markerUnits =
        getAttribute(XmlAttributeName.markerUnits.name)?.toSvgMarkerUnits() ??
        SvgMarkerUnits.strokeWidth;

    final SvgMarkerOrient orient =
        getAttribute(XmlAttributeName.orient.name)?.toSvgMarkerOrient() ?? SvgMarkerOrient.zero;

    final SvgLengthPercentage refX =
        getAttribute(XmlAttributeName.refX.name)?.toSvgLengthPercentage() ?? const SvgLength(0.0);

    final SvgLengthPercentage refY =
        getAttribute(XmlAttributeName.refY.name)?.toSvgLengthPercentage() ?? const SvgLength(0.0);

    final SvgLengthPercentage markerWidth =
        getAttribute(XmlAttributeName.markerWidth.name)?.toSvgLengthPercentage() ??
        const SvgLength(3.0);

    final SvgLengthPercentage markerHeight =
        getAttribute(XmlAttributeName.markerHeight.name)?.toSvgLengthPercentage() ??
        const SvgLength(3.0);

    final SvgViewBox? viewBox = getAttribute(XmlAttributeName.viewBox.name)?.toSvgViewBox();

    final SvgPreserveAspectRatio? preserveAspectRatio = getAttribute(
      XmlAttributeName.preserveAspectRatio.name,
    )?.toSvgPreserveAspectRatio();

    final SvgViewportAttributes? viewportAttributes =
        (viewBox != null || preserveAspectRatio != null)
        ? SvgViewportAttributes(
            viewBox: viewBox,
            preserveAspectRatio: preserveAspectRatio,
          )
        : null;

    final CommonAttributes common = toCommonAttributes(XmlElementName.marker);

    return Success<SvgMarker>(
      SvgMarker(
        children: svgChildren,
        refX: refX,
        refY: refY,
        markerWidth: markerWidth,
        markerHeight: markerHeight,
        markerUnits: markerUnits,
        orient: orient,
        viewportAttributes: viewportAttributes,
        title: common.title,
        desc: common.desc,
        presentationAttributes: common.presentation,
        coreAttributes: common.core,
      ),
    );
  }
}
