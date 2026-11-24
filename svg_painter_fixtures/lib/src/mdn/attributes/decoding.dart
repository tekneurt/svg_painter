/// MDN SVG attribute reference: decoding example
/// Source: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Attribute/decoding#example
///
/// Note: The original MDN example uses href="https://example.com/mdn_logo_dark.png".
/// In this fixture, the href is replaced with a local package asset
/// ("package:svg_painter_fixtures/assets/mdn/mdn_logo_only_color.png") so that
/// build_runner can resolve and embed the raster image bytes at compile time.
const String mdnDecodingExample = '''
<svg width="200" height="200" xmlns="http://www.w3.org/2000/svg">
  <image
    href="package:svg_painter_fixtures/assets/mdn/mdn_logo_only_color.png"
    height="200"
    width="200"
    decoding="async" />
</svg>
''';
