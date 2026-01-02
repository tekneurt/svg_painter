# Project Daphnia: SVG to CustomPainter Code Generator

## Overview
Project Daphnia aims to create a Dart library that annotates code to generate `CustomPainter` code from SVG files. This allows developers to easily render SVGs in Flutter without runtime parsing overhead.

## Packages
1.  **svg_painter_annotation**: Contains the annotations used by developers.
2.  **svg_painter**: The code generator that translates SVG to `CustomPainter`.
3.  **svg_painter_fixtures**: Holds example SVGs and code (e.g., MDN Circle) for testing.
4.  **svg_painter_tests**: Flutter package for golden tests to validate generation.
5.  **example**: A usage example for the library.

## Development Plan

### Phase 1: Project Initialization & Standards
- [x] Initialize git repository.
- [x] Create workspace structure.
- [x] Set up individual packages (`svg_painter_annotation`, `svg_painter`, `example`, `svg_painter_fixtures`, `svg_painter_tests`).
- [x] Configure strict linter rules (analysis_options.yaml) for all packages.
- [x] Setup `melos` (optional) or workspace configuration (Using manual config for now).
- [x] Configure FVM with Flutter 3.38.5.
- [x] Ensure `.gitignore` is correct and annotated.
- [x] Ensure `analysis_options.yaml` is correct and annotated.
- [x] Update `CONTRIBUTING.md` with development principles and coding standards.

### Phase 2: Milestone 1 - The Circle (Proof of Concept)
- [x] **svg_painter_annotation**: Refactor to use `SvgPainter` sealed class.
- [x] **svg_painter_fixtures**: Refactor to separate semantic SVG strings from IO test files.
- [x] **svg_painter**: Implement basic `<circle>` support and generator.
- [x] **svg_painter_tests**: Setup golden tests for string and file inputs.
- [x] **example**: Web-only example app using the generator.

### Phase 3: Architecture Refactoring (Layered Approach)
Establish a robust, layered architecture to decouple parsing, semantic understanding, and code generation.

*   **Layer 1: SVG Model (`svg_model`)**
    - [x] Define domain objects for SVG elements (`SvgElement`, `SvgRoot`, `SvgCircle`) and attributes.
    - [x] Consolidate `SvgRoot` into `svg_svg.dart` and refine hierarchy.
    - [x] Implement `SvgLengthPercentage` value types (Split into `SvgLength` and `SvgPercentage`).
    - [x] Remove XML parsing details (enums) from `svg_model`.
    - [x] Consolidate `SvgValue` and `SvgLengthUnit` into `lib/src/svg_model/` and update imports.

*   **Layer 2: Painting Model (`painting_model`)**
    - [x] Define domain objects for painting commands (`PaintCommand`, `DrawCircle`).

*   **Layer 3: Code Generation**
    - [x] Refactor `SvgPainterGenerator` to use the full pipeline: XML -> SVG -> Painting -> Code.
    - [x] Verify existing `<circle>` tests pass with the new pipeline.

*   **Refactoring & Cleanup**
    - [x] Refactor `XmlParser` wrapper usage to `String.toXmlDocument()` extension.
    - [x] Replace `SvgMapper` and `PaintingMapper` classes with extension methods for cleaner syntax and better testability (`ElementToSvg`, `SvgToPainting`).
    - [x] Optimize imports and remove redundant comments.

### Phase 4: Advanced Values & Attributes
Refactor attribute handling to be context-aware and robust.

- [x] **Attribute Modeling**:
    - [x] Create `SvgAttribute` sealed class hierarchy (`Cx`, `Cy`, `R`, etc.) in `svg_model`.
    - [x] Implement default value logic per element (e.g. `cx` defaults to 0 for circle, 50% for radialGradient).
    - [x] Map XML attributes to these `SvgAttribute` models before setting fields on `SvgElement`.
    - [x] Ensure `SvgAttribute` is XML-agnostic and its `defaultValue` handles supported elements correctly (throws for unsupported, explicit fallback for supported).
    - [x] Refactor `SvgAttribute` into a robust barrel structure with `base_svg_attribute.dart` and concrete implementations as separate libraries.
- [x] **Absolute Lengths**: Support CSS units (`px`, `cm`, `mm`, `in`, `pt`, `pc`, `em`, `ex`).
    - [x] Implement `SvgLengthUnit` enum.
    - [x] Update `SvgLength` to use `SvgLengthUnit`.
    - [x] Update `StringToLength` extension to parse units.
    - [x] Update `SvgToPainting` extension to convert units to pixels.
- [x] **Percentages**: Implement resolution logic in `PaintingMapper` (requires context/viewBox).
    - [x] Parse `viewBox` in `SvgRoot` model (width, height, viewBox properties).
    - [x] Pass Context (resolved `viewBox` dimensions) to `SvgToPainting.toPaintCommands()`.
- [x] **Colors**: Support standard CSS colors:
    - [x] Named colors (e.g., `red`, `blue`).
    - [x] Hex codes (3, 6, 8 digits).
    - [x] Functional notation (`rgb()`, `rgba()`, `hsl()`, `hsla()`).

### Phase 5: Milestone 2 - The Daphnia (Advanced Shapes)
Implement support for additional SVG shapes using the new layered architecture.

- [x] **RadialGradient** (`<radialGradient>`)
    - [x] Add `radialGradient` to `XmlElementName`.
    - [x] Define `SvgRadialGradient` element with `cx`, `cy`, `r`.
    - [x] Update `svg_element.dart` to part `svg_radial_gradient.dart`.
    - [x] Update `ElementToSvg` to convert `radialGradient` element.
    - [x] Fully implement `SvgRadialGradient` with all its attributes.
- [x] **LinearGradient** (`<linearGradient>`)
    - [x] Add `linearGradient` to `XmlElementName`.
    - [x] Define `SvgLinearGradient` element with `x1`, `y1`, `x2`, `y2`.
    - [x] Update `svg_element.dart` to part `svg_linear_gradient.dart`.
    - [x] Update `ElementToSvg` to convert `linearGradient` element.
- [x] **Ellipse** (`<ellipse>`)
    - [x] Add `SvgEllipse` to SVG Model.
    - [x] Add `toSvgEllipse` extension.
    - [x] Add `DrawOval` to Painting Model.
    - [x] Add `toDrawOval` extension.
    - [x] Update Code Generator.
    - [x] Add Fixtures and Tests.
- [x] **Rect** (`<rect>`)
    - [x] Add `SvgRect` to SVG Model.
    - [x] Add `toSvgRect` extension.
    - [x] Add `DrawRect` to Painting Model.
    - [x] Add `toDrawRect` extension.
    - [x] Update Code Generator.
    - [x] Add Fixtures and Tests.
- [x] **Line** (`<line>`)
    - [x] Add `SvgLine` to SVG Model.
    - [x] Add `toSvgLine` extension.
    - [x] Add `DrawLine` to Painting Model.
    - [x] Add `toDrawLine` extension.
    - [x] Update Code Generator.
    - [x] Add Fixtures and Tests.
- [x] **Polyline** (`<polyline>`)
    - [x] Add `SvgPolyline` to SVG Model.
    - [x] Add `toSvgPolyline` extension.
    - [x] Add `DrawPolyline` to Painting Model.
    - [x] Add `toDrawPolyline` extension.
    - [x] Update Code Generator.
    - [x] Add Fixtures and Tests.
- [x] **Polygon** (`<polygon>`)
    - [x] Add `SvgPolygon` to SVG Model.
    - [x] Add `toSvgPolygon` extension.
    - [x] Add `DrawPolygon` to Painting Model.
    - [x] Add `toDrawPolygon` extension.
    - [x] Update Code Generator.
    - [x] Add Fixtures and Tests.
- [x] **Group** (`<g>`)
- [x] **Path** (`<path>`)
- [x] **CSS/Class Support**: Implement basic `<style>` parsing and `class` attribute mapping for presentation attributes.
- [x] **Text** (`<text>`)
- [ ] **Image** (`<image>`)
- [ ] **Mask** (`<mask>`)
- [x] **Use** (`<use>`)
- [x] **TODO(Gemini)**: Implement zero-radius handling (0-radius elements are not rendered).
- [x] **TODO(Gemini)**: Refactor zero-dimension checks into specific element-to-painting extensions.
- [x] **TODO(Gemini)**: Implement nested opacity multiplication (currently selects highest level defined).
- [x] **TODO(Gemini)**: Implement `stroke-opacity` and `fill-opacity` support (including MDN examples).
- [x] **TODO(Gemini)**: Add `pathLength` support to SVG models.
- [ ] **TODO(Gemini)**: Add comprehensive tests for all `BoxFit` values (separate from MDN examples).
- [ ] **TODO(Gemini)**: Improve coordinate mapping for gradients (currently uses rough alignment approximation).
- [ ] **TODO(Gemini)**: Support `currentColor` context in color resolution.
- [ ] **TODO(Gemini)**: Implement full `gradientUnits` support (currently assumes `userSpaceOnUse` mapping).
- [ ] **TODO(Gemini)**: Implement `objectBoundingBox` for gradients.
- [x] **TODO(Gemini)**: Implement full `gradientTransform` support (currently only `rotate(90)`).
- [x] **TODO(Gemini)**: Implement `fill` attribute example from MDN.
- [x] **TODO(Gemini)**: Implement `stroke` attribute example from MDN.
- [ ] **TODO(Gemini)**: Implement `<marker>` support (required for context-fill MDN example).
- [x] **TODO(Gemini)**: Implement `fy` attribute example from MDN (requires `text`).
- [x] **TODO(Gemini)**: Implement `points` attribute example from MDN (requires `transform`).
- [ ] **TODO(Gemini)**: Implement other examples from the `<svg>` element MDN page.
- [x] **TODO(Gemini)**: Implement full `transform` attribute support (parsing matrices, rotate, translate, etc.).
- [x] **TODO(Gemini)**: Support `rotate(angle [cx cy])` transform (encountered in W3C shapes).
- [x] **TODO(Gemini)**: Verify/Implement root viewport resolution for absolute units like `cm` (encountered in W3C shapes).
- [x] **TODO(Gemini)**: Implement `fr` (focal radius) for radial gradients.
- [x] **TODO(Gemini)**: Implement `<use>` element support.
- [x] **TODO(Gemini)**: Improve `toPosition` mapping for nested elements and complex coordinate systems.
- [x] **TODO(Gemini)**: Simplify golden tests by using a single function that enumerates all fixtures.
- [ ] **TODO(Gemini)**: Determine default behavior for unknown named colors (render vs throw).
- [ ] **TODO(Gemini)**: Handle failure cases in `SvgToPainting` converter.
- [ ] **TODO(Gemini)**: Support W3C SVG 2 path examples.
    - Analysis: `PathDataParser` currently expects space/comma separators between arc flags. SVG spec allows concatenated flags (e.g., `01` means `0` then `1`). The current regex `(-?\d*\.?\d+(?:[eE][+-]?\d+)?)` treats `01` as `1.0`, breaking parsing for compact arc commands often found in W3C examples. Needs a more robust tokenizer that respects the grammar for arc arguments.
- [ ] **TODO(Gemini)**: Font Management.
    - [x] Bundle standard open-source fonts (Roboto, Noto Serif) with all weights/styles (static files) in the package.
    - [ ] Implement `PubspecScanner` to detect if required fonts are registered in the user's `pubspec.yaml`.
    - [ ] Implement `AssetExporter` to automatically copy used fonts to the user's project assets if `autoCopyFonts` is enabled.
    - [x] Fix UI tests to ensure real fonts are rendered instead of the default `Ahem` block font in golden images.
    - [x] Map SVG generic font-family names (`sans-serif`, `serif`, `monospace`) to bundled fonts.
    - [ ] Document how to properly add custom fonts (step-by-step).
    - [ ] Investigate how to detect existing fonts in the target package and use them without duplication.
    - [ ] Consider generating a `font_loader` initialization helper.
- [x] **Attributes**
    - [x] Fill (color, none)
    - [x] Stroke (color, width)
    - [x] Stroke (cap, join)
    - [x] Opacity
- [x] **Transforms** (translate, scale via nested SVG and use)
- [x] **Test**: Verify against the Daphnia SVG.

### Phase 6: Dynamic Properties & Customization (Key Value Prop)
Transform the generator from a static renderer into a customizable component builder by allowing users to override SVG properties.

- [ ] **Step 1: Architecture Prep (PaintingStyle Composition)**
    - [ ] Refactor `PaintingStyle` into structured `FillStyle` and `StrokeStyle` objects (Composition pattern).
    - [ ] Update `resolvePaint` and `ShapeGenerator` to use these structures.
- [ ] **Step 2: Property Mapping Strategy**
    - [ ] Define the rule set for exposing properties (e.g., using element `id`s like `id="circle1"` -> `circle1Fill`).
    - [ ] Implement `IdentifierSanitizer` to ensure generated field names are valid Dart identifiers.
- [ ] **Step 3: Dynamic Fill Colors**
    - [ ] Detect elements with valid `id`s.
    - [ ] Generate `final Color? [id]Fill` fields in the `CustomPainter` class.
    - [ ] Pass these fields to the painting logic, using the SVG's static color as the default fallback.
- [ ] **Step 4: Dynamic Stroke Properties**
    - [ ] Generate `final Color? [id]Stroke` fields.
    - [ ] Generate `final double? [id]StrokeWidth` fields.
- [ ] **Step 5: "CurrentColor" Support**
    - [ ] Implement proper handling for `currentColor` keyword, mapping it to a primary `color` property on the Painter (matching Flutter's `Icon` behavior).

### Phase 7: Polish & Release (MVP 0.1.0)
- [x] **Refactor (High Priority)**: `SvgPaintingContext` — Encapsulate coordinate transformations (e.g., `context.transformPoint(x, y)`) to deduplicate math in shape converters.
- [x] **Refactor (High Priority)**: `SvgPainterGenerator` — Modularize code generation logic (e.g., Strategy Pattern) to eliminate the monolithic `if/else` block and deduplicate `Paint` boilerplate.
- [x] **Refactor (High Priority)**: `Radii Resolver` — Deduplicate `rx`/`ry` auto-inheritance logic for `ellipse` and `rect` using a shared Record-based helper.
- [x] **Refactor (High Priority)**: `SvgPaintingContext` — Add a `derive()` or `copyWith()` method to simplify creating child contexts with transformations and style inheritance.
- [x] **Refactor (High Priority)**: `Paint & Stroke Resolver` — Create a shared helper (`resolvePaint`) to standardize `fill` vs `fillShaderId` resolution and deduplicate code across shape converters.
- [x] **Refactor (High Priority)**: XML Conversion — Deduplicate parsing logic for common attributes (`fill`, stroke, strokeWidth, id) using a mixin or helper.
- [ ] **Refactor (High Priority)**: Replace silent continues and "should not happen" comments with explicit generator errors (e.g. `GroupGenerator`, `SvgToPainting`).
- [ ] **Refactor (Medium Priority)**: Simplify stroke attribute handling across the SVG Model and conversion layers (investigate using a shared `StrokeStyle` or mixin to reduce constructor boilerplate).
- [ ] **Refactor (Medium Priority)**: `SvgValue` — Update `toDouble()` to accept `SvgPaintingContext` for future-proofing unit resolution (e.g., `em`).
- [x] **Refactor (Medium Priority)**: SVG Model — Investigate grouping SVG elements by category (e.g., using sealed classes for `BasicShapes`, `Containers`, etc.) to better reflect the spec and share properties.
- [ ] **Refactor (Low Priority)**: `Result` — Add ergonomic extensions (e.g., `combine()`) to simplify list folding and result aggregation.
- [ ] **Refactor (Low Priority)**: Convert existing code to use dot shorthand for enum values and static members consistently.
- [ ] **Refactor (Low Priority)**: Standardize extension naming across all layers (e.g., `To[Target]`).
- [ ] **Refactor (Low Priority)**: Cleanly integrate or refactor `StrokeCap.toFlutterString()` (currently in `command_generator.dart`).
- [ ] comprehensive documentation.
- [ ] **TODO(Gemini)**: API polishing.
- [ ] **TODO(Gemini)**: Optimize generated code (remove comments, unnecessary braces, unused variables).
- [ ] **TODO(Gemini)**: Publish to pub.dev (dry run).

### Phase 8: Animation Support (Post 1.0.0)
- [ ] **TODO(Gemini)**: Implement `<animate>` support (e.g., from MDN fill example).
- [ ] **TODO(Gemini)**: Implement `animateMotion` support (utilizes `pathLength`).

