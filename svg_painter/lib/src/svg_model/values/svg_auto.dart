part of '../svg_value.dart';

/// Represents the 'auto' keyword.
@immutable
final class SvgAuto extends SvgLengthPercentageAuto {
  const SvgAuto();

  @override
  String toString() => 'auto';
}
