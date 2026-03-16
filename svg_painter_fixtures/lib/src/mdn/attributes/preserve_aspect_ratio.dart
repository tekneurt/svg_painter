/// https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Attribute/preserveAspectRatio

const String _smileyStyle = '''
  <style>
    path {
      fill: yellow;
      stroke: black;
      stroke-width: 8px;
      stroke-linecap: round;
      stroke-linejoin: round;
    }
  </style>
''';

const String mdnPreserveAspectRatioExample1 = '''
<svg viewBox="-1 -1 202 40" xmlns="http://www.w3.org/2000/svg">
$_smileyStyle
  <defs>
    <path id="smiley" d="M50,10 A40,40,1,1,1,50,90 A40,40,1,1,1,50,10 M30,40 Q36,35,42,40 M58,40 Q64,35,70,40 M30,60 Q50,75,70,60 Q50,75,30,60" />
  </defs>
  <rect x="0" y="0" width="60" height="30">
    <title>xMidYMid meet</title>
  </rect>
  <svg viewBox="0 0 100 100" width="60" height="30" preserveAspectRatio="xMidYMid meet" x="0" y="0">
    <use href="#smiley" />
  </svg>
  <rect x="70" y="0" width="60" height="30">
    <title>xMinYMid meet</title>
  </rect>
  <svg viewBox="0 0 100 100" width="60" height="30" preserveAspectRatio="xMinYMid meet" x="70" y="0">
    <use href="#smiley" />
  </svg>
  <rect x="140" y="0" width="60" height="30">
    <title>xMaxYMid meet</title>
  </rect>
  <svg viewBox="0 0 100 100" width="60" height="30" preserveAspectRatio="xMaxYMid meet" x="140" y="0">
    <use href="#smiley" />
  </svg>
</svg>
''';

const String mdnPreserveAspectRatioExample2 = '''
<svg viewBox="-1 -1 202 57" xmlns="http://www.w3.org/2000/svg">
$_smileyStyle
  <defs>
    <path id="smiley" d="M50,10 A40,40,1,1,1,50,90 A40,40,1,1,1,50,10 M30,40 Q36,35,42,40 M58,40 Q64,35,70,40 M30,60 Q50,75,70,60 Q50,75,30,60" />
  </defs>
  <rect x="0" y="15" width="60" height="30">
    <title>xMidYMin slice</title>
  </rect>
  <svg viewBox="0 0 100 100" width="60" height="30" preserveAspectRatio="xMidYMin slice" x="0" y="15">
    <use href="#smiley" />
  </svg>
  <rect x="70" y="15" width="60" height="30">
    <title>xMidYMid slice</title>
  </rect>
  <svg viewBox="0 0 100 100" width="60" height="30" preserveAspectRatio="xMidYMid slice" x="70" y="15">
    <use href="#smiley" />
  </svg>
  <rect x="140" y="15" width="60" height="30">
    <title>xMidYMax slice</title>
  </rect>
  <svg viewBox="0 0 100 100" width="60" height="30" preserveAspectRatio="xMidYMax slice" x="140" y="15">
    <use href="#smiley" />
  </svg>
</svg>
''';

const String mdnPreserveAspectRatioExample3 = '''
<svg viewBox="-1 -1 202 80" xmlns="http://www.w3.org/2000/svg">
$_smileyStyle
  <defs>
    <path id="smiley" d="M50,10 A40,40,1,1,1,50,90 A40,40,1,1,1,50,10 M30,40 Q36,35,42,40 M58,40 Q64,35,70,40 M30,60 Q50,75,70,60 Q50,75,30,60" />
  </defs>
  <rect x="0" y="0" width="30" height="75">
    <title>xMidYMin meet</title>
  </rect>
  <svg viewBox="0 0 100 100" width="30" height="75" preserveAspectRatio="xMidYMin meet" x="0" y="0">
    <use href="#smiley" />
  </svg>
  <rect x="35" y="0" width="30" height="75">
    <title>xMidYMid meet</title>
  </rect>
  <svg viewBox="0 0 100 100" width="30" height="75" preserveAspectRatio="xMidYMid meet" x="35" y="0">
    <use href="#smiley" />
  </svg>
  <rect x="70" y="0" width="30" height="75">
    <title>xMidYMax meet</title>
  </rect>
  <svg viewBox="0 0 100 100" width="30" height="75" preserveAspectRatio="xMidYMax meet" x="70" y="0">
    <use href="#smiley" />
  </svg>
</svg>
''';

const String mdnPreserveAspectRatioExample4 = '''
<svg viewBox="-1 -1 202 80" xmlns="http://www.w3.org/2000/svg">
$_smileyStyle
  <defs>
    <path id="smiley" d="M50,10 A40,40,1,1,1,50,90 A40,40,1,1,1,50,10 M30,40 Q36,35,42,40 M58,40 Q64,35,70,40 M30,60 Q50,75,70,60 Q50,75,30,60" />
  </defs>
  <rect x="0" y="0" width="30" height="75">
    <title>xMinYMid slice</title>
  </rect>
  <svg viewBox="0 0 100 100" width="30" height="75" preserveAspectRatio="xMinYMid slice" x="0" y="0">
    <use href="#smiley" />
  </svg>
  <rect x="35" y="0" width="30" height="75">
    <title>xMidYMid slice</title>
  </rect>
  <svg viewBox="0 0 100 100" width="30" height="75" preserveAspectRatio="xMidYMid slice" x="35" y="0">
    <use href="#smiley" />
  </svg>
  <rect x="70" y="0" width="30" height="75">
    <title>xMaxYMid slice</title>
  </rect>
  <svg viewBox="0 0 100 100" width="30" height="75" preserveAspectRatio="xMaxYMid slice" x="70" y="0">
    <use href="#smiley" />
  </svg>
</svg>
''';

const String mdnPreserveAspectRatioExample5 = '''
<svg viewBox="-1 -1 192 62" xmlns="http://www.w3.org/2000/svg">
$_smileyStyle
  <defs>
    <path id="smiley" d="M50,10 A40,40,1,1,1,50,90 A40,40,1,1,1,50,10 M30,40 Q36,35,42,40 M58,40 Q64,35,70,40 M30,60 Q50,75,70,60 Q50,75,30,60" />
  </defs>
  <!-- none -->
  <rect x="0" y="0" width="160" height="60">
    <title>none</title>
  </rect>
  <svg viewBox="0 0 100 100" width="160" height="60" preserveAspectRatio="none" x="0" y="0">
    <use href="#smiley" />
  </svg>
</svg>
''';
