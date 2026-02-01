part of '../../svg_element.dart';

/// Represents a `<style>` element in SVG.
///
/// This element is primarily used for parsing and its content is
/// collected into the [SvgStyleSheet] of the [SvgRoot].
@immutable
final class SvgStyle extends SvgElement {
  const SvgStyle({super.id});

  @override
  String toString() => 'SvgStyle(id: $id)';
}
