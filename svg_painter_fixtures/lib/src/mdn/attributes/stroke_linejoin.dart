/// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/stroke-linejoin#example
const String mdnStrokeLinejoinExample = '''
<svg viewBox="0 0 18 12" xmlns="http://www.w3.org/2000/svg">
  <!-- Upper left path: Effect of the "miter" value -->
  <path
    d="M1,5 a2,2 0,0,0 2,-3 a3,3 0 0 1 2,3.5"
    stroke="black"
    fill="none"
    stroke-linejoin="miter" />

  <!-- Center path: Effect of the "round" value -->
  <path
    d="M7,5 a2,2 0,0,0 2,-3 a3,3 0 0 1 2,3.5"
    stroke="black"
    fill="none"
    stroke-linejoin="round" />

  <!-- Upper right path: Effect of the "bevel" value -->
  <path
    d="M13,5 a2,2 0,0,0 2,-3 a3,3 0 0 1 2,3.5"
    stroke="black"
    fill="none"
    stroke-linejoin="bevel" />

  <!-- Bottom left path: Effect of the "miter-clip" value with fallback to "miter" if not supported. -->
  <path
    d="M3,11 a2,2 0,0,0 2,-3 a3,3 0 0 1 2,3.5"
    stroke="black"
    fill="none"
    stroke-linejoin="miter-clip" />

  <!-- Bottom right path: Effect of the "arcs" value with fallback to "miter" if not supported. -->
  <path
    d="M9,11 a2,2 0,0,0 2,-3 a3,3 0 0 1 2,3.5"
    stroke="black"
    fill="none"
    stroke-linejoin="arcs" />

  <!-- the following pink lines highlight the position of the path for each stroke -->
  <g id="highlight">
    <path
      d="M1,5 a2,2 0,0,0 2,-3 a3,3 0 0 1 2,3.5"
      stroke="pink"
      fill="none"
      stroke-width="0.05" />
    <circle cx="1" cy="5" r="0.1" fill="pink" />
    <circle cx="3" cy="2" r="0.1" fill="pink" />
    <circle cx="5" cy="5.5" r="0.1" fill="pink" />
  </g>
  <use href="#highlight" x="6" />
  <use href="#highlight" x="12" />
  <use href="#highlight" x="2" y="6" />
  <use href="#highlight" x="8" y="6" />
</svg>
''';
