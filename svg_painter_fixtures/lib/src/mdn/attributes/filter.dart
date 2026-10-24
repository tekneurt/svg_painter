/// MDN example for the `filter` attribute.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Attribute/filter
const String mdnFilterExample = '''
<svg viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
  <!-- Define a filter effect -->
  <filter id="blur">
    <feGaussianBlur stdDeviation="2" />
  </filter>

  <!-- Apply the filter using the filter attribute -->
  <rect x="10" y="10" width="80" height="80" filter="url(#blur)" />
</svg>
''';
