# svg_painter

[![CI](https://github.com/tekneurt/svg_painter/actions/workflows/ci.yml/badge.svg)](https://github.com/tekneurt/svg_painter/actions/workflows/ci.yml)
[![codecov](https://codecov.io/gh/tekneurt/svg_painter/branch/master/graph/badge.svg)](https://codecov.io/gh/tekneurt/svg_painter)
[![pub package](https://img.shields.io/pub/v/svg_painter.svg)](https://pub.dev/packages/svg_painter)

The code generator for the `svg_painter` library. This package is responsible for parsing SVG files and generating the corresponding Flutter `CustomPainter` code.

## Usage

This package is intended to be used as a `dev_dependency` alongside `build_runner`.

1.  Add `svg_painter` to your `dev_dependencies`.
2.  Add `svg_painter_annotation` to your `dependencies`.
3.  Annotate your classes with `@SvgPainter.file(...)` or `@SvgPainter.code(...)`.
4.  Run `dart run build_runner build`.

## Features



*   **Fast & Lightweight**: Generates optimized `CustomPainter` code with zero runtime parsing.

*   **Dynamic Properties**: Expose SVG fills and strokes as constructor arguments for runtime recoloring.

*   **Intelligent Grouping**: Automatically group shared styles into indexed properties (e.g., `fill1`, `fill2`).

*   **Semantic Renaming**: Map generic names to semantic ones (e.g., `fill1` -> `background`).

*   **Style Inheritance**: Overriding a group's property automatically propagates to all children that inherit from it.

*   **SVG Support**: Comprehensive support for shapes, paths, transforms, and gradients.



## Customizing your SVG



The power of `svg_painter` lies in its ability to turn static SVGs into customizable Flutter components.



### 1. Exposure Modes



Control which properties are exposed in the generated constructor using `SvgExposureMode`:



*   `none` (Default): The painter is static. No properties are exposed.

*   `id`: Only elements with an `id` attribute are exposed (e.g., `<circle id="eye"/>` -> `eyeFill`).

*   `indexed`: Group shared colors/styles and expose them as `fill1`, `fill2`, etc.

*   `mixed`: Expose both ID-based and indexed properties.



```dart

@SvgPainter.file('assets/logo.svg', exposureMode: SvgExposureMode.mixed)

class LogoPainter extends _$LogoPainter {}

```



### 2. Property Renaming



Use `propertyMapping` to give your properties semantic names. This is especially useful with `indexed` mode.



For a German flag (Black, Red, Gold):

```dart

@SvgPainter.code(

  germanFlagSvg,

  exposureMode: SvgExposureMode.indexed,

  propertyMapping: {

    'fill1': 'topColor',

    'fill2': 'middleColor',

    'fill3': 'bottomColor',

  },

)

class GermanFlagPainter extends _$GermanFlagPainter {}



// Usage: Turn Germany into Netherlands!

const flag = GermanFlagPainter(

  topColor: Colors.red,

  middleColor: Colors.white,

  bottomColor: Colors.blue,

);

```



### 3. Dynamic Style Inheritance



`svg_painter` respects SVG inheritance rules. If you expose a property for a group (`<g>`), overriding that property will affect all children that inherit from it.



```xml

<g id="header" fill="red">

  <circle cx="10" cy="10" r="5" /> <!-- Inherits headerFill -->

  <rect x="20" y="20" width="10" height="10" /> <!-- Inherits headerFill -->

</g>

```



```dart

@SvgPainter.code(svg, exposureMode: SvgExposureMode.id)

class MyPainter extends _$MyPainter {}



// Both the circle and rect will turn green:

const painter = MyPainter(headerFill: Colors.green);

```
