import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:svg_painter_annotation/svg_painter_annotation.dart';
import 'package:svg_painter_fixtures/svg_painter_fixtures.dart';

part 'widget_generation_test.g.dart';

@SvgCodePainter(
  mdnCircleExample,
)
class CircleWidgetTest extends _$CircleWidgetTest {
  const CircleWidgetTest({super.fit});
}

// We expect a class named `CircleWidgetTestWidget` (or similar naming convention?)
// If the painter is `CircleWidgetTest`, the widget should probably be `CircleWidgetTestWidget`.
// Or maybe the annotation defines the widget name?
// For now, let's assume it generates `CircleWidgetTestWidget`.

void main() {
  test('CircleWidgetTest should be reachable', () {
    expect(const CircleWidgetTest(), isNotNull);
  });

  testWidgets('Should generate a StatelessWidget wrapper', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CircleWidgetTestWidget(width: 100, height: 100),
      ),
    );
    expect(find.byType(CustomPaint), findsOneWidget);
    expect(find.byType(CircleWidgetTestWidget), findsOneWidget);
  });
}
