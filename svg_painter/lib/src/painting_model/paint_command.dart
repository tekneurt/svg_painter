import 'package:meta/meta.dart';

import '../svg_model/_svg_model.dart';
import 'styles/painting_style.dart';

part 'commands/draw_circle.dart';
part 'commands/draw_group.dart';
part 'commands/draw_image.dart';
part 'commands/draw_line.dart';
part 'commands/draw_oval.dart';
part 'commands/draw_path.dart';
part 'commands/draw_polygon.dart';
part 'commands/draw_polyline.dart';
part 'commands/draw_rect.dart';
part 'commands/draw_text.dart';
part 'commands/define_gradient.dart';
part 'commands/define_radial_gradient.dart';
part 'commands/define_linear_gradient.dart';

/// A command that represents a painting operation on a canvas.
@immutable
sealed class PaintCommand {
  const PaintCommand({this.id});

  /// The unique identifier of the source SVG element, if any.
  final String? id;
}

/// Base class for commands that produce visual output (shapes, text, groups).
@immutable
sealed class DrawCommand extends PaintCommand {
  const DrawCommand({super.id});

  /// The visual style of this command.
  PaintingStyle get style;
}

/// Base class for commands that define resources (gradients, etc.).
@immutable
sealed class DefineCommand extends PaintCommand {
  const DefineCommand({super.id});
}
