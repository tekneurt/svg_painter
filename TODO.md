# SVG Painter TODO

## Roadmap to MVP (0.1.0)

### Phase 1: High Priority Architecture & Refactoring
*Foundational work to enable dynamic properties and ensure a robust implementation.*

- [x] **PaintingStyle Composition**: Refactor the flat `PaintingStyle` into structured `FillStyle` and `StrokeStyle` objects. Update `resolvePaint` and `ShapeGenerator` to align with Flutter's dual-Paint approach.
- [x] **Generator Robustness & Error Reporting**:
    - [x] Replace silent continues with explicit generator errors.
    - [x] Implement helpful console error messages for malformed SVGs or unsupported features.
- [ ] **Standardization**:
    - [x] Convert code to use dot shorthand for enum values and static members consistently.
    - [x] Standardize extension naming (e.g., `To[Target]`).
    - [ ] Cleanly integrate `StrokeCap.toFlutterString()` (currently duplicated/loosely placed).
- [ ] **Stroke Simplification**: Use a shared `StrokeStyle` or mixin across layers to reduce constructor boilerplate.

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
