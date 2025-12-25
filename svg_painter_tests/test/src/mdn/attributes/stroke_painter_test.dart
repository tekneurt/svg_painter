import 'package:flutter_test/flutter_test.dart';
import '../../../test_utils.dart';
import 'stroke_painter.dart';

void main() {
  testWidgets('StrokePainter golden test', (WidgetTester tester) async {
    await testSvgPainter(
      tester: tester,
      painter: const StrokePainter(),
      goldenName: 'stroke_painter.png',
    );
  });
}
