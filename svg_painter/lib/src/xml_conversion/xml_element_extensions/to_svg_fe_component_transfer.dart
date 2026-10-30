import 'package:xml/xml.dart';

import '../../base/result.dart';
import '../../svg_model/_svg_model.dart';
import '../../xml_model/_xml_model.dart';
import '../_xml_conversion.dart';

/// Extension to convert [XmlElement] to [SvgFeComponentTransfer].
extension ToSvgFeComponentTransfer on XmlElement {
  /// Converts this [XmlElement] to an [SvgFeComponentTransfer].
  Result<SvgFeComponentTransfer> toSvgFeComponentTransfer() {
    SvgFeFuncR? funcR;
    SvgFeFuncG? funcG;
    SvgFeFuncB? funcB;
    SvgFeFuncA? funcA;

    for (final XmlNode node in children) {
      if (node is XmlElement) {
        final XmlElementName? elementName = XmlElementName.from(node.name.local);
        switch (elementName) {
          case XmlElementName.feFuncR:
            node.toSvgFeFuncR().fold((failure) => null, (r) => funcR = r);
          case XmlElementName.feFuncG:
            node.toSvgFeFuncG().fold((failure) => null, (g) => funcG = g);
          case XmlElementName.feFuncB:
            node.toSvgFeFuncB().fold((failure) => null, (b) => funcB = b);
          case XmlElementName.feFuncA:
            node.toSvgFeFuncA().fold((failure) => null, (a) => funcA = a);
          case _:
            break;
        }
      }
    }

    final String? inSource = getAttribute(XmlAttributeName.in_.name);
    final String? result = getAttribute(XmlAttributeName.result.name);
    final CommonAttributes common = toCommonAttributes(XmlElementName.feComponentTransfer);

    return Success<SvgFeComponentTransfer>(
      SvgFeComponentTransfer(
        funcR: funcR,
        funcG: funcG,
        funcB: funcB,
        funcA: funcA,
        inSource: inSource,
        result: result,
        coreAttributes: common.core,
      ),
    );
  }
}
