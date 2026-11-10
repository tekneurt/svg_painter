import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../test_utils.dart';
import 'flutter_logo_painter.dart';

class _FlutterSvgFixture {
  const _FlutterSvgFixture({
    required this.painter,
    required this.name,
    this.canvasSize,
    required this.maxDiffPercent,
  });

  final CustomPainter painter;
  final String name;
  final Size? canvasSize;
  final double maxDiffPercent;
}

final List<_FlutterSvgFixture> _fixtures = <_FlutterSvgFixture>[
  const _FlutterSvgFixture(
    painter: FlutterLogoPainter(),
    name: 'flutter_logo',
    canvasSize: Size(800.0, 600.0),
    maxDiffPercent: 0.05,
  ),
];

void main() {
  group('flutter_svg Test Suite', () {
    for (final _FlutterSvgFixture fixture in _fixtures) {
      testWidgets('should render and match flutter_svg reference for ${fixture.name}', (
        WidgetTester tester,
      ) async {
        // Arrange & Act & Assert
        await testSvgPainterWithFlutterSvgDiff(
          tester: tester,
          painter: fixture.painter,
          testName: fixture.name,
          canvasSize: fixture.canvasSize,
          maxDiffPercent: fixture.maxDiffPercent,
        );
      });
    }
  });
}
