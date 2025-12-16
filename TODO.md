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

### Phase 2: Milestone 1 - The Circle (Proof of Concept)
- [x] **svg_painter_annotation**: Create `SvgSource` annotation.
- [x] **svg_painter_fixtures**: Add MDN Circle SVG.
- [x] **svg_painter**:
    - [x] Implement `Builder` structure.
    - [x] Implement XML/SVG parsing logic.
    - [x] Implement `<circle>` element support.
    - [x] Generate `CustomPainter` class.
- [x] **svg_painter_tests**:
    - [x] Setup Golden Test infrastructure.
    - [x] Create test for generated Circle painter.
    - [x] Verify against reference image.
- [x] **example**: Create a simple Flutter app displaying the generated Circle.

### Phase 3: Milestone 2 - The Daphnia (Advanced Shapes)
- [ ] Support `<path>` element.
- [ ] Support `<rect>`, `<line>`, `<polyline>`, `<polygon>`, `<ellipse>`.
- [ ] Support basic attributes (fill, stroke, width, color).
- [ ] Support transforms.
- [ ] **Test**: Verify against the Daphnia SVG.

### Phase 4: Polish & Release
- [ ] comprehensive documentation.
- [ ] API polishing.
- [ ] Publish to pub.dev (dry run).