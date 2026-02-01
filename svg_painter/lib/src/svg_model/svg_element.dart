import 'package:meta/meta.dart';

import 'attributes/svg_stroke_attributes.dart';
import 'svg_style_sheet.dart';
import 'svg_value.dart';

// Base
part 'elements/base/svg_definition_element.dart';
part 'elements/base/svg_geometry.dart';
part 'elements/base/svg_graphics_element.dart';
part 'elements/base/svg_metadata_element.dart';
part 'elements/base/svg_parent.dart';

// Containers
part 'elements/containers/svg_container_element.dart';
part 'elements/containers/svg_defs.dart';
part 'elements/containers/svg_group.dart';
part 'elements/containers/svg_svg.dart';
part 'elements/containers/svg_use.dart';

// Geometry
part 'elements/geometry/svg_basic_shape.dart';
part 'elements/geometry/svg_circle.dart';
part 'elements/geometry/svg_ellipse.dart';
part 'elements/geometry/svg_line.dart';
part 'elements/geometry/svg_path.dart';
part 'elements/geometry/svg_polygon.dart';
part 'elements/geometry/svg_polyline.dart';
part 'elements/geometry/svg_rect.dart';

// Metadata
part 'elements/metadata/svg_desc.dart';
part 'elements/metadata/svg_title.dart';

// Paint Servers
part 'elements/paint_servers/svg_gradient.dart';
part 'elements/paint_servers/svg_linear_gradient.dart';
part 'elements/paint_servers/svg_radial_gradient.dart';
part 'elements/paint_servers/svg_stop.dart';

// Style
part 'elements/style/svg_style.dart';

// Text
part 'elements/text/svg_text.dart';

/// The base class for all SVG elements in the domain model.
@immutable
sealed class SvgElement {
  const SvgElement({this.id});

  /// The unique identifier of the element.
  final String? id;
}
