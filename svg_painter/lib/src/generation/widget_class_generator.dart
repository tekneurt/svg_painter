import 'generator_buffer.dart';

/// Helper class to generate the convenience Widget class for an SVG.
class WidgetClassGenerator {
  const WidgetClassGenerator();

  /// Generates the Widget class code.
  void generateWidgetClass({
    required GeneratorBuffer buffer,
    required String widgetClassName,
    required String painterClassName,
    required Map<String, String> activeFillProperties,
    required Map<String, String> activeStrokeProperties,
    required double viewBoxWidth,
    required double viewBoxHeight,
    required bool hasCurrentColor,
    required List<String> imageHrefs,
  }) {
    if (imageHrefs.isEmpty) {
      buffer.writeBlock('class $widgetClassName extends StatelessWidget {', () {
        buffer.writeBlock('const $widgetClassName({', () {
          buffer.writeln('super.key,');
          buffer.writeln('this.width,');
          buffer.writeln('this.height,');
          buffer.writeln('this.fit = BoxFit.contain,');
          buffer.writeln('this.alignment = Alignment.center,');
          if (hasCurrentColor) {
            buffer.writeln('this.color,');
          }

          final allProps = <String>{
            ...activeFillProperties.values,
            ...activeStrokeProperties.values,
          };
          for (final prop in allProps) {
            buffer.writeln('this.$prop,');
          }
        }, footer: '});');
        buffer.writeln();
        buffer.writeln('final double? width;');
        buffer.writeln('final double? height;');
        buffer.writeln('final BoxFit fit;');
        buffer.writeln('final AlignmentGeometry alignment;');
        if (hasCurrentColor) {
          buffer.writeln('final Color? color;');
        }

        final allProps = <String>{
          ...activeFillProperties.values,
          ...activeStrokeProperties.values,
        };
        for (final prop in allProps) {
          buffer.writeln('final Object? $prop;');
        }

        buffer.writeln();
        buffer.writeln('@override');
        buffer.writeBlock('Widget build(BuildContext context) {', () {
          buffer.writeBlock('return CustomPaint(', () {
            buffer.writeln('size: Size(width ?? $viewBoxWidth, height ?? $viewBoxHeight),');
            buffer.writeBlock('painter: $painterClassName(', () {
              buffer.writeln('fit: fit,');
              if (hasCurrentColor) {
                buffer.writeln('color: color ?? IconTheme.of(context).color,');
              }
              for (final prop in allProps) {
                buffer.writeln('$prop: $prop,');
              }
            }, footer: '),');
          }, footer: ');');
        });
      });
    } else {
      // Generate StatefulWidget for async image decoding
      buffer.writeBlock('class $widgetClassName extends StatefulWidget {', () {
        buffer.writeBlock('const $widgetClassName({', () {
          buffer.writeln('super.key,');
          buffer.writeln('this.width,');
          buffer.writeln('this.height,');
          buffer.writeln('this.fit = BoxFit.contain,');
          buffer.writeln('this.alignment = Alignment.center,');
          if (hasCurrentColor) {
            buffer.writeln('this.color,');
          }

          final allProps = <String>{
            ...activeFillProperties.values,
            ...activeStrokeProperties.values,
          };
          for (final prop in allProps) {
            buffer.writeln('this.$prop,');
          }
        }, footer: '});');
        buffer.writeln();
        buffer.writeln('final double? width;');
        buffer.writeln('final double? height;');
        buffer.writeln('final BoxFit fit;');
        buffer.writeln('final AlignmentGeometry alignment;');
        if (hasCurrentColor) {
          buffer.writeln('final Color? color;');
        }

        final allProps = <String>{
          ...activeFillProperties.values,
          ...activeStrokeProperties.values,
        };
        for (final prop in allProps) {
          buffer.writeln('final Object? $prop;');
        }

        buffer.writeln();
        buffer.writeln('@override');
        buffer.writeln('State<$widgetClassName> createState() => _${widgetClassName}State();');
      });

      buffer.writeln();
      buffer.writeBlock('class _${widgetClassName}State extends State<$widgetClassName> {', () {
        for (var i = 0; i < imageHrefs.length; i++) {
          buffer.writeln('ui.Image? _image$i;');
        }
        buffer.writeln();
        buffer.writeln('@override');
        buffer.writeBlock('void initState() {', () {
          buffer.writeln('super.initState();');
          buffer.writeln('_decodeImages();');
        });
        buffer.writeln();
        buffer.writeBlock('Future<void> _decodeImages() async {', () {
          buffer.writeBlock('final images = await Future.wait([', () {
            for (var i = 0; i < imageHrefs.length; i++) {
              buffer.writeln(
                'ui.instantiateImageCodec(Uint8List.fromList(_imageBytes_${painterClassName}_$i)).then((ui.Codec codec) => codec.getNextFrame()).then((ui.FrameInfo fi) => fi.image),',
              );
            }
          }, footer: ']);');
          buffer.writeBlock('if (mounted) {', () {
            buffer.writeBlock('setState(() {', () {
              for (var i = 0; i < imageHrefs.length; i++) {
                buffer.writeln('_image$i = images[$i];');
              }
            }, footer: '});');
          });
        });
        buffer.writeln();
        buffer.writeln('@override');
        buffer.writeBlock('Widget build(BuildContext context) {', () {
          buffer.writeBlock('return CustomPaint(', () {
            buffer.writeln(
              'size: Size(widget.width ?? $viewBoxWidth, widget.height ?? $viewBoxHeight),',
            );
            buffer.writeBlock('painter: $painterClassName(', () {
              buffer.writeln('fit: widget.fit,');
              if (hasCurrentColor) {
                buffer.writeln('color: widget.color ?? IconTheme.of(context).color,');
              }
              final allProps = <String>{
                ...activeFillProperties.values,
                ...activeStrokeProperties.values,
              };
              for (final prop in allProps) {
                buffer.writeln('$prop: widget.$prop,');
              }
              for (var i = 0; i < imageHrefs.length; i++) {
                buffer.writeln('image$i: _image$i,');
              }
            }, footer: '),');
          }, footer: ');');
        });
      });
    }
  }
}
