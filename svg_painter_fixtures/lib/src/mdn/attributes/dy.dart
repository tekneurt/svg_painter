/// MDN SVG attribute reference: dy example 1
/// Source: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Attribute/dy#example
const String mdnDyExample1 = '''
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

/// MDN SVG attribute reference: dy example 2 (text)
/// Source: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Attribute/dy#example_2
const String mdnDyExample2 = '''
<svg viewBox="0 0 150 100" xmlns="http://www.w3.org/2000/svg">
  <!-- Horizontal lines -->
  <line x1="0" x2="100%" y1="30" y2="30" />
  <line x1="0" x2="100%" y1="40" y2="40" />
  <line x1="0" x2="100%" y1="50" y2="50" />
  <line x1="0" x2="100%" y1="60" y2="60" />

  <!-- Vertical lines -->
  <line x1="10" x2="10" y1="0" y2="100%" />
  <line x1="50" x2="50" y1="0" y2="100%" />
  <line x1="90" x2="90" y1="0" y2="100%" />

  <!-- Behaviors change based on the number of values in the attributes -->
  <text dy="20" x="10" y="30">SVG</text>
  <text dy="0 10" x="50" y="30">SVG</text>
  <text dy="0 10 20" x="90" y="30">SVG</text>
  <style>
    line {
      stroke: red;
      stroke-width: 0.5px;
      stroke-dasharray: 3px;
    }
  </style>
</svg>
''';

/// Legacy alias for the first example
const String mdnDyExample = mdnDyExample1;
