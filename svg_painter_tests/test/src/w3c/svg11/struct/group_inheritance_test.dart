import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../../test_utils.dart';
import 'group_inheritance_painter.dart';

void main() {
  setUpAll(() async {
    await loadTestFonts();
  });

  group('Group Inheritance', () {
    testWidgets('Should render default colors correctly', (WidgetTester tester) async {
      // Group 1: Red. Group 2: Blue.
      const painter = GroupInheritancePainter();
      
      await testSvgPainter(
        tester: tester,
        painter: painter,
        goldenName: 'group_inheritance_default.png',
        size: const Size(200, 200),
      );
    });

    testWidgets('Should override Group 1 (Red) -> Green', (WidgetTester tester) async {
      // Top rects should become Green. Bottom rects (Blue) should stay Blue.
      const painter = GroupInheritancePainter(
        group1Fill: Colors.green,
      );
      
      await testSvgPainter(
        tester: tester,
        painter: painter,
        goldenName: 'group_inheritance_g1_green.png',
        size: const Size(200, 200),
      );
    });

    testWidgets('Should override Group 2 (Blue) -> Yellow', (WidgetTester tester) async {
      // Top rects (Red) stay Red. Bottom rects become Yellow.
      const painter = GroupInheritancePainter(
        group2Fill: Colors.yellow,
      );
      
      await testSvgPainter(
        tester: tester,
        painter: painter,
        goldenName: 'group_inheritance_g2_yellow.png',
        size: const Size(200, 200),
      );
    });
  });
}
