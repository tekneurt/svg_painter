import 'package:flutter_test/flutter_test.dart';
import '../../../test_utils.dart';
import 'fill_painter.dart';

void main() {
  testWidgets('FillPainter golden test', (WidgetTester tester) async {
    await testSvgPainter(
      tester: tester,
      painter: const FillPainter(),
      goldenName: 'fill_painter.png',
    );
  });
}
