/// https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Attribute/y#example
const String mdnYExample = '''
<svg viewBox="0 0 100 300" xmlns="http://www.w3.org/2000/svg">
  <rect y="220" x="20" width="60" height="60" fill="red" />
  <rect y="120" x="20" width="60" height="60" fill="yellow" />
  <rect y="20" x="20" width="60" height="60" fill="purple" />
</svg>
''';

/// https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Attribute/y#text
const String mdnYTextExample = '''
<svg viewBox="0 0 200 100" xmlns="http://www.w3.org/2000/svg">
  <style>
    text {
      font: 40px sans-serif;
    }

    line {
      fill: none;
      stroke: red;
      stroke-width: 0.5px;
      stroke-dasharray: 2px;
    }
  </style>

  <!-- horizontal line to materialized the text base line -->
  <line x1="0" y1="40%" x2="100%" y2="40%" />
  <line x1="0" y1="60%" x2="100%" y2="60%" />
  <line x1="0" y1="80%" x2="100%" y2="80%" />

  <!-- vertical line to materialized the x positioning -->
  <line x1="5%" y1="0" x2="5%" y2="100%" />
  <line x1="55%" y1="0" x2="55%" y2="100%" />

  <!-- y with a single value -->
  <text y="40%" x="5%">SVG</text>

  <!-- y with multiple values -->
  <text y="40%,60%,80%" x="55%">SVG</text>
</svg>
''';

/// https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Attribute/y#tspan
const String mdnYTspanExample = '''
<svg viewBox="0 0 200 100" xmlns="http://www.w3.org/2000/svg">
  <style>
    text {
      font: 40px sans-serif;
    }

    line {
      fill: none;
      stroke: red;
      stroke-width: 0.5px;
      stroke-dasharray: 2px;
    }
  </style>

  <!-- horizontal line to materialized the text base line -->
  <line x1="0" y1="40%" x2="100%" y2="40%" />
  <line x1="0" y1="60%" x2="100%" y2="60%" />
  <line x1="0" y1="80%" x2="100%" y2="80%" />

  <!-- vertical line to materialized the x positioning -->
  <line x1="5%" y1="0" x2="5%" y2="100%" />
  <line x1="55%" y1="0" x2="55%" y2="100%" />

  <text>
    <!-- y with a single value -->
    <tspan y="40%" x="5%">SVG</tspan>

    <!-- y with multiple values -->
    <tspan y="40%,60%,80%" x="55%">SVG</tspan>
  </text>
</svg>
''';
