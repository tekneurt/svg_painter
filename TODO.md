# SVG Painter TODO

## Roadmap to MVP (0.1.0)

### Phase 1: High Priority Architecture & Refactoring
*Foundational work to enable dynamic properties and ensure a robust implementation.*

- [x] **PaintingStyle Composition**: Refactor the flat `PaintingStyle` into structured `FillStyle` and `StrokeStyle` objects. Update `resolvePaint` and `ShapeGenerator` to align with Flutter's dual-Paint approach.
- [x] **Generator Robustness & Error Reporting**:
    - [x] Replace silent continues with explicit generator errors.
    - [x] Implement helpful console error messages for malformed SVGs or unsupported features.
- [x] **Standardization**:
    - [x] Convert code to use dot shorthand for enum values and static members consistently.
    - [x] Standardize extension naming (e.g., `To[Target]`).
    - [x] Cleanly integrate `StrokeCap.toFlutterString()` (currently duplicated/loosely placed).
- [x] **Stroke Simplification**: Use a shared `StrokeStyle` or mixin across layers to reduce constructor boilerplate.

### Phase 1.5: Test Hardening & Quality Assurance (Immediate Priority)
*Addressing critical coverage gaps before adding feature complexity.*

- [x] **SVG Transform Parser Tests**: Verify `translate`, `scale`, `rotate`, `skewX`, `skewY`, and `matrix` parsing, including chaining and edge cases.
- [x] **Path Data Parser Tests**: Verify all SVG path commands (M, L, H, V, C, S, Q, T, A, Z) including relative/absolute variants, optional whitespace, and comma handling.
- [x] **Paint Resolver Tests**: Verify style inheritance, CSS precedence (inline > attribute > inherited), and unit conversion context.

#### Code Generation Tests
- [x] **Generation - Shapes**: Unit tests for `CircleGenerator`, `OvalGenerator`, `LineGenerator`, and `RectGenerator`.
- [x] **Generation - Paths & Polys**: Unit tests for `PathGenerator` and `PolyGenerator` (Polygon/Polyline).
- [x] **Generation - Text & Groups**: Unit tests for `TextGenerator` and `GroupGenerator`.
- [x] **Generation - Gradients**: Unit tests for `LinearGradientGenerator` and `RadialGradientGenerator`.

#### XML Conversion Tests
- [x] **XML Conversion - Shapes**: Unit tests for `ToSvgCircle`, `ToSvgEllipse`, `ToSvgLine`, and `ToSvgRect`.
- [x] **XML Conversion - Paths & Polys**: Unit tests for `ToSvgPath`, `ToSvgPolygon`, and `ToSvgPolyline`.
- [x] **XML Conversion - Text & Containers**: Unit tests for `ToSvgText`, `ToSvgGroup`, `ToSvgSvg`, `ToSvgUse`, and `ToSvgDefs`.
- [x] **XML Conversion - Gradients**: Unit tests for `ToSvgLinearGradient`, `ToSvgRadialGradient`, and `ToSvgStop`.

- [x] **Refactor Tests to Mirror Lib Structure**: Reorganize all unit tests to exactly mirror the `lib/` directory structure (1:1 mapping of source file to test file), ensuring strict discoverability and maintainability.
- [x] **Coverage Helper**: Create a tool to generate a `coverage_helper_test.dart` that imports all library files, ensuring the coverage report reflects the true codebase size (including currently untested files).
- [x] **Refactor Unit Test Imports**: Update all unit tests to import the specific file under test directly (e.g., `import '.../rect_generator.dart'`) instead of using barrel files or the public API, ensuring a clean and direct dependency for each test.

#### Coverage Finalization (Addressing identified gaps)
- [x] **SVG to Painting Extensions**: Add unit tests for `svg_element_extensions` (e.g., `svg_path_to_draw_path`, `svg_line_to_draw_line`) to verify mapping from SVG model to Painting commands.
- [x] **Value Resolution Logic**: Add comprehensive tests for `svg_length_to_double` covering all SVG units and `svg_transform_parser` edge cases.
- [x] **String Parsing Extensions**: Add unit tests for `xml_conversion/string_extensions` (e.g., `to_svg_length`, `to_svg_stroke_linecap`).
- [x] **Generator Infrastructure**: Add basic unit tests for `svg_painter_generator.dart` logic where feasible.

#### Coverage Finalization - Part 2 (Low-hanging fruit)
- [x] **Equality Audit**: Audit all classes for unused `operator ==` and `hashCode` overrides. Remove them if they are not used for logic (e.g., in Sets or Map keys) to adhere to YAGNI. List any exceptions.
- [x] **Painting Model Coverage**: Add unit tests for `toString` for all classes in `lib/src/painting_model/` (commands and styles).
- [x] **SVG Model Coverage**: Add unit tests for `toString` and data integrity for `lib/src/svg_model/` classes (elements, attributes, values).
- [x] **Path Operation Coverage**: Verify data integrity for all `PathOperation` subclasses.
- [x] **Constant & Config Regression Tests**: Add regression tests for critical constants and mappings (e.g., `svgColorNameMap`, unit conversion factors, enum-to-string mappings) to prevent accidental modification.
- [ ] **Test Quality Audit**: Systematically audit **ALL** unit tests to ensure:
    [x] **Distinct Values**: Properties (x/y, width/height) use unique values to detect swapped variable bugs.
    [x] **Asymmetric Context**: Test contexts use asymmetric dimensions (e.g., 100x200) to detect swapped scaling factors.
    [ ] **AAA Pattern**: All tests strictly follow the Arrange-Act-Assert structure with comments.

- [ ] **Test Value Audit**: Audit all unit tests to ensure distinct values are used for different properties (e.g., x != y, width != height) to prevent swapped property bugs from going undetected.

- [ ] **Coverage Analysis & Finalization**: Analyze the final coverage report, identify remaining gaps, and implement necessary tests to reach a high confidence level (aiming for >90% branch coverage on core logic).

### Phase 2: Dynamic Properties & Customizable Widget (Heart of Value Prop)
*The core differentiator: creating plug-and-play components.*

- [ ] **Property Mapping Strategy**: Define the rule set for exposing properties (e.g., `id="circle1"` -> `circle1Fill`). Implement `IdentifierSanitizer`.
- [ ] **Dynamic Fill/Stroke Colors**: Generate `final Color? [id]Fill` and `final Color? [id]Stroke` fields.
- [ ] **Daphnia Widget Generation**:
    - [ ] Generate a convenience `StatelessWidget` (e.g., `MyIcon`) that wraps the `CustomPainter`.
    - [ ] Expose all "Dynamic Properties" as constructor arguments in the generated Widget.
    - [ ] Implement `BoxFit` and `Alignment` support in the generated Widget.
- [ ] **"CurrentColor" Support**: Map `currentColor` to a primary `color` property on the Widget (matching Flutter's `Icon` behavior).

### Phase 3: Essential Elements & MVP Release (0.1.0)
*Reaching standard compatibility and publishing the first stable version.*

- [ ] **Structural Elements**: `<symbol>`, `<tspan>`, `<defs>`.
- [ ] **Referencing & External Assets**: `<image>`, `<use>`.
- [ ] **Clipping & Masking**: `<clipPath>`, `<mask >`.
- [ ] **Accessibility (Semantic Mapping)**: Map `<title>` and `<desc>` automatically to Flutter's `Semantics` widget in the generated code.
- [ ] **Essential Attributes**: `text-anchor`, `fill-rule`, `stroke-dashoffset`, `stroke-miterlimit`, `paint-order`, `vector-effect`, `dx`, `dy`, `preserveAspectRatio`.
- [ ] **Font Management (Release Ready)**: Implement `AssetExporter` to automatically handle bundled fonts for the user.
- [ ] **Release Preparation**:
    - [ ] **Documentation**: Write comprehensive READMEs and full API documentation.
    - [ ] **Validation**: Add comprehensive tests for all `BoxFit` values.
    - [ ] **CI/CD**: Setup GitHub Actions for automated testing and linting.
    - [ ] **Publishing**: Perform dry runs and publish 0.1.0 to pub.dev.

---

## Post-MVP Roadmap

### Phase 4: Recommended "Wise-to-Have" Features (0.2.0)
- [ ] **Advanced Pathing**: `<marker>` support and `context-fill`/`context-stroke` keywords.
- [ ] **Text along Curves**: `<textPath>` implementation.
- [ ] **Containers**: `<switch>` for conditional rendering.
- [ ] **Basic Filters**: `<filter>`, `<feGaussianBlur>`, `<feOffset>`, `<feDropShadow>`, `<feMerge>`, `<feFlood>`.
- [ ] **Patterns**: `<pattern>` for repeating fills.
- [ ] **Gradients (Polish)**: `objectBoundingBox` and `spreadMethod`.

### Phase 5: Advanced Units & Path Syntax (0.3.0)
- [ ] **SVG 2 Path Syntax**: Robust tokenizer for compact arc syntax (concatenated flags).
- [ ] **Relative Units**: Support for `em`, `ex`, and other CSS relative units.
- [x] **Result Ergonomics**: Add ergonomic extensions (e.g., `combine()`) to simplify list folding and result aggregation in `Result`.

### Phase 6: Niche & Future Roadmap (1.0.0+)
- [ ] **SMIL Animation**: `<animate>`, `<animateMotion>`, etc.
- [ ] **Complex Filter Primitives**: Lighting, turbulence, displacement maps, color matrices.
- [ ] **Interactive Elements**: Event handling (taps, hovers) for SVG shapes.
- [ ] **Misc Attributes**: Rendering hints and CSS interpolation properties.
