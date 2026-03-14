# SVG Painter Monorepo Overview

This monorepo provides a high-performance, type-safe, and customizable SVG-to-Flutter code generation engine. It transforms SVG assets into efficient `CustomPainter` and `StatelessWidget` code.

## Monorepo Structure

- **`svg_painter`**: The core engine. Contains the code generator (`build_runner`), SVG/XML models, and the transformation pipeline.
- **`svg_painter_annotation`**: Minimal package defining the `@SvgPainter` annotation to trigger generation.
- **`svg_painter_fixtures`**: A collection of SVG test inputs (MDN, W3C, Wikimedia) used for validation.
- **`svg_painter_tests`**: Integration and golden regression tests verifying the generator's output.
- **`example`**: A Flutter application demonstrating generated painters and widgets.

## `svg_painter` Architectural Pipeline

The engine operates as a strict, unidirectional layered pipeline:

1.  **Base Layer (`base/`)**: Shared primitives (`Result`, `SvgOrientation`) and common error handling.
2.  **XML Model Layer (`xml_model/`)**: A structural representation of XML (elements, attributes).
3.  **XML Conversion Layer (`xml_conversion/`)**: Logic to parse XML strings and map raw XML attributes into structured SVG values.
4.  **SVG Domain Model Layer (`svg_model/`)**: A spec-compliant representation of SVG (e.g., `SvgRect`, `SvgCircle`, `SvgLength`). It uses mixins (e.g., `SvgFillAttributable`) for shared presentation attributes.
5.  **SVG Conversion Layer (`svg_conversion/`)**: The "Brain" of the engine.
    - **`svg_paint_resolver`**: Resolves style inheritance, CSS precedence, and attribute priority.
    - **`svg_painting_context`**: Manages viewports, coordinate systems, and unit conversions (%, px, em, etc.).
    - **`svg_to_painting`**: Transforms SVG elements into intermediate `PaintCommand`s.
6.  **Painting Model Layer (`painting_model/`)**: A Flutter-oriented intermediate representation (e.g., `DrawRect`, `FillStyle`).
7.  **Generation Layer (`generation/`)**:
    - **`PaletteAnalyzer`**: Discovers colors for dynamic property exposure.
    - **`ShapeGenerator`s**: Emits optimized Dart/Flutter drawing code for each command.
8.  **Entry Point (`svg_painter_generator.dart`)**: Orchestrates the entire pipeline from `build_runner`.

## Foundational Mandates

### Coding Standards
- **Strict Typing**: Specify explicit types for all declarations (`always_specify_types: true`).
- **Enum Shorthands**: Use dot shorthands (e.g., `.horizontal`) when the context type is clear.
- **SVG-Truthful Naming**: Match the SVG spec terminology (e.g., `SvgFontAttributable` for `fontAttributes`).
- **No Bang Operators**: Avoid `!` unless absolutely necessary; use safe null-handling or defensive checks.

### Testing Conventions
- **Mirroring**: Unit tests in `svg_painter/test/src` MUST exactly mirror the `lib/src` directory structure.
- **Isolation**: Unit tests MUST import the specific file under test directly; avoid barrel files.
- **AAA Pattern**: Strictly follow **Arrange-Act-Assert** with clear phase comments.
- **Robustness**: Use distinct values (x: 10, y: 20) and asymmetric contexts (100x200) to catch variable swaps.

## Development Philosophy

All contributions MUST adhere to these core engineering principles:

- **KISS (Keep It Simple, Stupid)**: Favor simple, readable solutions over complex architectures. Avoid over-engineering and unnecessary abstractions.
- **YAGNI (You Ain't Gonna Need It)**: Do not add functionality until it is explicitly required. Focus on the task at hand.
- **DRY (Don't Repeat Yourself)**: Consolidate logic into reusable components, but not at the expense of readability (avoid "DRYing" code into unreadable abstractions).
- **SOLID**:
    - *Single Responsibility*: Each class/method should do one thing.
    - *Open/Closed*: Design for extension, not modification.
    - *Liskov Substitution*: Subtypes must be substitutable for their base types.
    - *Interface Segregation*: Prefer many specific interfaces over one general-purpose one.
    - *Dependency Inversion*: Depend on abstractions, not concretions.

## Validation Protocol

A task is considered **DONE** and the codebase is considered **STABLE** only when the following five-step protocol passes with zero issues:

1.  **Static Analysis**: Run `analyze_files` (or `dart analyze .`) on the entire monorepo. There must be 0 errors, warnings, or lints.
2.  **Unit Testing**: Run `run_tests` in `svg_painter` and `svg_painter_annotation`. All tests must pass (100% regression testing).
3.  **Code Regeneration**: Run `dart run build_runner build --delete-conflicting-outputs` in `svg_painter_tests` and `example`. This ensures the generator itself is functional and the generated code is syntactically correct.
4.  **Golden/Integration Testing**: Run `flutter test` in `svg_painter_tests`. This verifies that changes to the generator or transformation logic have not introduced visual regressions.
    - *Note*: If visual changes are expected/intended, use `flutter test --update-goldens` and confirm the diffs.
5.  **Dependency Validation**: Run `dart pub global run dependency_validator` in all modified packages. All imports and dependencies must be correctly declared.

**NEVER** assume success until all five steps have been verified. Any failure at any step requires returning to the execution phase.

### Operational Rules
- **No Commits**: The agent NEVER commits code; the user manages all git operations.
- **Step-by-Step**: Stop and wait for a "proceed" command after every major task or plan proposal.
- **Spec Compliance**: Encountering unsupported SVG features requires explicit user consultation before implementation.

Standing by for your 'proceed' command to execute this plan.
