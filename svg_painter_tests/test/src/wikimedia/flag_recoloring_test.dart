import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:svg_painter_fixtures/svg_painter_fixtures.dart';
import '../../test_utils.dart';
import 'french_flag_painter.dart';
import 'german_flag_painter.dart';

void main() {
  setUpAll(() async {
    await loadTestFonts();
  });

  group('Flag Recoloring', () {
    testWidgets('German Flag - Default (Black, Red, Gold)', (WidgetTester tester) async {
      const GermanFlagPainter painter = GermanFlagPainter();
      
      await testSvgPainter(
        tester: tester,
        painter: painter,
        goldenName: 'flag_germany_default.png',
        size: const Size(500, 300),
      );
    });

    testWidgets('German Flag -> Dutch Flag (Red, White, Blue)', (WidgetTester tester) async {
      const GermanFlagPainter painter = GermanFlagPainter(
        topColor: Color(0xFFAE1C28),    // Dutch Red
        middleColor: Colors.white,      // Dutch White
        bottomColor: Color(0xFF21468B), // Dutch Blue
      );
      
      await testSvgPainter(
        tester: tester,
        painter: painter,
        goldenName: 'flag_germany_to_netherlands.png',
        size: const Size(500, 300),
      );
    });

    testWidgets('French Flag - Default (Blue, White, Red)', (WidgetTester tester) async {
      const FrenchFlagPainter painter = FrenchFlagPainter();
      
      await testSvgPainter(
        tester: tester,
        painter: painter,
        goldenName: 'flag_france_default.png',
        size: const Size(450, 300),
      );
    });

    testWidgets('French Flag -> Belgium Flag (Black, Yellow, Red)', (WidgetTester tester) async {
      const FrenchFlagPainter painter = FrenchFlagPainter(
        leftColor: Colors.black,        // Belgium Black
        middleColor: Color(0xFFFFCE00), // Belgium Yellow
        rightColor: Color(0xFFEF4135),  // Belgium Red
      );
      
      await testSvgPainter(
        tester: tester,
        painter: painter,
        goldenName: 'flag_france_to_belgium.png',
        size: const Size(450, 300),
      );
    });
  });
}