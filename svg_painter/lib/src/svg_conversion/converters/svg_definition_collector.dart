import '../../svg_model/_svg_model.dart';

extension SvgElementToDefinitions on SvgElement {
  /// recursively collects all elements with IDs into a map.
  void collectDefinitions(Map<String, SvgElement> map) {
    final SvgElement self = this;
    if (self.id == null) {
      // No ID
    } else {
      // print('Collecting definition: ${self.id}');
      map[self.id!] = self;
    }

    if (self is SvgSvg) {
      for (final SvgElement child in self.children) {
        child.collectDefinitions(map);
      }
    } else if (self is SvgDefs) {
      for (final SvgElement child in self.children) {
        child.collectDefinitions(map);
      }
    }
    // Gradients usually don't have children relevant for definitions map (stops),
    // but if we support nested structures later, we might need to recurse more.
  }
}
