import 'package:flutter/material.dart';

void main() {
  runApp(const SvgPainterExampleApp());
}

/// Example app demonstrating svg_painter-generated CustomPainters.
class SvgPainterExampleApp extends StatelessWidget {
  /// Creates the example app.
  const SvgPainterExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SVG Painter Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const ExamplePage(),
    );
  }
}

/// Page showing generated CustomPainter widgets.
class ExamplePage extends StatelessWidget {
  /// Creates the example page.
  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SVG Painter Examples')),
      body: const Center(
        child: Text('Generated painters will appear here'),
      ),
    );
  }
}
