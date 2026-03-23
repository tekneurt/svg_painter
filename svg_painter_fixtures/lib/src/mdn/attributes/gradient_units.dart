/// MDN SVG attribute reference: gradientUnits
/// Source: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Attribute/gradientUnits
const String mdnGradientUnitsExample = r'''
<svg viewBox="0 0 420 200" xmlns="http://www.w3.org/2000/svg">
  <radialGradient id="gradient1" gradientUnits="objectBoundingBox" cx="0.5" cy="0.5" r="0.5">
    <stop offset="0%" stop-color="darkblue" />
    <stop offset="50%" stop-color="skyblue" />
    <stop offset="100%" stop-color="darkblue" />
  </radialGradient>
  
  <radialGradient id="gradient2" gradientUnits="userSpaceOnUse" cx="320" cy="100" r="100">
    <stop offset="0%" stop-color="darkblue" />
    <stop offset="50%" stop-color="skyblue" />
    <stop offset="100%" stop-color="darkblue" />
  </radialGradient>

  <rect x="0" y="0" width="200" height="200" fill="url(#gradient1)" />
  <rect x="220" y="0" width="200" height="200" fill="url(#gradient2)" />
</svg>
''';
