import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:svg_painter_annotation/svg_painter_annotation.dart';
import '../../test_utils.dart';

part 'current_color_test.g.dart';

const String currentColorSvg = '''
<svg viewBox="0 0 100 100">
  <circle cx="50" cy="50" r="40" fill="currentColor" />
</svg>
''';

@SvgCodePainter(currentColorSvg)
class CurrentColorPainter extends _$CurrentColorPainter {
  const CurrentColorPainter({super.fit, super.color});
}

void main() {
  testWidgets('Should respect currentColor override', (WidgetTester tester) async {
    const CurrentColorPainter painter = CurrentColorPainter(color: Colors.red);
    
    await testSvgPainter(
      tester: tester,
      painter: painter,
      goldenName: 'current_color_red.png',
    );
  });

  testWidgets('Should fallback to IconTheme (default black) when color is null', (WidgetTester tester) async {
    // We test the Widget, because the Painter itself doesn't know about IconTheme.
    // The Generator generates a Widget class `CurrentColorPainterWidget`.
    // Wait, I named the class `CurrentColorPainter`. So generated widget is `CurrentColorPainterWidget`.
    
    await tester.pumpWidget(
      const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: IconTheme(
          data: IconThemeData(color: Colors.blue),
          child: CurrentColorPainterWidget(width: 100, height: 100),
        ),
      ),
    );

    await expectLater(
      find.byType(CustomPaint),
      matchesGoldenFile('goldens/current_color_blue_theme.png'),
    );
  });
}
