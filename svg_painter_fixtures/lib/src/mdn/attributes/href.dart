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

/// https://developer.mozilla.org/en-US/docs/Web/API/SVGGradientElement/href#accessing_the_href_property
const String mdnHrefLinearGradientExample = '''
<svg xmlns="http://www.w3.org/2000/svg" width="200" height="200">
  <defs>
    <linearGradient id="gradient1">
      <stop offset="0%" stop-color="red" />
      <stop offset="100%" stop-color="blue" />
    </linearGradient>
    <linearGradient id="gradient2" href="#gradient1" />
  </defs>
  <rect x="10" y="10" width="180" height="180" fill="url(#gradient2)" />
</svg>
''';
