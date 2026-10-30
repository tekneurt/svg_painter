/// MDN SVG attribute reference: dx example 1
/// Source: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Attribute/dx#example
const String mdnDxExample1 = '''
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

/// MDN SVG attribute reference: dx example 2 (text)
/// Source: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Attribute/dx#example_2
const String mdnDxExample2 = '''
<svg viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
  <!-- Lines materialized the position of the glyphs -->
  <line x1="0" x2="100%" y1="25%" y2="25%" />
  <line x1="0" x2="100%" y1="50%" y2="50%" />
  <line x1="0" x2="100%" y1="75%" y2="75%" />

  <line x1="10%" x2="10%" y1="0" y2="100%" />
  <line x1="30%" x2="30%" y1="0" y2="100%" />
  <line x1="60%" x2="60%" y1="0" y2="100%" />

  <!-- Behaviors change based on the number
       of values in the attributes -->
  <text dx="20%" x="10%" y="25%">SVG</text>
  <text dx="0 10%" x="10%" y="50%">SVG</text>
  <text dx="0 10% 20%" x="10%" y="75%">SVG</text>
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
const String mdnDxExample = mdnDxExample1;
