/// Fixture for `<radialGradient>`.
/// Source: https://developer.mozilla.org/en-US/docs/Web/SVG/Element/radialGradient
const String radialGradientExample = '''
<svg viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <radialGradient id="myGradient">
      <stop offset="10%" stop-color="gold" />
      <stop offset="95%" stop-color="red" />
    </radialGradient>
  </defs>

  <!-- using my linear gradient -->
  <circle cx="50" cy="50" r="50" fill="url('#myGradient')" />
</svg>
''';
