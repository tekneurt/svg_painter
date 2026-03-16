import '../../svg_model/_svg_model.dart';
import '../../xml_model/_xml_model.dart';

/// Extension to provide default values for [XmlAttributeName]s based on the element.
extension ToDefaultValue on XmlAttributeName {
  SvgBaseValue toDefaultValue(final XmlElementName elementName) {
    switch (this) {
      case .x:
      case .y:
        return switch (elementName) {
          .rect || .use || .text || .svg => const SvgLength(0.0),
          (_) => throw UnsupportedError('Invalid combination $this x $elementName '),
        };
      case .x1:
      case .y1:
      case .y2:
        return switch (elementName) {
          .linearGradient => const SvgPercentage(0.0),
          .line => const SvgLength(0.0),
          (_) => throw UnsupportedError('Invalid combination $this x $elementName '),
        };
      case .x2:
        return switch (elementName) {
          .linearGradient => const SvgPercentage(100.0),
          .line => const SvgLength(0.0),
          (_) => throw UnsupportedError('Invalid combination $this x $elementName '),
        };
      case .cx:
      case .cy:
        return switch (elementName) {
          .circle || .ellipse => const SvgLength(0.0),
          .radialGradient => const SvgPercentage(50.0),
          (_) => throw UnsupportedError('Invalid combination $this x $elementName '),
        };
      case .r:
        return switch (elementName) {
          .circle => const SvgLength(0.0),
          .radialGradient => const SvgPercentage(50.0),
          (_) => throw UnsupportedError('Invalid combination $this x $elementName '),
        };
      case .rx:
      case .ry:
        return switch (elementName) {
          .ellipse || .rect => const SvgAuto(),
          (_) => throw UnsupportedError('Invalid combination $this x $elementName '),
        };
      case .width:
      case .height:
        return switch (elementName) {
          .svg || .rect || .use => const SvgAuto(),
          (_) => throw UnsupportedError('Invalid combination $this x $elementName '),
        };
      case .points:
        return const SvgPointList(<double>[]);
      case .fill:
        return switch (elementName) {
          .line => const SvgNoneColor(),
          (_) => const SvgNamedColor(SvgColorName.black),
        };
      case .stroke:
        return const SvgNoneColor();
      case .strokeWidth:
        return const SvgLength(1.0);
      case .strokeLinecap:
        return SvgStrokeLinecap.butt;
      case .strokeLinejoin:
        return SvgStrokeLinejoin.miter;
      case .offset:
        return const SvgLength(0.0);
      case .stopColor:
        return const SvgNamedColor(SvgColorName.black);
      case .stopOpacity:
        return const SvgLength(1.0);
      case .opacity:
      case .fillOpacity:
      case .strokeOpacity:
        return const SvgLength(1.0);
      case .fx:
      case .fy:
        return switch (elementName) {
          .radialGradient => const SvgPercentage(50.0),
          (_) => throw UnsupportedError('Invalid combination $this x $elementName '),
        };
      case .fr:
        return switch (elementName) {
          .radialGradient => const SvgPercentage(0.0),
          (_) => throw UnsupportedError('Invalid combination $this x $elementName '),
        };
      case .viewBox:
      case .preserveAspectRatio:
      case .id:
      case .d:
      case .className:
      case .style:
      case .href:
      case .transform:
      case .gradientTransform:
      case .fontSize:
      case .fontWeight:
      case .fontStyle:
      case .fontFamily:
      case .pathLength:
      case .strokeDasharray:
        throw UnsupportedError('$name does not have a SvgBaseValue default');
    }
  }
}
