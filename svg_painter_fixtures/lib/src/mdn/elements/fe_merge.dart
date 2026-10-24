/// MDN example for the `<feMerge>` and `<feMergeNode>` elements.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/feMerge
const String mdnFeMergeExample = '''
<svg width="200" height="200" xmlns="http://www.w3.org/2000/svg">
  <filter id="feOffset" x="-40" y="-20" width="100" height="200">
    <!-- Offset the graphic -->
    <feOffset in="SourceGraphic" dx="60" dy="60" />
    <!-- Apply a blur and save it as "blur2" -->
    <feGaussianBlur in="SourceGraphic" stdDeviation="5" result="blur2" />
    
    <!-- Merge the layers together -->
    <feMerge>
      <feMergeNode in="blur2" />
      <feMergeNode in="SourceGraphic" />
    </feMerge>
  </filter>

  <rect x="40" y="40" width="100" height="100" stroke="black" fill="green" filter="url(#feOffset)" />
</svg>
''';
