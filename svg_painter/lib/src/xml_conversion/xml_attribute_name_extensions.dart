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
      case .cx:
      case .cy:
        return switch (elementName) {
          .circle => const SvgLength(0.0),
          .ellipse => const SvgLength(0.0),
          (_) => throw UnsupportedError('Invalid combination $this x $elementName '),
        };
      case .r:
        return switch (elementName) {
          .circle => const SvgLength(0.0),
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
        throw UnsupportedError('viewBox does not have a SvgBaseValue default');
      case .fill:
        return const SvgNamedColor(SvgColorName.black); // Default fill is black
      case .stroke:
        return const SvgNoneColor(); // Default stroke is none
      case .strokeWidth:
        return const SvgLength(1.0);
    }
  }
}
