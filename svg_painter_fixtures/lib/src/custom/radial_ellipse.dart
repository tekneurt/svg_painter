/// Custom SVG to verify elliptical radial gradients in objectBoundingBox mode.
/// A wide rectangle (200x100) should show an elliptical gradient stretching to the corners.
const String customRadialEllipseExample = r'''
<svg viewBox="0 0 200 100" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <radialGradient id="grad" gradientUnits="objectBoundingBox" cx="0.5" cy="0.5" r="0.5">
      <stop offset="0%" stop-color="red" />
      <stop offset="100%" stop-color="blue" />
    </radialGradient>
  </defs>
  <rect x="0" y="0" width="200" height="100" fill="url(#grad)" />
</svg>
''';
