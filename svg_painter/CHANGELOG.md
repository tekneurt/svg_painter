# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.4.0] - 2026-09-13

### Added

#### Spec Compliance
- **Images**: Added `<image>` element support for embedded (base64 data URI) and linked PNG and JPEG assets.
- **Element Reuse**: Implemented `<use>` element referencing for shared definitions and symbols with transform translations.
- **Masking**: Added `<mask >` element and `mask` presentation attribute with alpha mask rendering.
- **Clipping**: Added `<clipPath>` element and `clip-path` presentation attribute for SVG 1.1 shapes.
- **Text Attributes**: Implemented `text-anchor` (`start`, `middle`, `end`), `dx`, and `dy` attributes.
- **Presentation Attributes**: Implemented `vector-effect` (`non-scaling-stroke`), `paint-order` (`fill`, `stroke`, `markers`), `fill-rule` (`nonzero`, `evenodd`), `stroke-dashoffset`, and `stroke-miterlimit`.
- **ViewBox & Aspect Ratio**: Full `preserveAspectRatio` support matching all Flutter `BoxFit` modes with dual-resolution widget tests.
- **Accessibility**: Automatic `Semantics` widget mapping from SVG `<title>` and `<desc>` elements.
- **Font Management**: Added `AssetExporter` to automatically handle bundled font dependencies.

#### Code Generation & Architecture
- **Generator Modularization**: Refactored `SvgPainterGenerator` into dedicated helper classes for painter and widget class generation.
- **Clean Code & Pattern Matching**: Refactored `CommandGenerator` and `SvgPaintResolver` to use clean Dart 3 pattern matching and eliminated complex boolean flag cascades.
- **Concise Debugging**: Streamlined `PaintingStyle` and `DrawCommand` `toString()` outputs to omit default values.

### Changed

- **Dependencies**: Broadened package constraints for `xml` (`>=6.6.1 <8.0.0`), `meta` (`>=1.17.0 <2.0.0`), `path` (`^1.9.0`), and `svg_painter_annotation` (`^0.4.0`). Upgraded to `xml 7.0.1` and migrated deprecated namespace usage to `namespaceUri`.
- **Documentation**: Comprehensive README documentation overhaul covering architecture, usage, dynamic property exposure, and configuration options.
- **Formatting**: Enforced trailing comma formatting across the entire monorepo.

## [0.3.0] - 2026-03-23

### Added

#### Spec Compliance
- **SVG Text Model**: Full implementation of spec-compliant text hierarchy. Characters and `<tspan>` elements are now represented truthfully without "virtual" nodes.
- **Whitespace Normalizer**: Added boundary-aware whitespace normalization supporting `xml:space="default"` and `preserve`.
- **Radial Gradients**: Implemented elliptical radial gradient support with pixel-space centering for `objectBoundingBox` units.
- **Gradient Transforms**: Added support for `gradientTransform` attribute on both linear and radial gradients.

#### Code Generation
- **Optimization**: The generator now omits redundant transforms and helper classes for square elements.
- **Clean Naming**: Helper classes are now named `_SvgGradientTransform_$Name` to avoid collisions in `SharedPartBuilder`.
- **SDK Support**: Upgraded to **Dart 3.11.3** and **Flutter 3.41.5**.

### Fixed

- **Group Opacity**: Fixed a bug where single-child groups and `<use>` elements ignored `opacity`.
- **Matrix Transforms**: Migrated from deprecated `Matrix4.translate/scale` to `translateByDouble/scaleByDouble`.
- **Clipping**: Fixed clipping logic for nested `<svg>` elements with shifted viewboxes or slice scaling.

### Changed

- **Analysis**: Synchronized with official Flutter repository `analysis_options.yaml` (March 2026).
- **Coding Style**: Adopted idiomatic Flutter type inference (`omit_obvious_local_variable_types`).
- **Dependency**: Updated `svg_painter_annotation` to `^0.3.0`.

## [0.2.0] - 2026-01-31

### Added

#### Dynamic Properties
- **ID-Based Exposure**: Automatically generates fields for elements with IDs (e.g. `final Color? myCircleFill`).
- **Indexed Exposure**: Generates fields for elements without IDs using index-based naming (e.g. `final Color? fill1`) when enabled via `exposureMode: SvgExposureMode.indexed`.
- **Property Mapping**: Allows renaming of exposed properties via `propertyMapping` in the annotation (e.g. `{'fill1': 'primaryColor'}`).
- **Dynamic Style Inheritance**: Overriding a group's property (e.g. `g1Fill`) now correctly propagates to all inheriting children.

#### Widget Generation
- Generates a `StatelessWidget` wrapper (e.g. `MyIconWidget`) for easier consumption.
- Exposes all dynamic properties as constructor parameters.
- Supports `BoxFit`, `Alignment`, and `width`/`height` sizing.

#### CurrentColor Support
- Maps SVG `currentColor` keyword to a primary `color` property on the generated Widget/Painter.
- Defaults to `IconTheme.of(context).color` in the generated Widget.

### Changed

- **Refactoring**: Significant code cleanup and refactoring for better maintainability and type safety.
- **Dependency**: Updated `svg_painter_annotation` to `^0.2.0`.

## [0.1.1] - 2026-01-26

### Fixed

- Added example file for pub.dev documentation
- Fixed monorepo dependency resolution for CI

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
