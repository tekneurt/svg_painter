/// MDN example for the `<filter>` element.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/filter
const String mdnFilterElementExample = '''
<svg width="230" height="120" xmlns="http://www.w3.org/2000/svg">
  <!-- Define the filter -->
  <filter id="blurMe">
    <feGaussianBlur stdDeviation="5" />
  </filter>

  <!-- Unfiltered element -->
  <circle cx="60" cy="60" r="50" fill="green" />

  <!-- Filter applied via attribute -->
  <circle cx="170" cy="60" r="50" fill="green" filter="url(#blurMe)" />
</svg>
''';
