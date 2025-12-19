import 'package:xml/xml.dart';

import '../svg_model/svg_element.dart';
import '../util/result.dart';

/// Maps XML elements to SVG domain objects.
class SvgMapper {
  const SvgMapper._();

  /// Maps an [XmlElement] to an [SvgElement].
  static Result<SvgElement> fromXml(XmlElement element) {
    switch (element.name.local) {
      case 'svg':
        return _mapRoot(element);
      case 'circle':
        return _mapCircle(element);
      default:
        return Failure<SvgElement>(
          'Unsupported SVG element: <${element.name.local}>',
        );
    }
  }

  static Result<SvgRoot> _mapRoot(XmlElement element) {
    final List<SvgElement> children = <SvgElement>[];

    for (final XmlNode child in element.children) {
      if (child is XmlElement) {
        final Result<SvgElement> result = fromXml(child);
        result.fold(
          (Failure<SvgElement> failure) {
            // Option: Propagate error, or ignore unsupported children.
            // For now, we ignore unsupported children to allow <svg> with
            // mixed content (like <title>, <desc>, or unsupported shapes)
            // without crashing the whole root.
            // But we might want to log this?
          },
          (SvgElement value) {
            children.add(value);
          },
        );
      }
    }

    return Success<SvgRoot>(SvgRoot(children: children));
  }

  static Result<SvgCircle> _mapCircle(XmlElement element) {
    final String? cxStr = element.getAttribute('cx');
    final String? cyStr = element.getAttribute('cy');
    final String? rStr = element.getAttribute('r');

    // Default values per SVG spec if attributes are missing
    final double cx = cxStr != null ? double.tryParse(cxStr) ?? 0.0 : 0.0;
    final double cy = cyStr != null ? double.tryParse(cyStr) ?? 0.0 : 0.0;
    final double r = rStr != null ? double.tryParse(rStr) ?? 0.0 : 0.0;

    // We strictly default to 0.0 for invalid/missing values.

    return Success<SvgCircle>(
      SvgCircle(
        cx: cx,
        cy: cy,
        r: r,
      ),
    );
  }
}
