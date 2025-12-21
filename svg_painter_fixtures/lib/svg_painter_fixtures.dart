/// Fixtures for testing `svg_painter`.
library svg_painter_fixtures;

export 'src/mdn/attributes/cx.dart';
export 'src/mdn/attributes/cy.dart';
export 'src/mdn/attributes/r.dart';
export 'src/mdn/attributes/rx.dart';
export 'src/mdn/attributes/ry.dart';
export 'src/mdn/attributes/stroke_width.dart';
export 'src/mdn/elements/circle.dart';
export 'src/mdn/elements/ellipse.dart';
export 'src/mdn/elements/linear_gradient.dart';
export 'src/mdn/elements/radial_gradient.dart';
export 'src/mdn/elements/rect.dart';

/// Path to the IO test file SVG (used for file-loading tests).
const String ioTestFileSvgPath = 'package:svg_painter_fixtures/src/io/test_file.svg';
