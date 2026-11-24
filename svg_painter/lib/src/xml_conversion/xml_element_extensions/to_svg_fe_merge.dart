import 'package:xml/xml.dart';

import '../../base/result.dart';
import '../../svg_model/_svg_model.dart';
import '../../xml_model/_xml_model.dart';
import '../_xml_conversion.dart';

/// Extension to convert [XmlElement] to [SvgFeMergeNode].
extension ToSvgFeMergeNode on XmlElement {
  /// Converts this [XmlElement] to an [SvgFeMergeNode].
  Result<SvgFeMergeNode> toSvgFeMergeNode() {
    final String? inSource = getAttribute(XmlAttributeName.in_.name);
    final CommonAttributes common = toCommonAttributes(XmlElementName.feMergeNode);

    return Success<SvgFeMergeNode>(
      SvgFeMergeNode(
        inSource: inSource,
        coreAttributes: common.core,
      ),
    );
  }
}

/// Extension to convert [XmlElement] to [SvgFeMerge].
extension ToSvgFeMerge on XmlElement {
  /// Converts this [XmlElement] to an [SvgFeMerge].
  Result<SvgFeMerge> toSvgFeMerge() {
    final nodes = <SvgFeMergeNode>[];
    for (final XmlNode node in children) {
      if (node is XmlElement && node.name.local == XmlElementName.feMergeNode.tagName) {
        final Result<SvgFeMergeNode> result = node.toSvgFeMergeNode();
        result.fold(
          (failure) => null,
          (mergeNode) => nodes.add(mergeNode),
        );
      }
    }

    final String? inSource = getAttribute(XmlAttributeName.in_.name);
    final String? result = getAttribute(XmlAttributeName.result.name);
    final CommonAttributes common = toCommonAttributes(XmlElementName.feMerge);

    return Success<SvgFeMerge>(
      SvgFeMerge(
        nodes: nodes,
        inSource: inSource,
        result: result,
        coreAttributes: common.core,
      ),
    );
  }
}
