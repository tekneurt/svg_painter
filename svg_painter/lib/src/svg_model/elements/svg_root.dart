part of '../svg_element.dart';

/// Represents the root <svg> element.
@immutable
final class SvgRoot extends SvgElement {
  const SvgRoot({required this.children});

  /// The child elements contained within this SVG.
  final List<SvgElement> children;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SvgRoot &&
          runtimeType == other.runtimeType &&
          _listEquals(children, other.children));

  @override
  int get hashCode => Object.hashAll(children);

  @override
  String toString() => 'SvgRoot(children: $children)';
}

bool _listEquals<T>(List<T>? a, List<T>? b) {
  if (a == null) {
    return b == null;
  }
  if (b == null || a.length != b.length) {
    return false;
  }
  for (int i = 0; i < a.length; i++) {
    if (a[i] != b[i]) {
      return false;
    }
  }
  return true;
}
