/// https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Attribute/dy#example
const String mdnDyExample = '''
<svg viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
  <!-- Lines materialized the position of the glyphs -->
  <line x1="10%" x2="10%" y1="0" y2="100%" />
  <line x1="0" x2="100%" y1="30%" y2="30%" />
  <line x1="0" x2="100%" y1="80%" y2="80%" />

  <!-- Some reference text -->
  <text x="10%" y="30%" fill="grey">SVG</text>

  <!-- The same text with a shift along the y-axis -->
  <text dy="50%" x="10%" y="30%">SVG</text>
  <style>
    line {
      stroke: red;
      stroke-width: 0.5px;
      stroke-dasharray: 3px;
    }
  </style>
</svg>
''';
