/// Orientation for resolving percentages.
enum SvgOrientation {
  /// Horizontal orientation (resolved against width).
  horizontal,

  /// Vertical orientation (resolved against height).
  vertical,

  /// Normalized orientation (resolved against diagonal).
  normalized,

  /// Unit orientation (100% = 1.0). Used for opacity.
  unit,
}
