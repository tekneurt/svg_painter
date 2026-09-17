# svg_painter

[![CI](https://github.com/tekneurt/svg_painter/actions/workflows/ci.yml/badge.svg)](https://github.com/tekneurt/svg_painter/actions/workflows/ci.yml)
[![codecov](https://codecov.io/gh/tekneurt/svg_painter/branch/master/graph/badge.svg)](https://codecov.io/gh/tekneurt/svg_painter)
[![pub package](https://img.shields.io/pub/v/svg_painter.svg)](https://pub.dev/packages/svg_painter)

A high-performance SVG-to-Flutter code generator. Compiles SVG assets into optimized `CustomPainter` and `StatelessWidget` code at build time with **zero runtime XML parsing**.

---

## Highlights

* **Zero Runtime Overhead**: SVGs are parsed and compiled into pure Dart/Flutter Canvas drawing commands at build time.
* **Automatic Widget Generation**: Generates ready-to-use `StatelessWidget` wrappers with full `BoxFit` and `AlignmentGeometry` support.
* **Built-in Accessibility**: Automatically maps SVG `<title>` and `<desc>` elements into Flutter's `Semantics` widget for screen readers.
* **Dynamic Recoloring & Styling**: Expose fills, strokes, and `currentColor` as type-safe constructor parameters for runtime theming.
* **Rich SVG Spec Compliance**: Full support for `<clipPath>`, `<mask>`, `<image>` (base64 and asset URIs), `<use>`, `<symbol>`, gradients, dashed strokes, `vector-effect="non-scaling-stroke"`, and `<text>` / `<tspan>`.
* **Font Management**: Bundled standard font resolution (`Roboto`, `Noto Serif`, `Roboto Mono`) with an automatic `AssetExporter` CLI.

---

## Installation

Add `svg_painter_annotation` to your `dependencies`, and `svg_painter` and `build_runner` to your `dev_dependencies`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  svg_painter_annotation: ^0.4.0

dev_dependencies:
  build_runner: ^2.4.0
  svg_painter: ^0.4.0
```

---

## Quick Start

### 1. Annotate Your Class

You can generate painters from external SVG files or inline SVG strings:

#### From SVG File

```dart
import 'package:flutter/material.dart';
import 'package:svg_painter_annotation/svg_painter_annotation.dart';

part 'heart_icon.g.dart';

@SvgPainter.file('assets/icons/heart.svg')
class HeartIcon extends _$HeartIcon {
  const HeartIcon({super.fit});
}
```

#### From Inline SVG Code

```dart
import 'package:flutter/material.dart';
import 'package:svg_painter_annotation/svg_painter_annotation.dart';

part 'star_icon.g.dart';

@SvgPainter.code(
  '''
  <svg viewBox="0 0 24 24" width="24" height="24">
    <title>Favorite Star</title>
    <desc>A star icon indicating favorite items</desc>
    <polygon points="12,2 15,9 22,9 17,14 19,21 12,17 5,21 7,14 2,9 9,9" fill="gold" />
  </svg>
  ''',
)
class StarIcon extends _$StarIcon {
  const StarIcon({super.fit});
}
```

### 2. Run Code Generation

```bash
dart run build_runner build --delete-conflicting-outputs
```

### 3. Use in Your Flutter App

The generator produces both a `StatelessWidget` and a `CustomPainter`:

```dart
// Option A: Use the generated widget wrapper
const Widget icon = StarIconWidget(
  width: 48,
  height: 48,
  fit: BoxFit.contain,
);

// Option B: Use the generated CustomPainter directly
CustomPaint(
  size: const Size(48, 48),
  painter: const StarIcon(fit: BoxFit.contain),
);
```

---

## Widget Sizing & BoxFit

Generated widgets (`[ClassName]Widget`) support standard Flutter sizing and positioning:

```dart
StarIconWidget(
  width: 100,
  height: 60,
  fit: BoxFit.cover,
  alignment: Alignment.center,
)
```

All 7 Flutter `BoxFit` modes are supported:
* `BoxFit.contain` (Default): Scales proportionally to fit entirely within bounds.
* `BoxFit.cover`: Scales proportionally to cover the entire container bounds.
* `BoxFit.fill`: Stretches non-uniformly to fill the container dimensions.
* `BoxFit.fitWidth`: Scales proportionally to match the container's width.
* `BoxFit.fitHeight`: Scales proportionally to match the container's height.
* `BoxFit.none`: Renders at native SVG resolution without scaling.
* `BoxFit.scaleDown`: Scales down if the container is smaller than native size; behaves like `none` otherwise.

---

## Accessibility (Semantics)

When an SVG contains `<title>` and/or `<desc>` elements:

```xml
<svg viewBox="0 0 24 24">
  <title>Shopping Cart</title>
  <desc>Shows items currently in your basket</desc>
  ...
</svg>
```

`svg_painter` automatically wraps the generated widget in a Flutter `Semantics` widget:

```dart
Semantics(
  label: 'Shopping Cart',
  hint: 'Shows items currently in your basket',
  child: CustomPaint(...),
)
```

---

## Dynamic Properties & Recoloring

Turn static SVGs into themeable components using `SvgExposureMode`.

### Exposure Modes

| Mode | Description | Example |
| :--- | :--- | :--- |
| `none` (Default) | Painter is static; no properties exposed. Minimal generated code. | `const MyIcon()` |
| `id` | Only elements with an `id` attribute are exposed. | `MyIcon(headerFill: Colors.blue)` |
| `indexed` | Clusters shared colors and exposes them as indexed parameters (`fill1`, `fill2`, etc.). | `MyIcon(fill1: Colors.red)` |
| `mixed` | Exposes ID-based properties where present, falling back to indexed parameters for remaining elements. | `MyIcon(badgeFill: Colors.blue, fill1: Colors.grey)` |

```dart
@SvgPainter.file('assets/logo.svg', exposureMode: SvgExposureMode.id)
class LogoPainter extends _$LogoPainter {
  const LogoPainter({super.fit, super.headerFill, super.accentStroke});
}
```

### Semantic Property Renaming

Use `propertyMapping` to map generated names to meaningful domain parameters:

```dart
@SvgPainter.code(
  germanFlagSvg,
  exposureMode: SvgExposureMode.indexed,
  propertyMapping: {
    'fill1': 'topStripe',
    'fill2': 'middleStripe',
    'fill3': 'bottomStripe',
  },
)
class GermanFlagPainter extends _$GermanFlagPainter {}

// Usage: Turn the German flag into the Dutch flag at runtime!
const flag = GermanFlagPainterWidget(
  topStripe: Colors.red,
  middleStripe: Colors.white,
  bottomStripe: Colors.blue,
);
```

### `currentColor` Support

If your SVG uses `currentColor`, the generator automatically exposes a top-level `color` property on both the widget and painter, mirroring Flutter's `Icon` widget:

```dart
@SvgPainter.file('assets/icons/arrow.svg')
class ArrowIcon extends _$ArrowIcon {}

// Usage
const arrow = ArrowIconWidget(color: Colors.amber);
```

### Global Token Colors (`tokenColors`)

Enable `tokenColors: true` to discover all unique colors in an SVG and expose them as clean named properties (e.g. `black`, `red`, `cFF123456`). Overriding a token globally updates that color across all solid fills, strokes, and individual gradient stops:

```dart
@SvgPainter.code(
  '''
  <svg viewBox="0 0 100 50">
    <rect width="50" height="50" fill="black" />
    <rect x="50" width="50" height="50" fill="red" stroke="black" stroke-width="2" />
  </svg>
  ''',
  tokenColors: true,
)
class DuoBoxPainter extends _$DuoBoxPainter {
  const DuoBoxPainter({super.fit, super.black, super.red});
}

// Usage: Recolor all black parts to navy blue and red parts to gold
const box = DuoBoxPainterWidget(
  black: Colors.indigo,
  red: Colors.amber,
);
```

### Configurable Color Mapping (`colorMapping`)

Choose how color constants are written into generated code via `SvgColorMapping`:

* `SvgColorMapping.material` (Default): Uses Flutter `Colors.*` constants (`Colors.black`, `Colors.red`, `Colors.amber.shade200`).
* `SvgColorMapping.hex`: Generates pure `const Color(0xAARRGGBB)` hex values without referencing the Material palette.

```dart
@SvgPainter.file(
  'assets/logo.svg',
  colorMapping: SvgColorMapping.hex,
)
class LogoPainter extends _$LogoPainter {}
```

### Dynamic Style Inheritance

`svg_painter` honors SVG group inheritance rules. Overriding a property on a parent `<g>` automatically propagates down to all children that inherit from it.

---

## Font Management & AssetExporter

When rendering SVG `<text>` elements, `svg_painter` supports:
* Generic families: `sans-serif` (maps to `Roboto`), `serif` (maps to `Noto Serif`), and `monospace` (maps to `Roboto Mono`).
* Bundled package fonts via `package: 'svg_painter'`.
* Explicit app fonts (e.g. `font-family="Verdana"`).

To export the bundled standard fonts into your own Flutter project assets, run:

```bash
dart run svg_painter:export_assets [optional_destination_path]
```

The CLI automatically copies the font files and outputs the exact YAML snippet to add to your `pubspec.yaml`:

```yaml
flutter:
  fonts:
    - family: Roboto
      fonts:
        - asset: assets/fonts/roboto/roboto_regular.ttf
        - asset: assets/fonts/roboto/roboto_bold.ttf
          weight: 700
    - family: Noto Serif
      fonts:
        - asset: assets/fonts/noto_serif/noto_serif_regular.ttf
        - asset: assets/fonts/noto_serif/noto_serif_bold.ttf
          weight: 700
```

You can also use `AssetExporter` programmatically:

```dart
import 'dart:io';
import 'package:svg_painter/svg_painter.dart';

void exportFonts() {
  const exporter = AssetExporter();
  exporter.exportFonts(destinationDir: Directory('assets/fonts'));
}
```

---

## SVG Specification Support Matrix

`svg_painter` supports a wide range of SVG 1.1 and SVG 2.0 specifications:

### Supported Elements

| Category | Elements |
| :--- | :--- |
| **Shapes** | `<rect>`, `<circle>`, `<ellipse>`, `<line>`, `<polyline>`, `<polygon>`, `<path>` |
| **Structure & Containers** | `<svg>`, `<g>`, `<defs>`, `<symbol>`, `<use>` (with `x`, `y`, `width`, `height`) |
| **Media & Images** | `<image>` (data URIs like `data:image/png;base64,...` and asset hrefs) |
| **Clipping & Masking** | `<clipPath>`, `clip-path`, `<mask>`, `mask` (`userSpaceOnUse` and `objectBoundingBox`) |
| **Gradients** | `<linearGradient>`, `<radialGradient>`, `<stop>` (`gradientTransform`, `spreadMethod`, and elliptical bounds) |
| **Text & Typography** | `<text>`, `<tspan>` (`dx`, `dy`, `text-anchor`, `font-family`, `font-size`, `font-weight`, `font-style`) |
| **Styling** | `<style>` (CSS class and tag selectors), inline `style="..."` attributes |

### Supported Attributes

* **Fill & Stroke**: `fill`, `fill-rule` (`nonzero`, `evenodd`), `fill-opacity`, `stroke`, `stroke-width`, `stroke-linecap`, `stroke-linejoin`, `stroke-miterlimit`, `stroke-dasharray`, `stroke-dashoffset`, `stroke-opacity`.
* **Advanced Drawing**: `vector-effect="non-scaling-stroke"`, `paint-order` (e.g. `stroke fill`).
* **ViewBox & Viewport**: `viewBox`, `preserveAspectRatio` (`none`, `xMidYMid meet`, etc.).
* **Transforms**: `transform` (`matrix`, `translate`, `scale`, `rotate`, `skewX`, `skewY`).
* **Positioning**: `x`, `y`, `dx`, `dy`, `cx`, `cy`, `r`, `rx`, `ry`, `x1`, `y1`, `x2`, `y2`.

---

## License

MIT License. See [LICENSE](LICENSE) for details.
