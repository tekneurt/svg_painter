/// https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Attribute/href#example
const String mdnHrefAExample = '''
<svg viewBox="0 0 160 40" xmlns="http://www.w3.org/2000/svg">
  <a href="https://developer.mozilla.org/">
    <text x="10" y="25">MDN Web Docs</text>
  </a>
</svg>
''';

/// https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Attribute/href#image
///
/// Note: The original MDN example uses href="fxlogo.png".
/// In this fixture, the href is replaced with a local package asset
/// ("package:svg_painter_fixtures/assets/mdn/mdn_logo_only_color.png") so that
/// build_runner can resolve and embed the raster image bytes at compile time.
const String mdnHrefImageExample = '''
<svg viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
  <image href="package:svg_painter_fixtures/assets/mdn/mdn_logo_only_color.png" x="0" y="0" height="100" width="100" />
</svg>
''';
