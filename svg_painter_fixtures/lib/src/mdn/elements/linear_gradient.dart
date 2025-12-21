/// Fixture for `<linearGradient>`.
/// Source: https://developer.mozilla.org/en-US/docs/Web/SVG/Element/linearGradient
const String linearGradientExample = '''
<svg viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <linearGradient id="myGradient" gradientTransform="rotate(90)">
      <stop offset="5%" stop-color="gold" />
      <stop offset="95%" stop-color="red" />
    </linearGradient>
  </defs>

  <!-- using my linear gradient -->
  <circle cx="50" cy="50" r="50" fill="url('#myGradient')" />
</svg>
''';
