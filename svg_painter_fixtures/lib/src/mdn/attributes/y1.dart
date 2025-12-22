/// https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Attribute/y1#elements
const String y1Elements = '''
<svg viewBox="0 0 10 10" xmlns="http://www.w3.org/2000/svg">
  <line x1="1" x2="9" y1="1" y2="5" stroke="red" />
  <line x1="1" x2="9" y1="5" y2="5" stroke="green" />
  <line x1="1" x2="9" y1="9" y2="5" stroke="blue" />
</svg>
''';

/// https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Attribute/y1#lineargradient
const String y1LinearGradient = '''
<svg viewBox="0 0 20 10" xmlns="http://www.w3.org/2000/svg">
  <!--
  By default the gradient vector start at the top left
  corner of the bounding box of the shape it is applied to.
  -->
  <linearGradient y1="0%" id="g0">
    <stop offset="5%" stop-color="black" />
    <stop offset="50%" stop-color="red" />
    <stop offset="95%" stop-color="black" />
  </linearGradient>

  <rect x="1" y="1" width="8" height="8" fill="url(#g0)" />

  <!--
  Here the gradient vector start at the bottom left
  corner of the bounding box of the shape it is applied to.
  -->
  <linearGradient y1="100%" id="g1">
    <stop offset="5%" stop-color="black" />
    <stop offset="50%" stop-color="red" />
    <stop offset="95%" stop-color="black" />
  </linearGradient>
  <rect x="11" y="1" width="8" height="8" fill="url(#g1)" />
</svg>
''';

/// https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Attribute/y1#examples
const String y1Examples = '''
<svg viewBox="0 0 25 25" xmlns="http://www.w3.org/2000/svg">
  <line x1="2" x2="22" y1="0" y2="20" stroke="red" />
  <line x1="2" x2="22" y1="10" y2="20" stroke="green" />
  <line x1="2" x2="22" y1="20" y2="20" stroke="blue" />
</svg>
''';
