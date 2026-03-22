/// MDN SVG element reference: tspan
/// Source: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/tspan
const String mdnTspanExample = r'''
<svg viewBox="0 0 240 40" xmlns="http://www.w3.org/2000/svg">
  <style>
    text {
      font: italic 12px serif;
    }
    tspan {
      font: bold 10px sans-serif;
      fill: red;
    }
  </style>

  <text x="10" y="30">You are <tspan>not</tspan> a banana!</text>
</svg>
''';
