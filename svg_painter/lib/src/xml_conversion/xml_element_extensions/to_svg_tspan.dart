import 'package:xml/xml.dart';

import '../../base/_base.dart';
import '../../svg_model/_svg_model.dart';
import '../../xml_model/_xml_model.dart';
import '../_xml_conversion.dart';
import '../svg_whitespace_normalizer.dart';
import '_xml_element_extensions.dart';

extension ToSvgTspan on XmlElement {
  /// Converts this [XmlElement] to an [SvgTspan].
  Result<SvgTspan> toSvgTspan() {
    const XmlElementName elementName = XmlElementName.tspan;

    // Detect xml:space
    final String spaceAttr = toXmlAttributeValue(XmlAttributeName.xmlSpace) ?? 'default';
    final bool preserve = spaceAttr == 'preserve';

    final List<SvgTextContent> textChildren = <SvgTextContent>[];
    for (final XmlNode child in children) {
      if (child is XmlText) {
        final String text = child.value.normalizeSvgWhitespace(preserve: preserve);
        if (text.isNotEmpty) {
          textChildren.add(SvgCharacterData(text));
        }
      } else if (child is XmlElement) {
        final Result<SvgElement> result = child.toSvgElement();
        if (result is Success<SvgElement>) {
          final SvgElement value = result.value;
          if (value is SvgTextContent) {
            textChildren.add(value as SvgTextContent);
          }
        }
      }
    }

    // Spec rules for xml:space="default": Remove leading and trailing spaces from the ENTIRE sequence.
    if (!preserve && textChildren.isNotEmpty) {
      final SvgTextContent first = textChildren.first;
      if (first is SvgCharacterData) {
        final String trimmed = first.text.replaceFirst(RegExp(r'^ +'), '');
        if (trimmed.isEmpty) {
          textChildren.removeAt(0);
        } else {
          textChildren[0] = SvgCharacterData(trimmed);
        }
      }

      if (textChildren.isNotEmpty) {
        final SvgTextContent last = textChildren.last;
        if (last is SvgCharacterData) {
          final String trimmed = last.text.replaceFirst(RegExp(r' +$'), '');
          if (trimmed.isEmpty) {
            textChildren.removeLast();
          } else {
            textChildren[textChildren.length - 1] = SvgCharacterData(trimmed);
          }
        }
      }
    }

    final SvgLengthPercentage? x = toSvgValueOrNull<SvgLengthPercentage>(
      elementName,
      XmlAttributeName.x,
    );
    final SvgLengthPercentage? y = toSvgValueOrNull<SvgLengthPercentage>(
      elementName,
      XmlAttributeName.y,
    );
    final SvgLengthPercentage? dx = toSvgValueOrNull<SvgLengthPercentage>(
      elementName,
      XmlAttributeName.dx,
    );
    final SvgLengthPercentage? dy = toSvgValueOrNull<SvgLengthPercentage>(
      elementName,
      XmlAttributeName.dy,
    );
    final SvgNumber? rotate = toSvgValueOrNull<SvgNumber>(
      elementName,
      XmlAttributeName.rotate,
    );

    final CommonAttributes common = toCommonAttributes(elementName);

    return Success<SvgTspan>(
      SvgTspan(
        children: textChildren,
        x: x,
        y: y,
        dx: dx,
        dy: dy,
        rotate: rotate,
        coreAttributes: common.core,
        presentationAttributes: common.presentation,
      ),
    );
  }
}
