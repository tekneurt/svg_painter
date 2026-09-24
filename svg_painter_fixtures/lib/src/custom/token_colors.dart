/// Custom SVG fixture demonstrating token-based global coloring.
/// Contains elements sharing black (#000000) and red (#F44336)
/// across fills, strokes, and gradients.
const String customTokenColorsExample = r'''
<svg viewBox="0 0 120 60" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <linearGradient id="tokenGrad" x1="0" y1="0" x2="1" y2="0">
      <stop offset="0%" stop-color="#000000" />
      <stop offset="100%" stop-color="#F44336" />
    </linearGradient>
  </defs>
  <!-- Rect 1: pure black fill -->
  <rect x="5" y="5" width="30" height="50" fill="#000000" />
  <!-- Rect 2: red fill with black stroke -->
  <rect x="45" y="5" width="30" height="50" fill="#F44336" stroke="#000000" stroke-width="4" />
  <!-- Rect 3: gradient fill from black to red -->
  <rect x="85" y="5" width="30" height="50" fill="url(#tokenGrad)" />
</svg>
''';
