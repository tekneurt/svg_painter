/// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/fill#example
const String mdnFillExample = '''
<svg viewBox="0 0 300 100" xmlns="http://www.w3.org/2000/svg">
  <!-- Basic color fill -->
  <circle cx="50" cy="50" r="40" fill="pink" />

  <!-- Fill circle with a gradient -->
  <defs>
    <radialGradient id="myGradient">
      <stop offset="0%" stop-color="pink" />
      <stop offset="100%" stop-color="black" />
    </radialGradient>
  </defs>
  <circle cx="150" cy="50" r="40" fill="url(#myGradient)" />

  <!-- Keeping the final state of an animated circle which is a circle with a radius of 40. -->
  <!-- <circle cx="250" cy="50" r="20">
    <animate attributeType="XML" attributeName="r" from="0" to="40" dur="5s" fill="freeze" />
  </circle> -->
</svg>
''';

/// https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Attribute/fill#context-fill_example
const String mdnFillContextFillExample = '''
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 300 90">
  <style>
    path {
      stroke-width: 2px;
      marker: url("#circle");
    }
  </style>

  <path d="M 20,20 h 60 v 50" stroke="black" fill="pink" />
  <path d="M 120,20 h 60 v 50" stroke="red" fill="yellow" />
  <path d="M 220,20 h 60 v 50" stroke="blue" fill="green" />

  <marker id="circle" markerWidth="12" markerHeight="12" refX="6" refY="6">
    <circle cx="6" cy="6" r="5"
            stroke="context-stroke" fill="context-fill"  />
  </marker>
</svg>
''';
