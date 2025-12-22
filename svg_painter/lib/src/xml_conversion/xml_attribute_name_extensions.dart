import '../svg_model/_svg_model.dart';
import '../xml_model/_xml_model.dart';

extension XmlAttributeDefaultValues on XmlAttributeName {
  SvgBaseValue getDefaultValue(final XmlElementName elementName) {
    switch (this) {
      case .x:
      case .y:
        return switch (elementName) {
          .rect => const SvgLength(0.0),
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
          .svg || .rect => const SvgAuto(),
          (_) => throw UnsupportedError('Invalid combination $this x $elementName '),
        };
      case .viewBox:
      case .id:
      case .gradientTransform:
        throw UnsupportedError('$name does not have a SvgBaseValue default');
      case .fill:
        return const SvgNamedColor(SvgColorName.black); // Default fill is black
      case .stroke:
        return const SvgNoneColor(); // Default stroke is none
      case .strokeWidth:
        return const SvgLength(1.0);
      case .offset:
        return const SvgLength(0.0);
      case .stopColor:
        return const SvgNamedColor(SvgColorName.black);
      case .stopOpacity:
        return const SvgLength(1.0);
      case .points:
        return const SvgPointList(<double>[]);
      case .fx:
      case .fy:
        // fx/fy default to cx/cy if not specified?
        // Spec says: "If the attribute is not specified, the effect is as if a value of '50%' were specified."
        // Wait, cx/cy default is 50%.
        // Our cx/cy default for circle/ellipse is 0.
        // For RadialGradient, cx/cy default is 50%.
        // I need to update cx/cy defaults to be context dependent!
        // My `getDefaultValue` logic splits by element name.
        return switch (elementName) {
          .radialGradient => const SvgPercentage(50.0),
          (_) => throw UnsupportedError('Invalid combination $this x $elementName '),
        };
    }
  }
}
