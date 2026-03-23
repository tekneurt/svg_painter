/// MDN SVG attribute reference: spreadMethod example 1 (linearGradient)
/// Source: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Attribute/spreadMethod#example
const String mdnSpreadMethodExample1 = r'''
<svg width="220" height="150" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <linearGradient id="PadGradient" x1="33%" x2="67%">
      <stop offset="0%" stop-color="fuchsia" />
      <stop offset="100%" stop-color="orange" />
    </linearGradient>
    <linearGradient
      id="ReflectGradient"
      spreadMethod="reflect"
      x1="33%"
      x2="67%">
      <stop offset="0%" stop-color="fuchsia" />
      <stop offset="100%" stop-color="orange" />
    </linearGradient>
    <linearGradient id="RepeatGradient" spreadMethod="repeat" x1="33%" x2="67%">
      <stop offset="0%" stop-color="fuchsia" />
      <stop offset="100%" stop-color="orange" />
    </linearGradient>
  </defs>

  <rect fill="url(#PadGradient)" x="10" y="0" width="200" height="40" />
  <rect fill="url(#ReflectGradient)" x="10" y="50" width="200" height="40" />
  <rect fill="url(#RepeatGradient)" x="10" y="100" width="200" height="40" />
</svg>
''';

/// MDN SVG attribute reference: spreadMethod example 2 (radialGradient)
/// Source: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Attribute/spreadMethod#example_2
const String mdnSpreadMethodExample2 = r'''
<svg width="340" height="120" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <radialGradient
      id="RadialPadGradient"
      cx="75%"
      cy="25%"
      r="33%"
      fx="64%"
      fy="18%"
      fr="17%">
      <stop offset="0%" stop-color="fuchsia" />
      <stop offset="100%" stop-color="orange" />
    </radialGradient>
    <radialGradient
      id="RadialReflectGradient"
      spreadMethod="reflect"
      cx="75%"
      cy="25%"
      r="33%"
      fx="64%"
      fy="18%"
      fr="17%">
      <stop offset="0%" stop-color="fuchsia" />
      <stop offset="100%" stop-color="orange" />
    </radialGradient>
    <radialGradient
      id="RadialRepeatGradient"
      spreadMethod="repeat"
      cx="75%"
      cy="25%"
      r="33%"
      fx="64%"
      fy="18%"
      fr="17%">
      <stop offset="0%" stop-color="fuchsia" />
      <stop offset="100%" stop-color="orange" />
    </radialGradient>
  </defs>

  <rect fill="url(#RadialPadGradient)" x="10" y="10" width="100" height="100" />
  <rect
    fill="url(#RadialReflectGradient)"
    x="120"
    y="10"
    width="100"
    height="100" />
  <rect
    fill="url(#RadialRepeatGradient)"
    x="230"
    y="10"
    width="100"
    height="100" />
</svg>
''';
