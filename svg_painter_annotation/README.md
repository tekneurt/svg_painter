# svg_painter_annotation

Annotations for the [svg_painter](https://pub.dev/packages/svg_painter) code generator.

This package provides the `@SvgPainter` annotation used to generate Flutter `CustomPainter` classes from SVG files.

## Usage

Add both packages to your `pubspec.yaml`:

```yaml
dependencies:
  svg_painter_annotation: ^0.0.1

dev_dependencies:
  svg_painter: ^0.0.1
  build_runner: ^2.4.0
```

Annotate your class:

```dart
import 'package:svg_painter_annotation/svg_painter_annotation.dart';

part 'my_icon.g.dart';

@SvgPainter(filePath: 'assets/icon.svg')
class MyIcon extends _$MyIcon {}
```

Run the generator:

```bash
dart run build_runner build
```

## Parameters

- `filePath` - Path to an SVG file relative to the annotated file
- `code` - Inline SVG content as a string

Exactly one of these must be provided.

## See Also

- [svg_painter](https://pub.dev/packages/svg_painter) - The code generator package
