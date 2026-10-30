part of '../../svg_element.dart';

/// Base class for `<feFuncR>`, `<feFuncG>`, `<feFuncB>`, `<feFuncA>`.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/feComponentTransfer
@immutable
sealed class SvgFeFunc extends SvgElement {
  const SvgFeFunc({
    this.type = SvgComponentTransferType.identity,
    this.tableValues = const <double>[],
    this.slope = 1.0,
    this.intercept = 0.0,
    this.amplitude = 1.0,
    this.exponent = 1.0,
    this.offset = 0.0,
    super.coreAttributes,
  });

  /// The type of component transfer function.
  final SvgComponentTransferType type;

  /// The table values for table or discrete functions.
  final List<double> tableValues;

  /// The slope for linear function.
  final double slope;

  /// The intercept for linear function.
  final double intercept;

  /// The amplitude for gamma function.
  final double amplitude;

  /// The exponent for gamma function.
  final double exponent;

  /// The offset for gamma function.
  final double offset;
}

/// Represents an `<feFuncR>` element in SVG.
@immutable
final class SvgFeFuncR extends SvgFeFunc {
  const SvgFeFuncR({
    super.type,
    super.tableValues,
    super.slope,
    super.intercept,
    super.amplitude,
    super.exponent,
    super.offset,
    super.coreAttributes,
  });

  @override
  String toString() => 'SvgFeFuncR(type: $type)';
}

/// Represents an `<feFuncG>` element in SVG.
@immutable
final class SvgFeFuncG extends SvgFeFunc {
  const SvgFeFuncG({
    super.type,
    super.tableValues,
    super.slope,
    super.intercept,
    super.amplitude,
    super.exponent,
    super.offset,
    super.coreAttributes,
  });

  @override
  String toString() => 'SvgFeFuncG(type: $type)';
}

/// Represents an `<feFuncB>` element in SVG.
@immutable
final class SvgFeFuncB extends SvgFeFunc {
  const SvgFeFuncB({
    super.type,
    super.tableValues,
    super.slope,
    super.intercept,
    super.amplitude,
    super.exponent,
    super.offset,
    super.coreAttributes,
  });

  @override
  String toString() => 'SvgFeFuncB(type: $type)';
}

/// Represents an `<feFuncA>` element in SVG.
@immutable
final class SvgFeFuncA extends SvgFeFunc {
  const SvgFeFuncA({
    super.type,
    super.tableValues,
    super.slope,
    super.intercept,
    super.amplitude,
    super.exponent,
    super.offset,
    super.coreAttributes,
  });

  @override
  String toString() => 'SvgFeFuncA(type: $type)';
}
