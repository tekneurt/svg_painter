# TODO - SVG Painter Project

## Project Overview
- **Package names:** `svg_painter` and `svg_painter_annotation`
- **Annotation:** `@SvgPainter`
- **Codename/Mascot:** Daphnia
- **Target:** Dart 3.10.0 / Flutter 3.38.0

## Major Milestone

**Goal:** Render the Daphnia mascot SVG:
https://upload.wikimedia.org/wikipedia/commons/b/b6/202002_Microorganism_daphnia.svg

This SVG uses:
- `<path>` elements (body, legs, antennae)
- `<circle>` elements (eye, orange spots)
- CSS `<style>` in `<defs>` for class-based fills
- Fill colors: #fff (white), #2b2727 (dark gray), #ef7b51 (orange)
- ViewBox: 0 0 48 48

## Architecture Layers

The code generator follows a layered architecture:

```
1. XML Layer       - Parse SVG file to XML Document
2. SVG Layer       - Convert XML to SVG model (elements, attributes, values)
3. PTR Layer       - Convert SVG to Painter model (geometry, painting)
4. Code Gen Layer  - Generate CustomPainter Dart code
```

**Approach:** Build step-by-step. Start with simple circle, push through all layers to generated code, write tests at each step, then add more features incrementally.

Reference implementations (for functionality, not copying code):
- `/Users/marktoten/Git/daphnia_most_recent` (most complete)
- `/Users/marktoten/Git/_Personal/daphnia_old`
- `/Users/marktoten/Git/_Personal/daphnia_oldest`

---

## Quality Guidelines

### Error Messages
All error messages must be **developer-friendly**:
- Clearly state WHAT went wrong
- State WHERE it happened (file, line, element)
- Suggest HOW to fix it
- Include the actual value that caused the error

Example of good error message:
```
SvgPainterError: Invalid color value "redd" in fill attribute.
  Location: assets/icon.svg, <circle> element
  Did you mean: "red"?
  Supported formats: named colors (red, blue), hex (#RGB, #RRGGBB), rgb(), rgba(), hsl(), hsla()
```

### Testing
- Unit tests for every class (AAA pattern)
- Golden tests for generated code output
- Integration test with example app

---

## Phase 1: Project Setup

- [ ] **1.1** Update CLAUDE.md - rename folder references from `daphnia/` to `svg_painter/`
- [ ] **1.2** Set up `svg_painter_annotation/` package structure
  - pubspec.yaml (minimal dependencies)
  - lib/svg_painter_annotation.dart (barrel export)
  - lib/src/svg_painter.dart (@SvgPainter annotation class)
  - analysis_options.yaml
  - LICENSE, README.md, CHANGELOG.md
- [ ] **1.3** Set up `svg_painter/` package structure
  - pubspec.yaml (with source_gen, build, analyzer, xml, code_builder dependencies)
  - lib/svg_painter.dart (barrel export)
  - lib/src/builder.dart (build_runner entry point)
  - build.yaml
  - analysis_options.yaml
  - LICENSE, README.md, CHANGELOG.md
- [ ] **1.4** Set up `example/` Flutter app structure
- [ ] **1.5** Run `fvm flutter analyze` on all packages - fix any issues
- [ ] **1.6** Create GitHub repository and push code
- [ ] **1.7** Publish v0.0.1 to pub.dev to claim package names
  - First: publish svg_painter_annotation
  - Then: update svg_painter to use published version (not path dependency)
  - Then: publish svg_painter

---

## Phase 2: First End-to-End - Simple Circle

Goal: Get a simple `<circle>` SVG through all layers to generated CustomPainter code.

### 2.1 Annotation Package
- [ ] **2.1.1** Create `@SvgPainter` annotation class with `filePath` and `code` parameters
- [ ] **2.1.2** Write tests for annotation (canonicalization + field assignment)

### 2.2 Generator Skeleton
- [ ] **2.2.1** Create `SvgPainterGenerator` extending `GeneratorForAnnotation<SvgPainter>`
- [ ] **2.2.2** Create `builder.dart` with `SharedPartBuilder`
- [ ] **2.2.3** Create error types with developer-friendly messages
- [ ] **2.2.4** Test generator produces placeholder output

### 2.3 XML Layer - Circle
- [ ] **2.3.1** Parse XML document from code string
- [ ] **2.3.2** Extract root `<svg>` element
- [ ] **2.3.3** Extract `<circle>` child element
- [ ] **2.3.4** Parse viewBox attribute
- [ ] **2.3.5** Parse circle attributes (cx, cy, r, fill)
- [ ] **2.3.6** Tests for XML parsing

### 2.4 SVG Layer - Circle
- [ ] **2.4.1** SVG value types: Length, Number, Color (HexColor only first)
- [ ] **2.4.2** SVG attributes: ViewBox, Cx, Cy, R, Fill
- [ ] **2.4.3** SVG elements: Svg, Circle
- [ ] **2.4.4** Conversion from XML to SVG model
- [ ] **2.4.5** Tests for SVG model

### 2.5 PTR Layer - Circle
- [ ] **2.5.1** PTR geometry: Offset, Size, Circle shape
- [ ] **2.5.2** PTR painting: Color (ARGB int), FillPaint
- [ ] **2.5.3** PTR Image container
- [ ] **2.5.4** Conversion from SVG Circle to PTR Circle
- [ ] **2.5.5** Tests for PTR model

### 2.6 Code Generation - Circle
- [ ] **2.6.1** Generate StatelessWidget class
- [ ] **2.6.2** Generate CustomPainter inner class
- [ ] **2.6.3** Generate paint() with canvas.drawCircle()
- [ ] **2.6.4** Generate aspectRatio getter from viewBox
- [ ] **2.6.5** Generate fillColor parameter with default
- [ ] **2.6.6** Tests for code generation
- [ ] **2.6.7** Golden test for complete circle output

### 2.7 Integration Test
- [ ] **2.7.1** Example app with annotated circle SVG
- [ ] **2.7.2** Verify generated code compiles and renders

---

## Phase 3: Expand Color Support

- [ ] **3.1** NamedColor (147 SVG named colors)
- [ ] **3.2** HexColor variants (#RGB, #RGBA, #RRGGBB, #RRGGBBAA)
- [ ] **3.3** RgbColor and RgbaColor
- [ ] **3.4** HslColor and HslaColor
- [ ] **3.5** Tests for all color formats
- [ ] **3.6** Developer-friendly error messages for invalid colors

---

## Phase 4: Add Rectangle Element

- [ ] **4.1** SVG Rect attributes: x, y, width, height, rx, ry
- [ ] **4.2** SVG Rect element
- [ ] **4.3** PTR Rect and RRect shapes
- [ ] **4.4** Conversions SVG Rect -> PTR Rect/RRect
- [ ] **4.5** Code generation for canvas.drawRect() / drawRRect()
- [ ] **4.6** Tests and golden test

---

## Phase 5: Add Path Element

Required for Daphnia mascot body/legs/antennae.

- [ ] **5.1** Parse path `d` attribute
- [ ] **5.2** Path commands: M, L, C, Z (and lowercase variants)
- [ ] **5.3** SVG Path element
- [ ] **5.4** PTR Path shape
- [ ] **5.5** Code generation for canvas.drawPath()
- [ ] **5.6** Tests and golden test

---

## Phase 6: CSS Style Support

Required for Daphnia mascot (uses `<style>` in `<defs>`).

- [ ] **6.1** Parse `<defs>` element
- [ ] **6.2** Parse `<style>` element
- [ ] **6.3** Extract CSS class definitions
- [ ] **6.4** Apply class-based fills to elements
- [ ] **6.5** Tests

---

## Phase 7: Daphnia Mascot

- [ ] **7.1** Full integration test with Daphnia SVG
- [ ] **7.2** Golden test for Daphnia output
- [ ] **7.3** Visual verification in example app

---

## Phase 8: Publishing

- [ ] **8.1** Write README.md for svg_painter_annotation
- [ ] **8.2** Write README.md for svg_painter
- [ ] **8.3** Add LICENSE file
- [ ] **8.4** Add CHANGELOG.md
- [ ] **8.5** Verify pubspec.yaml metadata complete
- [ ] **8.6** Publish svg_painter_annotation to pub.dev
- [ ] **8.7** Publish svg_painter to pub.dev

---

## Future Enhancements (Post-MVP)

- [ ] CLI command for one-time SVG to code conversion (without build_runner)
- [ ] Ellipse element support
- [ ] Polygon/Polyline support
- [ ] Text elements
- [ ] Gradient support (linear, radial)
- [ ] Group element (g)
- [ ] Transform attribute
- [ ] Stroke properties (width, dasharray, linecap, etc.)
- [ ] Opacity attribute
- [ ] ClipPath support
- [ ] Multiple shapes with color deduplication

---

## Architecture Notes

### Folder Structure (svg_painter package)
```
lib/
  svg_painter.dart           # Barrel export
  src/
    builder.dart             # build_runner entry point
    svg_painter_generator.dart
    target.dart              # Code generation
    model_visitor.dart       # AST visitor
    error/                   # Error types (developer-friendly!)
    xml/                     # XML parsing layer
      document/
      element/
      string/                # String -> Value parsers
    svg/                     # SVG model layer
      attribute/
      element/
      enum/
      value/
    ptr/                     # Painter model layer
      classes/
        geometry/
        painting/
      conversion/            # SVG -> PTR conversions
```

### Design Decisions
- Use sealed classes for type hierarchies (Shape, Color, Element)
- Use extensions for conversions (toCircle, toImage, etc.)
- Use Either<Failure, Success> for error handling
- No exceptions thrown - all errors handled via types
- Strict linting - zero warnings/infos allowed
- Developer-friendly error messages with context and suggestions

---

## Current Status

**Last updated:** Starting fresh

**Current phase:** Phase 1 - Project Setup

**Next step:** 1.1 - Update CLAUDE.md
