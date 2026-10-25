/// MDN SVG attribute reference: offset (gradient stop)
/// Source: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Attribute/offset#gradient_stop_offset
const String mdnOffsetGradientStopExample = '''
<svg viewBox="0 0 20 10" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <linearGradient id="linear-gradient">
      <stop offset="6%" stop-color="black" />
      <stop offset="70%" stop-color="grey" />
    </linearGradient>
    <radialGradient id="radial-gradient">
      <stop offset="0%" stop-color="gold" />
      <stop offset="95%" stop-color="grey" />
    </radialGradient>
  </defs>
  <circle cx="5" cy="5" r="4" fill="url('#linear-gradient')" />
  <circle cx="15" cy="5" r="4" fill="url('#radial-gradient')" />
</svg>
''';

/// Default alias for backwards compatibility.
const String mdnOffsetExample = mdnOffsetGradientStopExample;

/// MDN SVG attribute reference: offset (component transfer)
/// Source: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Attribute/offset#component_transfer_offset
const String mdnOffsetComponentTransferExample = '''
<svg viewBox="0 0 200 40" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <filter id="gamma-filter">
      <feComponentTransfer>
        <feFuncR type="gamma" amplitude="2" exponent="3" offset="0.2" />
        <feFuncG type="gamma" amplitude="2" exponent="3" offset="0.3" />
        <feFuncB type="gamma" amplitude="2" exponent="3" offset="0.5" />
      </feComponentTransfer>
    </filter>
  </defs>
  <text x="60" y="25" filter="url(#gamma-filter)">GammaFunc</text>
</svg>
''';
