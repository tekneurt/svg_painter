/// https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/linearGradient#basic_linear_gradient
const String mdnLinearGradient1Example = r'''
<svg viewBox="0 0 10 10" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
  <defs>
    <linearGradient id="myGradient" gradientTransform="rotate(90)">
      <stop offset="5%" stop-color="gold" />
      <stop offset="95%" stop-color="red" />
    </linearGradient>
  </defs>

  <!-- using my linear gradient -->
  <circle cx="5" cy="5" r="4" fill="url('#myGradient')" />
</svg>
''';

/// https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/linearGradient#repeating_angled_gradient
const String mdnLinearGradient2Example = r'''
<svg viewBox="0 0 500 500" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
  <defs>
    <linearGradient id="grad" x1="0" y1="0" x2="20" y2="20" spreadMethod="repeat" gradientUnits="userSpaceOnUse">
      <stop offset="50%" stop-color="red" />
      <stop offset="50%" stop-color="gold" />
    </linearGradient>
  </defs>

  <rect width="100%" height="25%" fill="url(#grad)" />
  <rect width="100%" height="65%" fill="url(#grad)" y="30%" />
</svg>
''';
