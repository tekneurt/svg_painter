part of '../../svg_element.dart';

/// Mixin for elements that support marker presentation attributes.
mixin SvgMarkerAttributable on SvgElement {
  /// Marker-related presentation attributes.
  SvgMarkerAttributes? get markerAttributes;

  /// The reference to a marker element at the start vertex.
  String? get markerStart => markerAttributes?.markerStart ?? markerAttributes?.marker;

  /// The reference to a marker element at middle vertices.
  String? get markerMid => markerAttributes?.markerMid ?? markerAttributes?.marker;

  /// The reference to a marker element at the end vertex.
  String? get markerEnd => markerAttributes?.markerEnd ?? markerAttributes?.marker;
}
