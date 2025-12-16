# svg_painter_annotation

This package provides the annotations used by `svg_painter` to generate `CustomPainter` code from SVG files or code.

## Usage

Use the `@SvgPainter` annotation to mark a class for code generation.

### From File

Annotate a class with `@SvgPainter.file` to generate a painter from an SVG file in your asset bundle or package.

```dart
@SvgPainter.file('assets/my_icon.svg')
class MyIconPainter extends _$MyIconPainter {}
```

### From Code

Annotate a class with `@SvgPainter.code` to generate a painter directly from an SVG string.

```dart
@SvgPainter.code('<svg>...</svg>')
class MyInlinePainter extends _$MyInlinePainter {}
```

## Features

*   **Type-Safe**: Generates a dedicated `CustomPainter` subclass.
*   **Compile-Time**: No runtime XML parsing overhead.