# svg_painter_tests

This package contains the golden test suite for the `svg_painter` code generator. Its purpose is to validate that SVG files, after being transformed into Flutter `CustomPainter` code, render as expected.

## Usage

This package is not intended for direct consumption. It serves as an internal testing utility for the `svg_painter` project.

## Golden Test Architecture

### Test Types

Each painter is tested with two golden variants:

- **`_fixed.png`**: Rendered at a fixed 200x200 size (tests scaling behavior)
- **`_viewBox.png`**: Rendered at the SVG's native viewBox dimensions (tests pixel-perfect rendering)

### The Cross-Platform Rendering Problem

Golden tests compare rendered images pixel-by-pixel. However, **identical code can render differently across CPU architectures**:

- GitHub Actions CI runs on **x86 Linux** machines
- Most developers use **ARM-based Macs** (M1/M2/M3)
- Even with identical Docker images, subtle differences occur in:
  - Font anti-aliasing
  - Gradient interpolation
  - Curve/path anti-aliasing
  - Sub-pixel rendering

This is a [well-documented Flutter issue](https://github.com/flutter/flutter/issues/131559). The differences are typically 1-10 pixels (< 0.1%), but enough to fail exact-match golden tests.

### Solution: Platform-Specific Goldens

Instead of adding tolerance (which could mask real bugs), we use **explicit platform-specific golden files**:

```
painter_name_fixed.png          # Linux golden (used by CI)
painter_name_fixed.mac_os.png   # macOS golden (used locally on Mac)
painter_name_viewBox.png        # Linux golden
painter_name_viewBox.mac_os.png # macOS golden
```

**Note:** Platform suffixes use snake_case (`mac_os`, `i_os`) for file system compatibility with case-insensitive systems.

The test framework automatically selects the correct golden based on the current platform.

### Overwrite Protection

When a platform override is configured for a test, running `--update-goldens` on that platform writes to the **platform-specific file**, not the base file:

- On macOS with override: writes to `name.mac_os.png`
- On Linux (CI): writes to `name.png`

This prevents accidentally overwriting CI-generated goldens when running tests locally.

## Running Golden Tests

### On macOS (Local Development)

```bash
cd svg_painter_tests
flutter test                  # Run tests (uses .mac_os.png goldens where available)
flutter test --update-goldens # Update macOS goldens
```

### On Linux (Native or Docker)

```bash
cd svg_painter_tests
flutter test                  # Run tests (uses base .png goldens)
flutter test --update-goldens # Update Linux goldens
```

### Via Docker on macOS

To generate Linux-compatible goldens locally, use Docker:

```bash
# From repository root
docker run --rm -v "$(pwd):/app" -w /app/svg_painter_tests \
  ghcr.io/cirruslabs/flutter:3.38.5 \
  bash -c "flutter pub get && flutter test --update-goldens"
```

**Important**: Due to CPU architecture differences (x86 emulation on ARM), local Docker may still produce slightly different images than GitHub CI. For guaranteed CI-compatible goldens, use the GitHub workflow below.

## Generating CI-Compatible Goldens

When tests fail in CI due to architecture differences, use the **Generate Golden Files** GitHub workflow:

### Step 1: Trigger the Workflow

1. Go to **Actions** → **Generate Golden Files**
2. Click **Run workflow**
3. Enter parameters:
   - `test_pattern`: Regex pattern for test names (e.g., `cy_painter`, `fy_.*_painter`, or `.*` for all)
   - `test_file`: (Optional) Specific test file path

### Step 2: Download the Artifacts

1. Wait for the workflow to complete
2. Download the `golden-files` artifact
3. Extract the ZIP file

### Step 3: Review and Commit

1. Copy **only the failing test's** `.png` files to the appropriate `goldens/` directories
   - The workflow generates all matching goldens, but you only need the ones that actually failed
   - Do NOT blindly copy all generated files
2. Review the images to ensure they look correct
3. Commit and push the changes

### Example: Fixing a CI Failure

```bash
# CI fails with: "cy_painter_viewBox.png: 1px diff detected"

# 1. Trigger workflow with test_pattern: "cy_painter"
# 2. Download golden-files.zip
# 3. Extract and copy:
unzip golden-files.zip
cp test/src/mdn/attributes/goldens/cy_painter_viewBox.png \
   svg_painter_tests/test/src/mdn/attributes/goldens/

# 4. Commit
git add svg_painter_tests/test/src/mdn/attributes/goldens/cy_painter_viewBox.png
git commit -m "Update cy_painter_viewBox golden from CI"
git push
```

## Test Configuration

### Default Configuration

Most tests use the default configuration (both test types, no platform overrides):

```dart
(painter: const RectPainter(), name: 'rect_painter', tests: defaultGoldenTests),
```

### Platform-Specific Overrides

When a test has platform rendering differences, specify which test types need platform-specific goldens:

```dart
// Only viewBox test differs on macOS (e.g., 1px gradient anti-aliasing)
(painter: const CyPainter(), name: 'cy_painter', tests: <GoldenTestType, Set<TargetPlatform>?>{
  GoldenTestType.fixed: null,  // Use base golden on all platforms
  GoldenTestType.viewBox: <TargetPlatform>{TargetPlatform.macOS},  // macOS uses .mac_os.png
}),

// Both test types differ on macOS (e.g., text anti-aliasing)
(painter: const TextPainter(), name: 'text_painter', tests: <GoldenTestType, Set<TargetPlatform>?>{
  GoldenTestType.fixed: <TargetPlatform>{TargetPlatform.macOS},
  GoldenTestType.viewBox: <TargetPlatform>{TargetPlatform.macOS},
}),

// Skip a test type entirely
(painter: const SomePainter(), name: 'some_painter', tests: <GoldenTestType, Set<TargetPlatform>?>{
  GoldenTestType.fixed: null,  // Only run fixed test
}),
```

### Adding a Platform Override

When CI fails due to platform rendering differences:

1. **Identify the test and variant** from the CI error:
   ```
   Golden "attributes/goldens/cy_painter_viewBox.png": 1px diff detected
   ```

2. **Update the test configuration** with a comment explaining the difference:
   ```dart
   // cy_painter: 1px radial gradient anti-aliasing diff on viewBox test (macOS)
   (painter: const CyPainter(), name: 'cy_painter', tests: <GoldenTestType, Set<TargetPlatform>?>{
     GoldenTestType.fixed: null,
     GoldenTestType.viewBox: <TargetPlatform>{TargetPlatform.macOS},
   }),
   ```

3. **Generate the macOS golden** locally:
   ```bash
   flutter test --update-goldens --name="cy_painter"
   ```
   This creates `cy_painter_viewBox.mac_os.png`

4. **Generate the Linux golden** via GitHub workflow (or keep existing if it was correct)

5. **Commit both goldens**

## Golden File Naming Convention

| File Name | Description |
|-----------|-------------|
| `name_fixed.png` | Fixed 200x200 test, Linux/default golden |
| `name_fixed.mac_os.png` | Fixed 200x200 test, macOS-specific golden |
| `name_viewBox.png` | ViewBox-sized test, Linux/default golden |
| `name_viewBox.mac_os.png` | ViewBox-sized test, macOS-specific golden |

Platform suffixes use snake_case for case-insensitive file system compatibility:
- `mac_os` (not `macOS`)
- `i_os` (not `iOS`)
- `linux`, `windows`, `android`, `fuchsia` (already lowercase)

## Test Structure

Tests are organized to mirror `svg_painter_fixtures`:

```
test/
├── src/
│   ├── mdn/
│   │   ├── attributes/
│   │   │   ├── goldens/           # Golden images
│   │   │   ├── cx_painter.dart    # Painter under test
│   │   │   └── ...
│   │   ├── elements/
│   │   │   ├── goldens/
│   │   │   └── ...
│   │   ├── attributes_test.dart   # Test runner
│   │   └── elements_test.dart
│   ├── w3c/
│   │   └── ...
│   └── various/
│       └── ...
└── test_utils.dart                # Test utilities and configuration
```

## Troubleshooting

### "Pixel test failed, X px diff detected"

1. Check if it's a known platform difference (anti-aliasing, gradients, text)
2. If < 10px diff, likely architecture-related → use platform-specific goldens
3. If > 100px diff, likely a real rendering bug → investigate the painter code

### Local tests pass but CI fails

Your local Docker may render differently than GitHub CI due to emulation. Use the **Generate Golden Files** workflow to get exact CI-rendered goldens.

### "Golden file not found"

Run `flutter test --update-goldens` to generate missing golden files, then commit them.
