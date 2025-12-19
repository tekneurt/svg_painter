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
    - [x] Implement `svg_from_xml`: Mapper to convert `xml` nodes to `SvgElement` domain objects.
    - [x] Handle default values (e.g., default fill color black) in this layer.

*   **Layer 2: Painting Model (`painting_model`)**
    - [x] Define domain objects for painting commands (`PaintCommand`, `DrawCircle`, `SetPaint`).
    - [x] Implement `painting_from_svg`: Mapper to convert `SvgElement` hierarchy to a flat or structured list of `PaintCommand`s.

*   **Layer 3: Code Generation**
    - [x] Refactor `SvgPainterGenerator` to consume the Painting Model and emit Dart code.
    - [x] Verify existing `<circle>` tests pass with the new pipeline.

*   **Refactoring & Cleanup**
    - [ ] Refactor `XmlParser` wrapper to use Dart extension methods on `XmlElement` for cleaner syntax.

### Phase 4: Milestone 2 - The Daphnia (Advanced Shapes)
Implement support for additional SVG shapes and attributes using the new layered architecture.

- [ ] **Ellipse** (`<ellipse>`)
    - [ ] Add `SvgEllipse` to SVG Model.
    - [ ] Update `svg_from_xml` mapper.
    - [ ] Add `DrawOval` (or similar) to Painting Model.
    - [ ] Update `painting_from_svg` mapper.
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

### Phase 5: Polish & Release
- [ ] comprehensive documentation.
- [ ] API polishing.
- [ ] Publish to pub.dev (dry run).