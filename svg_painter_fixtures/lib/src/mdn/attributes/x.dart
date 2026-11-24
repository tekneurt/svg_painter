/// https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Attribute/x#example
const String mdnXExample = '''
<svg viewBox="0 0 300 100" xmlns="http://www.w3.org/2000/svg">
  <rect x="220" y="20" width="60" height="60" fill="red" />
  <rect x="120" y="20" width="60" height="60" fill="yellow" />
  <rect x="20" y="20" width="60" height="60" fill="blue" />
</svg>
''';

/// https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Attribute/x#text
const String mdnXTextExample = '''
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
  <line x1="0" y1="90%" x2="100%" y2="90%" />

  <!-- vertical line to materialized the x positioning -->
  <line x1="25%" y1="0" x2="25%" y2="100%" />
  <line x1="50%" y1="0" x2="50%" y2="100%" />
  <line x1="75%" y1="0" x2="75%" y2="100%" />

  <!-- x with a single value -->
  <text y="40%" x="50%">SVG</text>

  <!-- x with multiple values -->
  <text y="90%" x="25%, 50%, 75%">SVG</text>
</svg>
''';

/// https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Attribute/x#tspan
const String mdnXTspanExample = '''
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
  <line x1="0" y1="90%" x2="100%" y2="90%" />

  <!-- vertical line to materialized the x positioning -->
  <line x1="25%" y1="0" x2="25%" y2="100%" />
  <line x1="50%" y1="0" x2="50%" y2="100%" />
  <line x1="75%" y1="0" x2="75%" y2="100%" />

  <text>
    <!-- x with a single value -->
    <tspan y="40%" x="50%">SVG</tspan>

    <!-- x with multiple values -->
    <tspan y="90%" x="25%, 50%, 75%">SVG</tspan>
  </text>
</svg>
''';
