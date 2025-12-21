/// https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Attribute/cy
const String cyExample = '''
<svg viewBox="0 0 100 300" xmlns="http://www.w3.org/2000/svg">
  <radialGradient cy="25%" id="myGradient">
    <stop offset="0" stop-color="white" />
    <stop offset="100%" stop-color="black" />
  </radialGradient>

  <circle cx="50" cy="50" r="45" />
  <ellipse cx="50" cy="150" rx="25" ry="45" />
  <rect x="5" y="205" width="90" height="90" fill="url(#myGradient)" />
</svg>
''';