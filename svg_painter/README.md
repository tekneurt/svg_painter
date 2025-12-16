# svg_painter

The code generator for the `svg_painter` library. This package is responsible for parsing SVG files and generating the corresponding Flutter `CustomPainter` code.

## Usage

This package is intended to be used as a `dev_dependency` alongside `build_runner`.

1.  Add `svg_painter` to your `dev_dependencies`.
2.  Add `svg_painter_annotation` to your `dependencies`.
3.  Annotate your classes with `@SvgPainter.file(...)` or `@SvgPainter.code(...)`.
4.  Run `dart run build_runner build`.

## Features

*   Parses SVG XML.
*   Generates optimized `CustomPainter` code.
*   Supports `<circle>` (Milestone 1).