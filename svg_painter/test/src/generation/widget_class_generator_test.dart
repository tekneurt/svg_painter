import 'package:svg_painter/src/generation/generator_buffer.dart';
import 'package:svg_painter/src/generation/widget_class_generator.dart';
import 'package:test/test.dart';

void main() {
  group('WidgetClassGenerator', () {
    const generator = WidgetClassGenerator();

    test('should generate a StatelessWidget when no images are present', () {
      // Arrange
      final buffer = GeneratorBuffer();

      // Act
      generator.generateWidgetClass(
        buffer: buffer,
        widgetClassName: 'MyWidget',
        painterClassName: 'MyPainter',
        activeFillProperties: {},
        activeStrokeProperties: {},
        viewBoxWidth: 100,
        viewBoxHeight: 100,
        hasCurrentColor: false,
        imageHrefs: [],
      );

      // Assert
      final output = buffer.toString();
      expect(output, contains('class MyWidget extends StatelessWidget {'));
      expect(output, contains('return CustomPaint('));
      expect(output, contains('painter: MyPainter('));
    });

    test('should generate a StatefulWidget when images are present', () {
      // Arrange
      final buffer = GeneratorBuffer();

      // Act
      generator.generateWidgetClass(
        buffer: buffer,
        widgetClassName: 'MyImgWidget',
        painterClassName: 'MyImgPainter',
        activeFillProperties: {},
        activeStrokeProperties: {},
        viewBoxWidth: 100,
        viewBoxHeight: 100,
        hasCurrentColor: false,
        imageHrefs: ['img1.png'],
      );

      // Assert
      final output = buffer.toString();
      expect(output, contains('class MyImgWidget extends StatefulWidget {'));
      expect(output, contains('class _MyImgWidgetState extends State<MyImgWidget> {'));
      expect(output, contains('void initState() {'));
      expect(output, contains('Future<void> _decodeImages() async {'));
    });
  });
}
