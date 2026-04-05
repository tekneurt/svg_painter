import '../../painting_model/_painting_model.dart';
import '../_generation.dart';

/// Generator for [DrawImage] commands.
class ImageGenerator extends CommandGenerator<DrawImage> {
  const ImageGenerator();

  @override
  void generate(
    DrawImage command,
    GeneratorBuffer buffer, {
    Map<Type, CommandGenerator<PaintCommand>>? generators,
    PaletteResult? palette,
    Map<String, String>? activeFillProperties,
    Map<String, String>? activeStrokeProperties,
    String? painterClassName,
    Set<String>? gradientsNeedingStretch,
    List<InheritedProperty>? inheritedFills,
    List<InheritedProperty>? inheritedStrokes,
  }) {
    // Note: We use a private field name based on the ID or a hash of the bytes
    // to store the bytes in the generated class.
    // However, for simplicity in this MVP of <image>, we will assume the bytes
    // are passed via a helper or constant.
    
    // For now, let's just generate the drawing code.
    // The actual byte storage should be handled by SvgPainterGenerator.
    
    // Draw the image using the corresponding field from the painter.
    final imageProp = 'image${command.imageIndex}';
    buffer.writeBlock('if ($imageProp != null) {', () {
      buffer.writeln('final double srcW = $imageProp!.width.toDouble();');
      buffer.writeln('final double srcH = $imageProp!.height.toDouble();');
      if (command.style.groupOpacity < 1.0) {
        buffer.writeln('final Paint paint = Paint()..color = const Color(0xFF000000).withOpacity(${command.style.groupOpacity});');
      } else {
        buffer.writeln('final Paint paint = Paint();');
      }
      buffer.writeln(
          'canvas.drawImageRect($imageProp!, Rect.fromLTWH(0, 0, srcW, srcH), Rect.fromLTWH(${command.x}, ${command.y}, ${command.width}, ${command.height}), paint);');
    });
  }
}
