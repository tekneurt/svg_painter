import 'package:meta/meta.dart';

part 'commands/draw_circle.dart';
part 'commands/draw_line.dart';
part 'commands/draw_oval.dart';
part 'commands/draw_rect.dart';
part 'commands/define_radial_gradient.dart';
part 'commands/define_linear_gradient.dart';

/// A command that represents a painting operation on a canvas.
@immutable
sealed class PaintCommand {
  const PaintCommand();
}
