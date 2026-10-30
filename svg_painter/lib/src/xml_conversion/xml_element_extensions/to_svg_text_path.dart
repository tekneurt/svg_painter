import 'package:xml/xml.dart';

import '../../base/_base.dart';
import '../../svg_model/_svg_model.dart';
import '../../xml_model/_xml_model.dart';
import '../_xml_conversion.dart';
import '../svg_whitespace_normalizer.dart';
import '_xml_element_extensions.dart';

extension ToSvgTextPath on XmlElement {
  /// Converts this [XmlElement] to an [SvgTextPath].
  Result<SvgTextPath> toSvgTextPath() {
    const XmlElementName elementName = XmlElementName.textPath;

    final String? href = getAttribute('href') ?? getAttribute('xlink:href');
    if (href == null) {
      return const Failure<SvgTextPath>('textPath element must have an href attribute.');
    }

    final String spaceAttr = toXmlAttributeValue(XmlAttributeName.xmlSpace) ?? 'default';
    final preserve = spaceAttr == 'preserve';

    final textChildren = <SvgTextContent>[];
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

    final SvgLengthPercentage? startOffset = toSvgValueOrNull<SvgLengthPercentage>(
      elementName,
      XmlAttributeName.startOffset,
    );
    final String? pathData = getAttribute('path');

    final CommonAttributes common = toCommonAttributes(elementName);

    return Success<SvgTextPath>(
      SvgTextPath(
        href: href,
        children: textChildren,
        startOffset: startOffset,
        pathData: pathData,
        title: common.title,
        desc: common.desc,
        coreAttributes: common.core,
        presentationAttributes: common.presentation,
      ),
    );
  }
}
