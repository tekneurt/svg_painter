# SvgPainter Example

A Flutter application demonstrating compile-time SVG generation with `svg_painter` and `svg_painter_annotation`.

---

## How to Run

1. Navigate to the example directory:
   ```bash
   cd example
   ```
2. (Optional) Re-run code generation:
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```
3. Run the application:
   ```bash
   flutter run -d chrome # or macos, linux, windows, etc.
   ```

---

## What It Demonstrates

* **Compile-Time Code Generation**: Uses `@SvgCodePainter` with an SVG fixture to generate a dedicated `CustomPainter` and `StatelessWidget`.
* **Zero Runtime Overhead**: The SVG is compiled to native Flutter Canvas operations at build time with no runtime XML parsing.
* **Component Usage**: Demonstrates rendering the generated painter and widget directly in a standard Flutter UI hierarchy.
