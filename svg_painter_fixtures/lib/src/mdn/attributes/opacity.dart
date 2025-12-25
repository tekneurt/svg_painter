/// Fixture for `opacity` attribute.
/// Source: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/opacity
const String mdnOpacityAttribute = '''
<svg viewBox="0 0 200 100" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <linearGradient id="gradient" x1="0%" y1="0%" x2="0" y2="100%">
      <stop offset="0%" stop-color="skyblue" />
      <stop offset="100%" stop-color="seagreen" />
    </linearGradient>
  </defs>
  <rect x="0" y="0" width="100%" height="100%" fill="url(#gradient)" />
  <circle cx="50" cy="50" r="40" fill="black" />
  <circle cx="150" cy="50" r="40" fill="black" opacity="0.3" />
</svg>
''';
