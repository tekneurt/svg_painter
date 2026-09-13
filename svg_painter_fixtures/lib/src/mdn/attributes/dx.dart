/// https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Attribute/dx#example
const String mdnDxExample = '''
<svg viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
  <!-- Lines materialized the position of the glyphs -->
  <line x1="0" x2="100%" y1="50%" y2="50%" />
  <line x1="10%" x2="10%" y1="0" y2="100%" />
  <line x1="60%" x2="60%" y1="0" y2="100%" />

  <!-- Some reference text -->
  <text x="10%" y="50%" fill="grey">SVG</text>

  <!-- The same text with a shift along the x-axis -->
  <text dx="50%" x="10%" y="50%">SVG</text>
  <style>
    line {
      stroke: red;
      stroke-width: 0.5px;
      stroke-dasharray: 3px;
    }
  </style>
</svg>
''';
