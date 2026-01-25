# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.1.0] - 2026-01-25

### Added

#### SVG Elements
- `<svg>` - Root element with viewBox support
- `<circle>` - Circle shapes
- `<ellipse>` - Ellipse/oval shapes
- `<rect>` - Rectangles with optional rounded corners (rx/ry)
- `<line>` - Line segments
- `<path>` - Full path data support (M, L, H, V, C, S, Q, T, A, Z commands)
- `<polygon>` - Closed polygon shapes
- `<polyline>` - Open polyline shapes
- `<text>` - Basic text rendering
- `<g>` - Group element for organizing shapes
- `<defs>` - Definition container for reusable elements
- `<use>` - Reference and reuse defined elements
- `<linearGradient>` - Linear gradient fills/strokes
- `<radialGradient>` - Radial gradient fills/strokes
- `<stop>` - Gradient color stops

#### SVG Attributes
- `fill` and `stroke` - Solid colors and gradient references
- `fill-opacity` and `stroke-opacity` - Transparency control
- `opacity` - Element-level opacity
- `stroke-width` - Stroke thickness
- `stroke-linecap` - Line end styles (butt, round, square)
- `stroke-linejoin` - Line join styles (miter, round, bevel)
- `stroke-dasharray` - Dashed line patterns
- `transform` - All transform functions (translate, scale, rotate, skewX, skewY, matrix)
- `viewBox` - Coordinate system definition
- `style` - Inline CSS style parsing

#### Color Formats
- Named colors (140 SVG/CSS color names)
- Hex colors (`#RGB`, `#RRGGBB`)
- RGB/RGBA (`rgb()`, `rgba()`)
- HSL/HSLA (`hsl()`, `hsla()`)
- `none` and `currentColor` keywords

#### Build System
- `build_runner` integration for automatic code generation
- Annotation-based SVG file selection (`@SvgPainter`)

### Notes
- Generated painters extend Flutter's `CustomPainter`
- Automatic scaling to fit target dimensions while preserving aspect ratio
- Full support for nested groups and transforms
