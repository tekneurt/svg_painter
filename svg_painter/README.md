# svg_painter

Code generator that converts SVG files to Flutter `CustomPainter` classes.

## Status

This package is under development. Full functionality coming soon.

## Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  svg_painter_annotation: ^0.0.1

dev_dependencies:
  svg_painter: ^0.0.1
  build_runner: ^2.4.0
```

## Usage

1. Annotate your class with `@SvgPainter`:

```dart
import 'package:svg_painter_annotation/svg_painter_annotation.dart';

part 'my_icon.g.dart';

@SvgPainter(filePath: 'assets/icon.svg')
class MyIcon extends _$MyIcon {}
```

2. Run the generator:

```bash
dart run build_runner build
```

3. Use the generated widget:

```dart
MyIcon(
  fillColor1: Colors.blue,
)
```

## Features (Planned)
Å
- Convert SVG files to CustomPainter code
- Support for basic shapes (circle, rect, path)
- Customizable color parameters
- Aspect ratio preservation

## See Also

- [svg_painter_annotation](https://pub.dev/packages/svg_painter_annotation) - The annotation package
