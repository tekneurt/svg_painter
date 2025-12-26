import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../test_utils.dart';
import 'example_circle01_painter.dart';
import 'example_ellipse01_painter.dart';
import 'example_line01_painter.dart';
import 'example_polygon01_painter.dart';
import 'example_polyline01_painter.dart';
import 'example_rect01_painter.dart';
import 'example_rect02_painter.dart';

final List<({CustomPainter painter, String name})> _fixtures = <({
  CustomPainter painter,
  String name
})>[
  (
    painter: const ExampleCircle01Painter(),
    name: 'w3c_svg11_example_circle01',
  ),
  (
    painter: const ExampleEllipse01Painter(),
    name: 'w3c_svg11_example_ellipse01',
  ),
  (
    painter: const ExampleLine01Painter(),
    name: 'w3c_svg11_example_line01',
  ),
  (
    painter: const ExamplePolygon01Painter(),
    name: 'w3c_svg11_example_polygon01',
  ),
  (
    painter: const ExamplePolyline01Painter(),
    name: 'w3c_svg11_example_polyline01',
  ),
  (
    painter: const ExampleRect01Painter(),
    name: 'w3c_svg11_example_rect01',
  ),
  (
    painter: const ExampleRect02Painter(),
    name: 'w3c_svg11_example_rect02',
  ),
];

void main() {
  group('W3C SVG 1.1 Shapes', () {
    for (final ({CustomPainter painter, String name}) fixture in _fixtures) {
      testWidgets(fixture.name, (WidgetTester tester) async {
        await testDualResolutionPainter(
          tester: tester,
          painter: fixture.painter,
          name: fixture.name,
          type: SvgTestType.w3c,
        );
      });
    }
  });
}
