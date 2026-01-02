/// https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Attribute/stroke-linejoin#example
const String mdnStrokeLinejoinExample = r'''
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

/// https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Attribute/stroke-linejoin#arcs
const String mdnStrokeLinejoinArcsExample = r'''
<svg viewBox="0 0 6 6" xmlns="http://www.w3.org/2000/svg">
  <!-- Effect of the "arcs" value -->
  <path
    d="M1,5 a2,2 0,0,0 2,-3 a3,3 0 0 1 2,3"
    stroke="black"
    fill="none"
    stroke-linejoin="arcs" />

  <!--
  the following pink lines highlight the
  position of the path for each stroke
  -->
  <g id="p">
    <path
      d="M1,5 a2,2 0,0,0 2,-3 a3,3 0 0 1 2,3"
      stroke="pink"
      fill="none"
      stroke-width="0.025" />
    <circle cx="1" cy="5" r="0.05" fill="pink" />
    <circle cx="3" cy="2" r="0.05" fill="pink" />
    <circle cx="5" cy="5" r="0.05" fill="pink" />
  </g>
</svg>
''';

/// https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Attribute/stroke-linejoin#bevel
const String mdnStrokeLinejoinBevelExample = r'''
<svg viewBox="0 0 6 6" xmlns="http://www.w3.org/2000/svg">
  <!-- Effect of the "bevel" value -->
  <path
    d="M1,5 l2,-3 l2,3"
    stroke="black"
    fill="none"
    stroke-linejoin="bevel" />

  <!--
  the following pink lines highlight the
  position of the path for each stroke
  -->
  <g id="p">
    <path d="M1,5 l2,-3 l2,3" stroke="pink" fill="none" stroke-width="0.025" />
    <circle cx="1" cy="5" r="0.05" fill="pink" />
    <circle cx="3" cy="2" r="0.05" fill="pink" />
    <circle cx="5" cy="5" r="0.05" fill="pink" />
  </g>
</svg>
''';

/// https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Attribute/stroke-linejoin#miter
const String mdnStrokeLinejoinMiterExample = r'''
<svg viewBox="0 -1 10 7" xmlns="http://www.w3.org/2000/svg">
  <!-- Effect of the "miter" value -->
  <path
    d="M1,5 l2,-3 l2,3"
    stroke="black"
    fill="none"
    stroke-linejoin="miter" />

  <!-- Effect of the "miter" value on a sharp angle
       where de default miter limit is exceeded -->
  <path
    d="M7,5 l0.75,-3 l0.75,3"
    stroke="black"
    fill="none"
    stroke-linejoin="miter" />

  <!-- the following red dotted line show where
       the miter value falls back to the bevel value -->
  <path
    d="M0,0 h10"
    stroke="red"
    stroke-dasharray="0.05"
    stroke-width="0.025" />

  <!-- the following pink lines highlight the position of the path for each stroke -->
  <g>
    <path d="M1,5 l2,-3 l2,3" stroke="pink" fill="none" stroke-width="0.025" />
    <circle cx="1" cy="5" r="0.05" fill="pink" />
    <circle cx="3" cy="2" r="0.05" fill="pink" />
    <circle cx="5" cy="5" r="0.05" fill="pink" />

    <path
      d="M7,5 l0.75,-3 l0.75,3"
      stroke="pink"
      fill="none"
      stroke-width="0.025" />
    <circle cx="7" cy="5" r="0.05" fill="pink" />
    <circle cx="7.75" cy="2" r="0.05" fill="pink" />
    <circle cx="8.5" cy="5" r="0.05" fill="pink" />
  </g>
</svg>
''';

/// https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Attribute/stroke-linejoin#miter-clip
const String mdnStrokeLinejoinMiterClipExample = r'''
<svg viewBox="0 -1 10 7" xmlns="http://www.w3.org/2000/svg">
  <!-- Effect of the "miter-clip" value -->
  <path
    d="M1,5 l2,-3 l2,3"
    stroke="black"
    fill="none"
    stroke-linejoin="miter-clip" />

  <!-- Effect of the "miter-clip" value on a sharp angle
       where de default miter limit is exceeded -->
  <path
    d="M7,5 l0.75,-3 l0.75,3"
    stroke="black"
    fill="none"
    stroke-linejoin="miter-clip" />

  <!-- the following red dotted line show where the clip should happen -->
  <path
    d="M0,0 h10"
    stroke="red"
    stroke-dasharray="0.05"
    stroke-width="0.025" />

  <!-- the following pink lines highlight the position of the path for each stroke -->
  <g>
    <path d="M1,5 l2,-3 l2,3" stroke="pink" fill="none" stroke-width="0.025" />
    <circle cx="1" cy="5" r="0.05" fill="pink" />
    <circle cx="3" cy="2" r="0.05" fill="pink" />
    <circle cx="5" cy="5" r="0.05" fill="pink" />

    <path
      d="M7,5 l0.75,-3 l0.75,3"
      stroke="pink"
      fill="none"
      stroke-width="0.025" />
    <circle cx="7" cy="5" r="0.05" fill="pink" />
    <circle cx="7.75" cy="2" r="0.05" fill="pink" />
    <circle cx="8.5" cy="5" r="0.05" fill="pink" />
  </g>
</svg>
''';

/// https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Attribute/stroke-linejoin#round
const String mdnStrokeLinejoinRoundExample = r'''
<svg viewBox="0 0 6 6" xmlns="http://www.w3.org/2000/svg">
  <!-- Effect of the "round" value -->
  <path
    d="M1,5 l2,-3 l2,3"
    stroke="black"
    fill="none"
    stroke-linejoin="round" />

  <!--
  the following pink lines highlight the
  position of the path for each stroke
  -->
  <g id="p">
    <path d="M1,5 l2,-3 l2,3" stroke="pink" fill="none" stroke-width="0.025" />
    <circle cx="1" cy="5" r="0.05" fill="pink" />
    <circle cx="3" cy="2" r="0.05" fill="pink" />
    <circle cx="5" cy="5" r="0.05" fill="pink" />
  </g>
</svg>
''';
