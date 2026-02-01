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
- [x] **Test Quality Audit**: Systematically audit **ALL** unit tests to ensure:
    [x] **Distinct Values**: Properties (x/y, width/height) use unique values to detect swapped variable bugs.
    [x] **Asymmetric Context**: Test contexts use asymmetric dimensions (e.g., 100x200) to detect swapped scaling factors.
    [x] **AAA Pattern**: All tests strictly follow the Arrange-Act-Assert structure with comments.

- [x] **Coverage Analysis & Finalization**: Analyze the final coverage report, identify remaining gaps, and implement necessary tests to reach a high confidence level (aiming for >90% branch coverage on core logic).
    [x] **String Extensions Tests**: Add tests for `lib/src/xml_model/extensions/string_extensions.dart`.
    [x] **Attribute Value Tests**: Add tests for `lib/src/xml_conversion/xml_attribute_name_extensions/to_default_value.dart`.
    [x] **SVG Model toString Tests**: Add missing `toString` tests for `lib/src/svg_model`.
    [x] Files without (any) test
    - [x] **Generation Tests**:
        [x] `lib/src/generation/command_generator.dart`
        [x] `lib/src/generation/generation_extensions.dart`
    - [x] **Painting Model Tests**:
        [x] `lib/src/painting_model/paint_command.dart`
        [x] `lib/src/painting_model/styles/painting_style.dart`
    - [x] **SVG Conversion Tests**:
        [x] `lib/src/svg_conversion/converters/svg_definition_collector.dart`
        [x] `lib/src/svg_conversion/converters/svg_radii_resolver.dart`
        [x] `lib/src/svg_conversion/svg_element_extensions/svg_ellipse_to_draw_oval.dart`
        [x] `lib/src/svg_conversion/svg_element_extensions/svg_gradient_to_painting.dart`
        [x] `lib/src/svg_conversion/svg_element_extensions/svg_rect_to_draw_rect.dart`
        [x] `lib/src/svg_conversion/svg_value_extensions/svg_auto_to_double.dart`
        [x] `lib/src/svg_conversion/svg_value_extensions/svg_length_percentage_to_double.dart`
        [x] `lib/src/svg_conversion/svg_value_extensions/svg_percentage_to_double.dart`
    - [x] **SVG Model Tests**:
        [x] `lib/src/svg_model/svg_style_sheet.dart`
    - [x] **XML Conversion Tests**:
        [x] `lib/src/xml_conversion/svg_style_parser.dart`
        [x] `lib/src/xml_conversion/xml_attribute_name_extensions/to_default_value.dart`
        [x] `lib/src/xml_conversion/xml_element_extensions/to_common_attributes.dart`
        [x] `lib/src/xml_conversion/xml_element_extensions/to_svg_style.dart`
        [x] `lib/src/xml_conversion/xml_element_extensions/to_svg_value.dart`
        [x] `lib/src/xml_conversion/xml_element_extensions/to_xml_attribute_value.dart`
    - [x] **XML Model Tests**:
        [x] `lib/src/xml_model/extensions/string_extensions.dart`
        [x] `lib/src/xml_model/xml_attribute_name.dart`
        [x] `lib/src/xml_model/xml_element_name.dart`
    - [x] **Low-Coverage File Hardening**:
        [x] **Builder Factory Tests**: Add a unit test for `lib/builder.dart` to verify builder initialization.
        [x] **Generator Core Hardening**: Expand tests for `generatePainterClass` and `_hasDashes` in `lib/src/svg_painter_generator.dart`.
        [x] **Base SVG Element toString Tests**: Ensure base `toString()` methods in `lib/src/svg_model/svg_element.dart` are fully covered.
        [x] **Default Value Exception Audit**: Systematically test all `UnsupportedError` paths in `to_default_value.dart`.
    - [x] **Final Coverage Check**: Verify high coverage (>90%).
    - [ ] **Bang Operator (Null Assertion) Audit**: Systematically audit the codebase for the `!` operator and replace it with safe null handling (positive equality checks, `if (x == null) ...`, or explicit `assert(x != null)`) to eliminate potential runtime crashes.
    - [ ] **Coverage Exception Audit**: Investigate all `// coverage:ignore-line` and `// coverage:ignore-start/end` markers across the codebase to determine if the ignored code can be safely tested or if the ignore markers are still justified.
    - [ ] **Hardening Coverage for 0.2.0 files**: Improve coverage for the following files to reach >95% patch coverage:
        - `command_generator.dart` (Current: ~87%)
        - `to_svg_value.dart` (Current: ~79%)
        - `palette_analyzer.dart` (Current: ~94%)
        - `circle_generator.dart` (Current: ~81%)
        - `line_generator.dart` (Current: ~84%)
        - `path_generator.dart` (Current: ~75%)
        - `svg_painter_generator.dart` (Current: ~98%)
    - [ ] **Improve Coverage for Low-Coverage Files**:
        - [ ] `oval_generator.dart` (Dash path logic)
        - [ ] `rect_generator.dart` (Dash path logic)
        - [ ] `svg_paint_resolver.dart` (Edge cases)
        - [ ] `svg_to_painting.dart` (Edge cases)
        - [ ] `to_svg_element.dart` (Missing element types)
    - [ ] **Strict Attribute Typing**: Refactor `PaintCommand` properties like `pathLength`, `opacity`, etc., from nullable primitives (`double?`) to non-nullable types or strict objects (e.g. `SvgValue`) to eliminate ambiguous null checks and align with SVG spec (e.g., `pathLength` must be > 0 or it's ignored).
    - [ ] **SVG Spec Compliance Audit**: Systematically review all parsing logic (points, paths, transforms, colors) against the SVG 1.1/2.0 "Error Processing" rules.
        - Ensure partial parsing stops correctly on invalid tokens.
        - Verify odd-length lists are handled (truncated or errored) as per spec for each attribute type.
        - Ensure invalid values (e.g. negative radius) result in spec-compliant behavior (ignore element vs ignore attribute).
    - [ ] **Strong Typing of Painting Model**: Audit all styles and commands to replace `String?` with dedicated Enums or value objects.
        - `PaintingTextStyle`: Refactor `fontWeight` (Enum/Number), `fontStyle` (Enum), and potentially `fontFamily`.
        - `PaintCommand`: Refactor `transform` string to a structured `List<TransformOperation>` or `Matrix4`.
        - Ensure all "magic strings" from the SVG spec are internalized into typed models before they reach the generators.


### Phase 2: Repository & Release Infrastructure (0.1.0)
*Setting up CI/CD, publishing pipeline, and releasing initial version.*

#### CI/CD & Quality
- [x] **License**: Add MIT LICENSE file to the repository.
- [x] **Branching Strategy**: Set up GitHub Flow with branch protection rules.
- [x] **CI/CD Pipeline**: Create GitHub Actions workflow for automated testing on push/PR.
- [x] **Code Coverage Reporting**: Integrate Codecov/Coveralls with CI and add coverage badge.
    - [x] *(Manual, post-merge)*: Set up Codecov account at codecov.io, add repo, and add `CODECOV_TOKEN` to GitHub Secrets.
- [x] **Platform-Aware Golden Tests**: Implement platform-specific golden file support for tests with unavoidable rendering differences between macOS and Linux.
- [ ] **DCM Integration**: Add DCM analysis to CI pipeline.
    - [ ] *(Manual)*: Waiting for OSS license approval from dcm.dev.

#### Release Preparation
- [x] **pubspec.yaml Metadata**: Add `repository`, `homepage`, and `issue_tracker` fields.
- [x] **pubspec.yaml Version**: Ensure version is set to 0.1.0.
- [x] **CHANGELOG.md**: Create changelog following Keep a Changelog format.
- [x] **README.md Review**: Ensure README is comprehensive and pub.dev friendly (installation, usage, examples).
- [x] **README Badges**: Add build status, coverage, and pub.dev version badges.
- [x] **Example Verification**: Verify example project works and demonstrates key features.

#### Publishing
- [x] **Dry Run**: Run `dart pub publish --dry-run` and fix any issues.
- [x] **Publish svg_painter_annotation 0.1.0**: Publish annotation package first.
- [x] **Update svg_painter dependency**: Change `svg_painter_annotation: ^0.0.1-alpha.1` to `^0.1.0`.
- [x] **Publish svg_painter 0.1.0**: Publish main package to pub.dev.
- [ ] **Verified Publisher**: Register domain (tekneurt.dev), verify on pub.dev, transfer package to publisher.

### Phase 3: Dynamic Properties & Customizable Widget (0.2.0)
*The core differentiator: creating plug-and-play components.*

- [x] **Property Mapping Strategy**: Define the rule set for exposing properties (e.g., `id="circle1"` -> `circle1Fill`). Implement `SvgIdFormatter`.
- [x] **Dynamic Fill/Stroke Colors**:
    - [x] **ID-Based Exposure**:
        - [x] Generate `final Color? [id]Fill` fields for explicit SVG fills.
        - [x] Generate `final Color? [id]Stroke` fields for explicit SVG strokes.
        - [x] Use named colors (e.g., `Colors.red`) in generated code when available instead of hex notation.
            - [x] Reverse-map ANY ARGB value to a matching Flutter `Colors` constant (e.g., `0xFFFFC107` -> `Colors.amber`) for readability.
    - [x] **Index-Based Exposure**: Generate `final Color? fill1`, `fill2`, etc. for elements without IDs, allowing control without modifying the SVG.
- [x] **Property Renaming Configuration**: Allow developers to map generated property names to semantic ones (e.g., map `fill1` to `backgroundFill` or `fillBottom`) via the annotation.
- [x] **Feature Documentation & Examples**:
    - [x] Document `SvgExposureMode` (None, ID, Indexed, Mixed) with visual examples.
    - [x] Document `propertyMapping` renaming using the Flag Recoloring (German -> Dutch) scenario.
    - [x] Document **Dynamic Style Inheritance** using the W3C group inheritance example.
    - [x] Update README.md with a "Customizing your SVG" section.
- [x] **Dynamic Style Inheritance**: Support runtime property overrides for inherited styles (e.g., overriding a group's `fill` should affect all children inheriting from it).
- [x] **Daphnia Widget Generation**:
    - [x] Generate a convenience `StatelessWidget` (e.g., `MyIcon`) that wraps the `CustomPainter`.
    - [x] Expose all "Dynamic Properties" as constructor arguments in the generated Widget.
    - [x] Implement `BoxFit` and `Alignment` support in the generated Widget.
- [x] **"CurrentColor" Support**: Map `currentColor` to a primary `color` property on the Widget (matching Flutter's `Icon` behavior).

### Phase 4: Essential Elements (0.3.0)
*Reaching standard compatibility with essential SVG elements.*

- [ ] **Structural Elements**: `<symbol>`, `<tspan>`, `<defs>`.
- [ ] **Referencing & External Assets**: `<image>`, `<use>`.
- [ ] **Clipping & Masking**: `<clipPath>`, `<mask >`.
- [ ] **Accessibility (Semantic Mapping)**: Map `<title>` and `<desc>` automatically to Flutter's `Semantics` widget in the generated code.
- [ ] **Essential Attributes**: `text-anchor`, `fill-rule`, `stroke-dashoffset`, `stroke-miterlimit`, `paint-order`, `vector-effect`, `dx`, `dy`, `preserveAspectRatio`.
- [ ] **Font Management (Release Ready)**: Implement `AssetExporter` to automatically handle bundled fonts for the user.
- [ ] **Release Preparation**:
    - [ ] **Documentation**: Write comprehensive READMEs and full API documentation.
    - [ ] **Validation**: Add comprehensive tests for all `BoxFit` values.
    - [ ] **Publishing**: Publish 0.3.0 to pub.dev.

---

## Post-MVP Roadmap

### Phase 5: Recommended "Wise-to-Have" Features (0.4.0)
- [ ] **Configurable Color Generation**: Add `colorMapping` option to `@SvgPainter`.
    - `material` (default): Use Flutter's `Colors.red`, `Colors.amber.shade200`.
    - `svg`: Use SVG constants like `Color(0xFFFF0000)` but potentially aliased to a generated `SvgColors` class for readability.
    - `hex`: Strict `Color(0xAARRGGBB)` usage.
- [ ] **Token-Based Global Coloring**: Allow a single property to control all occurrences of a specific color across the entire SVG, including both solid fills/strokes AND individual gradient stops (e.g., changing `red` to `yellow` globally).
- [ ] **Advanced Pathing**: `<marker>` support and `context-fill`/`context-stroke` keywords.
- [ ] **Text along Curves**: `<textPath>` implementation.
- [ ] **Containers**: `<switch>` for conditional rendering.
- [ ] **Basic Filters**: `<filter>`, `<feGaussianBlur>`, `<feOffset>`, `<feDropShadow>`, `<feMerge>`, `<feFlood>`.
- [ ] **Patterns**: `<pattern>` for repeating fills.
- [ ] **Gradients (Polish)**: `objectBoundingBox` and `spreadMethod`.

### Phase 6: Advanced Units & Path Syntax (0.5.0)
- [ ] **SVG 2 Path Syntax**: Robust tokenizer for compact arc syntax (concatenated flags).
- [ ] **Relative Units**: Support for `em`, `ex`, and other CSS relative units.
- [x] **Result Ergonomics**: Add ergonomic extensions (e.g., `combine()`) to simplify list folding and result aggregation in `Result`.

### Phase 7: Niche & Future Roadmap (1.0.0+)
- [ ] **SMIL Animation**: `<animate>`, `<animateMotion>`, etc.
- [ ] **Complex Filter Primitives**: Lighting, turbulence, displacement maps, color matrices.
- [ ] **Interactive Elements**: Event handling (taps, hovers) for SVG shapes.
- [ ] **Misc Attributes**: Rendering hints and CSS interpolation properties.
