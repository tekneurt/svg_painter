import 'package:meta/meta.dart';

part 'commands/draw_circle.dart';

/// A command that represents a painting operation on a canvas.
@immutable
sealed class PaintCommand {
  const PaintCommand();
}
