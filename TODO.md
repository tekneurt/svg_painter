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

*   **Layer 2: Painting Model (`painting_model`)**
    - [x] Define domain objects for painting commands (`PaintCommand`, `DrawCircle`).

*   **Layer 3: Code Generation**
    - [x] Refactor `SvgPainterGenerator` to use the full pipeline: XML -> SVG -> Painting -> Code.
    - [x] Verify existing `<circle>` tests pass with the new pipeline.

*   **Refactoring & Cleanup**
    - [x] Refactor `XmlParser` wrapper usage.
    - [x] Replace `SvgMapper` and `PaintingMapper` classes with extension methods for cleaner syntax and better testability (`ElementToSvg`, `SvgToPainting`).
    - [x] Optimize imports and remove redundant comments.

### Phase 4: Advanced Values & Attributes
Before adding new shapes, we must solidify support for advanced SVG values and attributes.

- [ ] **Absolute Lengths**: Support CSS units (`px`, `cm`, `mm`, `in`, `pt`, `pc`, `em`, `ex`).
- [ ] **Percentages**: Implement resolution logic in `PaintingMapper` (requires context/viewBox).
- [ ] **Colors**: Support standard CSS colors:
    - [ ] Named colors (e.g., `red`, `blue`).
    - [ ] Hex codes (3, 4, 6, 8 digits).
    - [ ] Functional notation (`rgb()`, `rgba()`, `hsl()`, `hsla()`).

### Phase 5: Milestone 2 - The Daphnia (Advanced Shapes)
Implement support for additional SVG shapes using the new layered architecture.

- [ ] **Ellipse** (`<ellipse>`)
    - [ ] Add `SvgEllipse` to SVG Model.
    - [ ] Add `toSvgEllipse` extension.
    - [ ] Add `DrawOval` to Painting Model.
    - [ ] Add `toDrawOval` extension.
    - [ ] Update Code Generator.
    - [ ] Add Fixtures and Tests.
- [ ] **Rect** (`<rect>`)
- [ ] **Line** (`<line>`)
- [ ] **Polyline** (`<polyline>`)
- [ ] **Polygon** (`<polygon>`)
- [ ] **Path** (`<path>`)
- [ ] **Attributes**
    - [ ] Fill (color, none)
    - [ ] Stroke (color, width, cap, join)
    - [ ] Opacity
- [ ] **Transforms** (translate, rotate, scale, skew)
- [ ] **Test**: Verify against the Daphnia SVG.

### Phase 6: Polish & Release
- [ ] comprehensive documentation.
- [ ] API polishing.
- [ ] Publish to pub.dev (dry run).