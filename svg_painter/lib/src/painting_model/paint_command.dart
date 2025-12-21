import 'package:meta/meta.dart';

part 'commands/draw_circle.dart';
part 'commands/draw_oval.dart';

/// A command that represents a painting operation on a canvas.
@immutable
sealed class PaintCommand {
  const PaintCommand();
}
