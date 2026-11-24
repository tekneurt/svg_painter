part of '../../svg_value.dart';

/// Enumeration of CSS 2 / SVG 1.1 system color keywords.
///
/// See: https://www.w3.org/TR/SVG11/types.html#DataTypeColor
/// and https://www.w3.org/TR/CSS2/ui.html#system-colors
enum SvgSystemColorName {
  activeborder,
  activecaption,
  appworkspace,
  background,
  buttonface,
  buttonhighlight,
  buttonshadow,
  buttontext,
  captiontext,
  graytext,
  highlight,
  highlighttext,
  inactiveborder,
  inactivecaption,
  inactivecaptiontext,
  infobackground,
  infotext,
  menu,
  menutext,
  scrollbar,
  threeddarkshadow,
  threedface,
  threedhighlight,
  threedlightshadow,
  threedshadow,
  window,
  windowframe,
  windowtext
  ;

  /// Parses a string into an [SvgSystemColorName].
  static SvgSystemColorName? fromName(String name) {
    try {
      return SvgSystemColorName.values.byName(name.toLowerCase());
    } catch (_) {
      return null;
    }
  }
}
