/// https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Attribute/x2#elements
const String x2Elements = '''
<svg viewBox="0 0 10 10" xmlns="http://www.w3.org/2000/svg">
  <line x1="5" x2="1" y1="1" y2="9" stroke="red" />
  <line x1="5" x2="5" y1="1" y2="9" stroke="green" />
  <line x1="5" x2="9" y1="1" y2="9" stroke="blue" />
</svg>
''';

/// https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Attribute/x2#lineargradient
const String x2LinearGradient = '''
<svg viewBox="0 0 20 10" xmlns="http://www.w3.org/2000/svg">
  <!-- By default the gradient vector end at the right bounding limit of the shape it is applied to -->
  <linearGradient x2="100%" id="g0">
    <stop offset="0" stop-color="black" />
    <stop offset="100%" stop-color="red" />
  </linearGradient>
  <rect x="1" y="1" width="8" height="8" fill="url(#g0)" />
  <!-- Here the gradient vector start at 20% of the left bounding limit of the shape it is applied to -->
  <linearGradient x2="20%" id="g1">
    <stop offset="0" stop-color="black" />
    <stop offset="100%" stop-color="red" />
  </linearGradient>
  <rect x="11" y="1" width="8" height="8" fill="url(#g1)" />
</svg>
''';

/// https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Attribute/x2#examples
const String x2Examples = '''
<svg viewBox="0 0 25 25" xmlns="http://www.w3.org/2000/svg">
  <line x1="2" x2="2" y1="5" y2="20" stroke="red" />
  <line x1="2" x2="12" y1="5" y2="20" stroke="green" />
  <line x1="2" x2="22" y1="5" y2="20" stroke="blue" />
</svg>
''';
