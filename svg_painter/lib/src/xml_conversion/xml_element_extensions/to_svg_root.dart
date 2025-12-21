import 'package:xml/xml.dart';

import '../../base/_base.dart';
import '../../svg_model/_svg_model.dart';
import '../_xml_conversion.dart';

extension ElementToSvgRoot on XmlElement {
  /// Converts this [XmlElement] to an [SvgRoot].
  Result<SvgRoot> toSvgRoot() {
    final List<SvgElement> childElements = <SvgElement>[];

    for (final XmlNode child in children) {
      if (child is XmlElement) {
        final Result<SvgElement> result = child.toSvgElement();
        result.fold(
          (Failure<SvgElement> failure) {
            // Ignore unsupported children
          },
          (SvgElement value) {
            childElements.add(value);
          },
        );
      }
    }

    return Success<SvgRoot>(SvgRoot(children: childElements));
  }
}
