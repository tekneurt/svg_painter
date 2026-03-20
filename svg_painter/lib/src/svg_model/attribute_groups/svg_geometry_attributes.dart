import 'package:meta/meta.dart';

import '../svg_value.dart';

/// Represents the grouped attributes that apply specifically to geometry elements.
@immutable
final class SvgGeometryAttributes {
  const SvgGeometryAttributes({this.pathLength});

  /// The total length of the path in user units (mapped from `pathLength` attribute).
  final SvgNonNegativeNumber? pathLength;

  @override
  String toString() {
    final List<String> parts = <String>[
      if (pathLength != null) 'pathLength: $pathLength',
    ];
    return 'SvgGeometryAttributes(${parts.join(', ')})';
  }
}
