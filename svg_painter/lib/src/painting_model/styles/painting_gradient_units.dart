part of 'painting_style.dart';

/// Enumeration of possible values for gradient coordinate units in the painting model.
enum PaintingGradientUnits {
  /// Coordinates are relative to the bounding box of the element (0.0 to 1.0).
  objectBoundingBox,

  /// Coordinates are in the user coordinate system.
  userSpaceOnUse;
}

/// Enumeration of possible values for gradient spread methods in the painting model.
enum PaintingSpreadMethod {
  /// The first and last colors of the gradient are extended to fill the remaining area.
  pad,

  /// The gradient is mirrored and repeated.
  reflect,

  /// The gradient is repeated from the beginning.
  repeat;
}
