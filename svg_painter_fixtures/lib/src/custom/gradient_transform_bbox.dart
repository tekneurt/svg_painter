/// Custom SVG to verify objectBoundingBox gradient transformations on an offset element.
/// The rect is at x="50", y="50" with width="100", height="100" in a 200x200 viewBox.
/// The linearGradient uses objectBoundingBox (default) with gradientTransform="rotate(90)".
/// It should rotate vertically within the bounds of the offset rect.
const String customGradientTransformBboxExample = r'''
<svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <linearGradient id="rotGrad" gradientTransform="rotate(90)">
      <stop offset="0%" stop-color="#FF0000" />
      <stop offset="100%" stop-color="#0000FF" />
    </linearGradient>
  </defs>
  <rect x="50" y="50" width="100" height="100" fill="url(#rotGrad)" />
</svg>
''';
