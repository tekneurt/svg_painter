import 'package:meta/meta.dart';

/// Dimension targeted by an SVG media query.
enum SvgMediaDimension { width, height }

/// Represents a parsed SVG media query for conditional styling.
@immutable
sealed class SvgMediaQuery {
  const SvgMediaQuery();

  /// Evaluates this media query for given dimensions.
  bool matches({required double width, required double height});

  /// Emits the Dart boolean condition for Flutter's `paint` method given [sizeVariable].
  String toDartCondition(String sizeVariable);

  /// Parses a CSS media query string (e.g. `(width >= 600px)`, `(min-width: 600px)`).
  static SvgMediaQuery? parse(String? raw) {
    if (raw == null) {
      return null;
    }
    final String clean = raw.trim();
    if (clean.isEmpty || clean.toLowerCase() == 'all') {
      return const SvgMediaAll();
    }

    // Strip outer parentheses
    final String unparenthesized = clean.replaceAll(RegExp(r'^\(|\)$'), '').trim();

    // Check modern range comparison syntax: width >= 600px, width <= 600px, etc.
    final rangeRegex = RegExp(r'^(width|height)\s*(>=|<=|>|<|==)\s*([0-9]+(?:\.[0-9]+)?)(?:px)?$');
    final Match? rangeMatch = rangeRegex.firstMatch(unparenthesized);
    if (rangeMatch != null) {
      final String dimension = rangeMatch.group(1)!;
      final String op = rangeMatch.group(2)!;
      final double value = double.parse(rangeMatch.group(3)!);
      return SvgMediaDimensionComparison(
        dimension: dimension == 'width' ? SvgMediaDimension.width : SvgMediaDimension.height,
        operator: op,
        value: value,
      );
    }

    // Check traditional prefix syntax: min-width: 600px, max-width: 600px, etc.
    final prefixRegex = RegExp(r'^(min|max)-(width|height)\s*:\s*([0-9]+(?:\.[0-9]+)?)(?:px)?$');
    final Match? prefixMatch = prefixRegex.firstMatch(unparenthesized);
    if (prefixMatch != null) {
      final String prefix = prefixMatch.group(1)!;
      final String dimension = prefixMatch.group(2)!;
      final double value = double.parse(prefixMatch.group(3)!);
      final op = prefix == 'min' ? '>=' : '<=';
      return SvgMediaDimensionComparison(
        dimension: dimension == 'width' ? SvgMediaDimension.width : SvgMediaDimension.height,
        operator: op,
        value: value,
      );
    }

    return null;
  }
}

/// A media query that matches all viewports unconditionally.
@immutable
final class SvgMediaAll extends SvgMediaQuery {
  const SvgMediaAll();

  @override
  bool matches({required double width, required double height}) => true;

  @override
  String toDartCondition(String sizeVariable) => 'true';

  @override
  bool operator ==(Object other) => identical(this, other) || other is SvgMediaAll;

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() => 'SvgMediaAll()';
}

/// A media query comparing a viewport dimension against a value.
@immutable
final class SvgMediaDimensionComparison extends SvgMediaQuery {
  const SvgMediaDimensionComparison({
    required this.dimension,
    required this.operator,
    required this.value,
  });

  /// The dimension (width or height) to test.
  final SvgMediaDimension dimension;

  /// The comparison operator (`>=`, `<=`, `>`, `<`, `==`).
  final String operator;

  /// The numeric value in pixels.
  final double value;

  @override
  bool matches({required double width, required double height}) {
    final dimensionValue = dimension == SvgMediaDimension.width ? width : height;
    return switch (operator) {
      '>=' => dimensionValue >= value,
      '<=' => dimensionValue <= value,
      '>' => dimensionValue > value,
      '<' => dimensionValue < value,
      '==' => dimensionValue == value,
      _ => false,
    };
  }

  @override
  String toDartCondition(String sizeVariable) {
    return '$sizeVariable.${dimension.name} $operator $value';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SvgMediaDimensionComparison &&
          runtimeType == other.runtimeType &&
          dimension == other.dimension &&
          operator == other.operator &&
          value == other.value;

  @override
  int get hashCode => Object.hash(dimension, operator, value);

  @override
  String toString() => 'SvgMediaDimensionComparison(${dimension.name} $operator $value)';
}
