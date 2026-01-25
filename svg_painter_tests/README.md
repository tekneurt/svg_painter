# svg_painter_tests

This package contains the golden test suite for the `svg_painter` code generator. Its purpose is to validate that SVG files, after being transformed into Flutter `CustomPainter` code, render as expected.

## Usage

This package is not intended for direct consumption. It serves as an internal testing utility for the `svg_painter` project.

## Running Golden Tests

### On Linux (or CI)

```bash
cd svg_painter_tests
flutter test --update-goldens # To generate/update golden files
flutter test                  # To run tests against existing golden files
```

### On macOS (via Docker)

Golden files are sometimes rendered differently on macOS vs Linux due to platform-specific anti-aliasing and sub-pixel rendering. To ensure consistency with CI (which runs on Linux), **always generate golden files using Linux rendering**.

**Prerequisites:** Install [Docker Desktop](https://www.docker.com/products/docker-desktop/) for macOS.

```bash
# Pull the Flutter Docker image (one-time)
docker pull ghcr.io/cirruslabs/flutter:3.38.5
```

Run the following commands **from the repository root**:

```bash
# Run tests
docker run --rm -v "$(pwd)":/app ghcr.io/cirruslabs/flutter:3.38.5 \
  bash -c "dart pub get -C /app/svg_painter_annotation && \
           dart pub get -C /app/svg_painter_fixtures && \
           dart pub get -C /app/svg_painter && \
           flutter pub get -C /app/svg_painter_tests && \
           cd /app/svg_painter_tests && flutter test"
```

```bash
# Update golden files
docker run --rm -v "$(pwd)":/app ghcr.io/cirruslabs/flutter:3.38.5 \
  bash -c "dart pub get -C /app/svg_painter_annotation && \
           dart pub get -C /app/svg_painter_fixtures && \
           dart pub get -C /app/svg_painter && \
           flutter pub get -C /app/svg_painter_tests && \
           cd /app/svg_painter_tests && flutter test --update-goldens"
```

The `-v "$(pwd)":/app` flag mounts your local directory, so updated goldens are written directly to your filesystem with Linux-rendered pixels.

## Platform-Specific Goldens

Some tests may render with minor pixel differences across platforms (e.g., anti-aliasing on curves, gradients, or text rendering). For these cases, the test can specify which platforms need separate golden files using the `platforms` parameter:

```dart
// In the test fixture list:
(painter: const CyPainter(), name: 'cy_painter', platforms: {TargetPlatform.macOS}),
```

Golden file naming:
- **Default:** `painter_name.png` (used when `platforms` is null or current platform not in set)
- **Platform-specific:** `painter_name.{platform}.png` (e.g., `painter_name.macOS.png`, `painter_name.android.png`)

When a test fails in CI due to platform rendering differences:
1. Add `platforms: {TargetPlatform.macOS}` (or relevant platform) to the test
2. Run `flutter test --update-goldens` locally to generate `name.macOS.png`
3. Run Docker to generate the Linux golden `name.png`
4. Commit both golden files

## Test Structure

Golden tests are organized to mirror the structure of the `svg_painter_fixtures` package, allowing for clear correlation between SVG examples and their visual tests. For instance, tests for MDN element examples can be found under `test/src/mdn/elements/`.