/// https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Attribute/width#examples
const String widthExample = '''
<svg viewBox="0 0 100 300" xmlns="http://www.w3.org/2000/svg">
  <!-- With a width of 0 or less, nothing will be rendered -->
  <rect
    x="0"
    y="0"
    width="0"
    height="90"
    fill="red"
    stroke-width="5"
    stroke="black" />
  <rect
    x="0"
    y="100"
    width="60"
    height="90"
    fill="red"
    stroke-width="5"
    stroke="black" />
  <rect
    x="0"
    y="200"
    width="100%"
    height="90"
    fill="red"
    stroke-width="5"
    stroke="black" />
</svg>
''';
