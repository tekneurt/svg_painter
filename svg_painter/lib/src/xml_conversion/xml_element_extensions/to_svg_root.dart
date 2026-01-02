import 'package:xml/xml.dart';

import '../../base/_base.dart';
import '../../svg_model/_svg_model.dart';
import '../../xml_model/_xml_model.dart';
import '../_xml_conversion.dart';

extension ElementToSvgRoot on XmlElement {
  /// Converts this [XmlElement] to an [SvgRoot].
  Result<SvgRoot> toSvgRoot() {
    const XmlElementName elementName = XmlElementName.svg;
    final List<SvgElement> childElements = <SvgElement>[];

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
    final SvgViewBox? viewBox = getXmlAttributeValue(XmlAttributeName.viewBox)?.toSvgViewBox();

    final CommonAttributes common = getCommonAttributes(elementName);

    return Success<SvgRoot>(
      SvgRoot(
        children: childElements,
        styleSheet: styleSheet,
        x: x,
        y: y,
        width: width,
        height: height,
        viewBox: viewBox,
        fill: common.fill,
        fillOpacity: common.fillOpacity,
        stroke: common.stroke,
        strokeOpacity: common.strokeOpacity,
        strokeWidth: common.strokeWidth,
        strokeLinecap: common.strokeLinecap,
        strokeLinejoin: common.strokeLinejoin,
        opacity: common.opacity,
        cssClass: common.cssClass,
        inlineStyle: common.inlineStyle,
        transform: common.transform,
        pathLength: common.pathLength,
        strokeDasharray: common.strokeDasharray,
        id: common.id,
      ),
    );
  }
}
