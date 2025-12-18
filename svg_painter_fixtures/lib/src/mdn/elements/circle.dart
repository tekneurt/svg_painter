/// Fixtures for the `<circle>` SVG element.
///
/// Source: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/circle
///
/// The `<circle>` SVG element is an SVG basic shape, used to draw circles based
/// on a center point and a radius.
class MdnElementCircle {
  MdnElementCircle._();

  /// Basic circle example from MDN.
  ///
  /// ```xml
  /// <svg viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
  ///   <circle cx="50" cy="50" r="50" />
  /// </svg>
  /// ```
  static const String basic = '''
<svg viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
  <circle cx="50" cy="50" r="50" />
</svg>
''';
}
