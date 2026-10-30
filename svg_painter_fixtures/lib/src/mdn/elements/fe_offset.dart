/// MDN example for the `<feOffset>` element.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/feOffset
const String mdnFeOffsetExample = '''
<svg width="200" height="200" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <filter id="offset" width="180" height="180" filterUnits="userSpaceOnUse">
      <feOffset in="SourceGraphic" dx="60" dy="60" />
    </filter>
  </defs>

  <!-- Original graphic -->
  <rect x="0" y="0" width="100" height="100" stroke="black" fill="green" />

  <!-- Offset filtered graphic -->
  <rect x="0" y="0" width="100" height="100" stroke="black" fill="green" filter="url(#offset)" />
</svg>
''';
