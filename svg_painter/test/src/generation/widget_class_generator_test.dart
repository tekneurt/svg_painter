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
      expect(output, isNot(contains('Semantics(')));
    });

    test('should wrap CustomPaint with Semantics when semanticLabel is provided for StatelessWidget', () {
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
        semanticLabel: 'My Label',
      );

      // Assert
      final output = buffer.toString();
      expect(output, contains("return Semantics(\n      label: 'My Label',\n      child: CustomPaint("));
      expect(output, isNot(contains('hint:')));
    });

    test('should wrap CustomPaint with Semantics when semanticHint is provided for StatelessWidget', () {
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
        semanticHint: 'My Hint',
      );

      // Assert
      final output = buffer.toString();
      expect(output, contains("return Semantics(\n      hint: 'My Hint',\n      child: CustomPaint("));
      expect(output, isNot(contains('label:')));
    });

    test('should wrap CustomPaint with Semantics when both semanticLabel and semanticHint are provided for StatelessWidget', () {
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
        semanticLabel: r"Title's $value",
        semanticHint: 'Description line\n2',
      );

      // Assert
      final output = buffer.toString();
      expect(output, contains(r"label: 'Title\'s \$value'"));
      expect(output, contains(r"hint: 'Description line\n2'"));
      expect(output, contains('child: CustomPaint('));
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
      expect(output, contains('return CustomPaint('));
      expect(output, isNot(contains('Semantics(')));
    });

    test('should wrap CustomPaint with Semantics when semanticLabel and hint are provided for StatefulWidget', () {
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
        semanticLabel: 'Image Label',
        semanticHint: 'Image Hint',
      );

      // Assert
      final output = buffer.toString();
      expect(output, contains("return Semantics(\n      label: 'Image Label',\n      hint: 'Image Hint',\n      child: CustomPaint("));
    });
  });
}
