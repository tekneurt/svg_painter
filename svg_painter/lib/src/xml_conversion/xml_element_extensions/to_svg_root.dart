import 'package:xml/xml.dart';

import '../../base/_base.dart';
import '../../svg_model/_svg_model.dart';
import '../../xml_model/_xml_model.dart';
import '../_xml_conversion.dart';

extension ToSvgRoot on XmlElement {
  /// Converts this [XmlElement] to an [SvgRoot].
  Result<SvgRoot> toSvgRoot() {
    const XmlElementName elementName = XmlElementName.svg;

    // Collect all CSS rules from <style> elements
    final List<Map<String, Map<String, String>>> allRules = <Map<String, Map<String, String>>>[];
    final Iterable<XmlElement> styleElements = findAllElements(XmlElementName.style.tagName);
    for (final XmlElement styleEl in styleElements) {
      final String css = styleEl.innerText;
      allRules.add(SvgStyleParser.parse(css).rules);
    }

    // Merge rules (later ones override earlier ones)
    final Map<String, Map<String, String>> mergedRules = <String, Map<String, String>>{};
    for (final Map<String, Map<String, String>> rules in allRules) {
      for (final String className in rules.keys) {
        mergedRules.putIfAbsent(className, () => <String, String>{}).addAll(rules[className]!);
      }
    }
    final SvgStyleSheet styleSheet = SvgStyleSheet(mergedRules);

    final Result<List<SvgElement>> childrenResult = children
        .whereType<XmlElement>()
        .map((XmlElement child) => child.toSvgElement())
        .combine();

    final SvgLengthPercentageAuto width = toSvgValue<SvgLengthPercentageAuto>(
      elementName,
      XmlAttributeName.width,
    );
    final SvgLengthPercentageAuto height = toSvgValue<SvgLengthPercentageAuto>(
      elementName,
      XmlAttributeName.height,
    );
    final SvgLengthPercentage? x = toSvgValueOrNull<SvgLengthPercentage>(
      elementName,
      XmlAttributeName.x,
    );
    final SvgLengthPercentage? y = toSvgValueOrNull<SvgLengthPercentage>(
      elementName,
      XmlAttributeName.y,
    );
    final SvgViewBox? viewBox = toXmlAttributeValue(XmlAttributeName.viewBox)?.toSvgViewBox();

    final CommonAttributes common = toCommonAttributes(elementName);

    return childrenResult.map(
      (List<SvgElement> childElements) => SvgRoot(
        children: childElements,
        styleSheet: styleSheet,
        x: x,
        y: y,
        width: width,
        height: height,
        viewBox: viewBox,
        fillAttributes: common.fillAttributes,
        strokeAttributes: common.strokeAttributes,
        fontAttributes: common.fontAttributes,
        opacity: common.opacity,
        cssClass: common.cssClass,
        inlineStyle: common.inlineStyle,
        transform: common.transform,
        id: common.id,
      ),
    );
  }
}
