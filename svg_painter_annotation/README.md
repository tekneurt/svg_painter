# svg_painter_annotation

Annotations for [svg_painter](https://pub.dev/packages/svg_painter), the high-performance SVG-to-Flutter code generator.

---

## Installation

Add `svg_painter_annotation` to your `dependencies`:

```yaml
dependencies:
  svg_painter_annotation: ^0.4.0
```

Add `svg_painter` and `build_runner` to your `dev_dependencies`:

```yaml
dev_dependencies:
  build_runner: ^2.4.0
  svg_painter: ^0.4.0
```

---

## Usage

Annotate your class with `@SvgPainter.file` or `@SvgPainter.code`:

### From SVG File

```dart
import 'package:flutter/material.dart';
import 'package:svg_painter_annotation/svg_painter_annotation.dart';

part 'user_avatar.g.dart';

@SvgPainter.file('assets/icons/user_avatar.svg')
class UserAvatar extends _$UserAvatar {
  const UserAvatar({super.fit});
}
```

### From Inline SVG Code

```dart
import 'package:flutter/material.dart';
import 'package:svg_painter_annotation/svg_painter_annotation.dart';

part 'badge_icon.g.dart';

@SvgPainter.code(
  '''
  <svg viewBox="0 0 100 100">
    <circle id="bg" cx="50" cy="50" r="45" fill="#4CAF50" />
    <path id="check" d="M30 50 L45 65 L70 35" stroke="white" stroke-width="8" fill="none" />
  </svg>
  ''',
)
class BadgeIcon extends _$BadgeIcon {
  const BadgeIcon({super.fit});
}
```

---

## Annotation Configuration

`@SvgPainter` provides several parameters to customize code generation:

### `painterClassName`

By default, the generator creates `_$[ClassName]Painter` (and `[ClassName]Widget`). Specify `painterClassName` if you want a custom base painter name:

```dart
@SvgPainter.file(
  'assets/icon.svg',
  painterClassName: 'CustomBaseIconPainter',
)
class IconPainter extends CustomBaseIconPainter {}
```

### `exposureMode`

Controls which SVG properties are exposed in the generated constructor for runtime theming:

* `SvgExposureMode.none` (Default): Static painter. No recoloring properties are exposed.
* `SvgExposureMode.id`: Exposes properties for elements with an `id` attribute (e.g. `bgFill`, `checkStroke`).
* `SvgExposureMode.indexed`: Clusters colors into indexed properties (`fill1`, `fill2`, etc.).
* `SvgExposureMode.mixed`: Combines ID-based exposure with indexed fallback.

```dart
@SvgPainter.file(
  'assets/icon.svg',
  exposureMode: SvgExposureMode.id,
)
class IconPainter extends _$IconPainter {
  const IconPainter({super.fit, super.bgFill, super.checkStroke});
}
```

### `propertyMapping`

Maps auto-generated parameter names to semantic names:

```dart
@SvgPainter.file(
  'assets/button.svg',
  exposureMode: SvgExposureMode.indexed,
  propertyMapping: {
    'fill1': 'buttonColor',
    'stroke1': 'borderColor',
  },
)
class ButtonPainter extends _$ButtonPainter {
  const ButtonPainter({super.fit, super.buttonColor, super.borderColor});
}
```

---

## License

MIT License. See [LICENSE](LICENSE) for details.
