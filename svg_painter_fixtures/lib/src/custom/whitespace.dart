/// Custom SVG example to verify whitespace normalization:
/// 1. xml:space="preserve" with 10 spaces.
/// 2. xml:space="default" with newlines/tabs to be collapsed.
const String customWhitespaceExample = r'''
<svg viewBox="0 0 300 60" xmlns="http://www.w3.org/2000/svg">
  <!-- Case 1: preserve 10 spaces -->
  <text x="10" y="20" xml:space="preserve" font-family="monospace">Preserve:          (10 spaces)</text>
  
  <!-- Case 2: default collapse -->
  <text x="10" y="50" xml:space="default">Collapse:
    multiple    spaces
    and	tabs.</text>
</svg>
''';
