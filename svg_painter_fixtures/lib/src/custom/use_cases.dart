/// Custom SVG example to verify the three methods of referencing with <use>:
/// 1. Local ID reference (href="#id")
/// 2. Legacy XLink reference (xlink:href="#id")
/// 3. Reference to a rendered (visible) element
const String customUseCasesExample = r'''
<svg viewBox="0 0 300 100" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
  <defs>
    <!-- Template circle for case 1 -->
    <circle id="blueCircle" cx="0" cy="0" r="20" fill="blue" />
    
    <!-- Template square for case 2 -->
    <rect id="redSquare" x="-20" y="-20" width="40" height="40" fill="red" />
  </defs>

  <!-- Case 3 target: visible yellow ellipse -->
  <ellipse id="yellowEllipse" cx="250" cy="50" rx="30" ry="20" fill="yellow" />

  <!-- Case 1: Local ID reference -->
  <use href="#blueCircle" x="50" y="50" />

  <!-- Case 2: Legacy XLink reference -->
  <use xlink:href="#redSquare" x="150" y="50" />

  <!-- Case 3: Reference to already rendered element -->
  <use href="#yellowEllipse" x="-200" y="0" opacity="0.5" />
</svg>
''';
