import '../../svg_model/_svg_model.dart';

/// Maps [SvgSystemColorName] to ARGB integer representing standard classic
/// desktop UI colors as defined in CSS 2 / SVG 1.1 and matching W3C reference renderings.
const Map<SvgSystemColorName, int> svgSystemColorMap = <SvgSystemColorName, int>{
  SvgSystemColorName.activeborder: 0xFFC4C4C4,
  SvgSystemColorName.activecaption: 0xFF000080,
  SvgSystemColorName.appworkspace: 0xFF005C5C,
  SvgSystemColorName.background: 0xFF005C5C,
  SvgSystemColorName.buttonface: 0xFFDFDFDF,
  SvgSystemColorName.buttonhighlight: 0xFFFFFFFF,
  SvgSystemColorName.buttonshadow: 0xFF808080,
  SvgSystemColorName.buttontext: 0xFF000000,
  SvgSystemColorName.captiontext: 0xFF000000,
  SvgSystemColorName.graytext: 0xFF808080,
  SvgSystemColorName.highlight: 0xFF000080,
  SvgSystemColorName.highlighttext: 0xFFC4C4C4,
  SvgSystemColorName.inactiveborder: 0xFFC4C4C4,
  SvgSystemColorName.inactivecaption: 0xFF808080,
  SvgSystemColorName.inactivecaptiontext: 0xFFC0C0C0,
  SvgSystemColorName.infobackground: 0xFFFFFFE1,
  SvgSystemColorName.infotext: 0xFF000000,
  SvgSystemColorName.menu: 0xFFC4C4C4,
  SvgSystemColorName.menutext: 0xFF000000,
  SvgSystemColorName.scrollbar: 0xFFDFDFDF,
  SvgSystemColorName.threeddarkshadow: 0xFF4A4A4A,
  SvgSystemColorName.threedface: 0xFFDFDFDF,
  SvgSystemColorName.threedhighlight: 0xFFFFFFFF,
  SvgSystemColorName.threedlightshadow: 0xFFFFFFFF,
  SvgSystemColorName.threedshadow: 0xFF808080,
  SvgSystemColorName.window: 0xFFDFDFDF,
  SvgSystemColorName.windowframe: 0xFFC4C4C4,
  SvgSystemColorName.windowtext: 0xFF000000,
};
