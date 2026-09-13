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

@SvgCodePainter(
  '''
<svg width="100" height="100">
  <title>Accessible Circle</title>
  <desc>A circle representing an accessible widget</desc>
  <circle cx="50" cy="50" r="50" fill="green" />
</svg>
''',
)
class AccessibleWidgetTest extends _$AccessibleWidgetTest {
  const AccessibleWidgetTest({super.fit});
}

void main() {
  test('CircleWidgetTest and AccessibleWidgetTest should be reachable', () {
    expect(const CircleWidgetTest(), isNotNull);
    expect(const AccessibleWidgetTest(), isNotNull);
  });

  testWidgets('Should generate a StatelessWidget wrapper', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CircleWidgetTestWidget(width: 100, height: 100),
      ),
    );
    expect(find.byType(CustomPaint), findsWidgets);
    expect(find.byType(CircleWidgetTestWidget), findsOneWidget);
    expect(
      find.descendant(
        of: find.byType(CircleWidgetTestWidget),
        matching: find.byType(Semantics),
      ),
      findsNothing,
    );
  });

  testWidgets('Should generate Semantics wrapper with label and hint from title and desc', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AccessibleWidgetTestWidget(width: 100, height: 100),
      ),
    );
    expect(find.byType(AccessibleWidgetTestWidget), findsOneWidget);
    expect(find.byType(CustomPaint), findsOneWidget);

    final Finder semanticsFinder = find.byWidgetPredicate(
      (widget) => widget is Semantics && widget.properties.label == 'Accessible Circle' && widget.properties.hint == 'A circle representing an accessible widget',
    );
    expect(semanticsFinder, findsOneWidget);
  });
}
