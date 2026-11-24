import 'package:meta/meta.dart';

/// Represents the grouped marker attributes of an SVG element.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/marker
@immutable
class SvgMarkerAttributes {
  const SvgMarkerAttributes({
    this.marker,
    this.markerStart,
    this.markerMid,
    this.markerEnd,
  });

  /// The marker shorthand attribute.
  final String? marker;

  /// The marker-start attribute.
  final String? markerStart;

  /// The marker-mid attribute.
  final String? markerMid;

  /// The marker-end attribute.
  final String? markerEnd;

  @override
  String toString() {
    final parts = <String>[
      if (marker != null) 'marker: $marker',
      if (markerStart != null) 'markerStart: $markerStart',
      if (markerMid != null) 'markerMid: $markerMid',
      if (markerEnd != null) 'markerEnd: $markerEnd',
    ];
    return 'SvgMarkerAttributes(${parts.join(', ')})';
  }
}
