part of '../svg_value.dart';

/// Specifies whether or how an element is rendered.
///
/// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/display
enum SvgDisplay with SvgBaseValue {
  /// The element is rendered as an inline element.
  inline('inline'),

  /// The element is rendered as a block element.
  block('block'),

  /// The element is rendered as a list-item element.
  listItem('list-item'),

  /// The element is rendered as a run-in element.
  runIn('run-in'),

  /// The element is rendered as a compact element.
  compact('compact'),

  /// The element is rendered as a marker element.
  marker('marker'),

  /// The element is rendered as a table element.
  table('table'),

  /// The element is rendered as an inline-table element.
  inlineTable('inline-table'),

  /// The element is rendered as a table-row-group element.
  tableRowGroup('table-row-group'),

  /// The element is rendered as a table-header-group element.
  tableHeaderGroup('table-header-group'),

  /// The element is rendered as a table-footer-group element.
  tableFooterGroup('table-footer-group'),

  /// The element is rendered as a table-row element.
  tableRow('table-row'),

  /// The element is rendered as a table-column-group element.
  tableColumnGroup('table-column-group'),

  /// The element is rendered as a table-column element.
  tableColumn('table-column'),

  /// The element is rendered as a table-cell element.
  tableCell('table-cell'),

  /// The element is rendered as a table-caption element.
  tableCaption('table-caption'),

  /// The element and its children are not rendered.
  none('none'),

  /// The element's children are rendered, but the element itself is not.
  contents('contents')
  ;

  const SvgDisplay(this.value);

  /// The string value as it appears in SVG XML.
  final String value;

  /// Whether this display value causes the element to be rendered.
  bool get isRendered {
    if (this == SvgDisplay.none) {
      return false;
    } else {
      return true;
    }
  }

  /// Parses a string into an [SvgDisplay], or returns null if unknown.
  static SvgDisplay? from(String? value) {
    if (value == null) {
      return null;
    }
    final String normalized = value.trim().toLowerCase();
    for (final SvgDisplay display in SvgDisplay.values) {
      if (display.value == normalized) {
        return display;
      }
    }
    return null;
  }
}
