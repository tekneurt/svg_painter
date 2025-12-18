# svg_painter_tests

This package contains the golden test suite for the `svg_painter` code generator. Its purpose is to validate that SVG files, after being transformed into Flutter `CustomPainter` code, render as expected.

## Usage

This package is not intended for direct consumption. It serves as an internal testing utility for the `svg_painter` project.

To run the golden tests:

```bash
cd svg_painter_tests
flutter test --update-goldens # To generate/update golden files
flutter test                 # To run tests against existing golden files
```

## Test Structure

Golden tests are organized to mirror the structure of the `svg_painter_fixtures` package, allowing for clear correlation between SVG examples and their visual tests. For instance, tests for MDN element examples can be found under `test/src/mdn/elements/`.