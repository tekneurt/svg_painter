import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

enum SvgTestType { mdn, w3c, various, custom }

/// The type of golden test to run.
///
/// - [fixed]: Fixed 200x200 size test (golden: `name_fixed.png`)
/// - [viewBox]: ViewBox-sized test matching SVG's natural dimensions (golden: `name_viewBox.png`)
enum GoldenTestType { fixed, viewBox }

/// Default golden tests configuration: run both fixed and viewBox tests
/// with no platform-specific overrides.
///
/// The map controls test execution and platform-specific golden file selection:
/// - **Key presence** determines if the test runs
/// - **Value of null** means no platform override (use base golden file)
/// - **Value with platforms** means those platforms use `name.{platform}.png`
///
/// ## Usage Examples
///
/// ```dart
/// // Standard: run both tests, no platform overrides
/// tests: defaultGoldenTests,
///
/// // Only viewBox test needs macOS-specific golden (e.g., 1px anti-aliasing diff)
/// tests: <GoldenTestType, Set<TargetPlatform>?>{
///   GoldenTestType.fixed: null,
///   GoldenTestType.viewBox: <TargetPlatform>{TargetPlatform.macOS},
/// },
///
/// // Both tests need macOS-specific goldens (e.g., text rendering differences)
/// tests: <GoldenTestType, Set<TargetPlatform>?>{
///   GoldenTestType.fixed: <TargetPlatform>{TargetPlatform.macOS},
///   GoldenTestType.viewBox: <TargetPlatform>{TargetPlatform.macOS},
/// },
///
/// // Skip viewBox test entirely
/// tests: <GoldenTestType, Set<TargetPlatform>?>{
///   GoldenTestType.fixed: null,
/// },
/// ```
///
/// ## Adding Platform Overrides
///
/// When CI fails due to platform rendering differences:
/// 1. Identify which test variant failed (fixed or viewBox)
/// 2. Add the platform to that test type's override set
/// 3. Add a comment documenting the pixel difference (e.g., "1px gradient diff")
/// 4. Generate platform-specific golden: `flutter test --update-goldens`
/// 5. Generate CI golden via Docker: `docker run ... flutter test --update-goldens`
const Map<GoldenTestType, Set<TargetPlatform>?> defaultGoldenTests = <GoldenTestType, Set<TargetPlatform>?>{
  GoldenTestType.fixed: null,
  GoldenTestType.viewBox: null,
};

/// Returns the current host platform as a [TargetPlatform].
TargetPlatform get currentPlatform => switch (Platform.operatingSystem) {
  'macos' => TargetPlatform.macOS,
  'linux' => TargetPlatform.linux,
  'windows' => TargetPlatform.windows,
  'android' => TargetPlatform.android,
  'ios' => TargetPlatform.iOS,
  'fuchsia' => TargetPlatform.fuchsia,
  _ => throw UnsupportedError('Unknown platform: ${Platform.operatingSystem}'),
};

/// Converts a [TargetPlatform] to a snake_case file suffix.
///
/// Uses snake_case for file system compatibility (case-insensitive systems).
/// Examples: `macOS` → `mac_os`, `iOS` → `i_os`, `linux` → `linux`
String platformToFileSuffix(TargetPlatform platform) {
  return switch (platform) {
    TargetPlatform.macOS => 'mac_os',
    TargetPlatform.iOS => 'i_os',
    TargetPlatform.linux => 'linux',
    TargetPlatform.windows => 'windows',
    TargetPlatform.android => 'android',
    TargetPlatform.fuchsia => 'fuchsia',
  };
}

/// Returns the golden filename based on platform-specific requirements.
///
/// If [platforms] contains the current platform, returns `name.{platform}.png`
/// with the platform in snake_case (e.g., `name.mac_os.png`).
/// Otherwise returns `name.png`.
String goldenFileName(String name, Set<TargetPlatform>? platforms) {
  if (platforms?.contains(currentPlatform) ?? false) {
    return '$name.${platformToFileSuffix(currentPlatform)}.png';
  }
  return '$name.png';
}

Future<void> loadTestFonts() async {
  final families = <String, String>{
    'Roboto': '../svg_painter/assets/fonts/roboto',
    'Noto Serif': '../svg_painter/assets/fonts/noto_serif',
    'Roboto Mono': '../svg_painter/assets/fonts/roboto_mono',
  };

  for (final MapEntry<String, String> entry in families.entries) {
    final String familyName = entry.key;
    final dir = Directory(entry.value);

    if (!dir.existsSync()) {
      continue;
    }

    final loader = FontLoader(familyName);
    final List<FileSystemEntity> files = dir.listSync();

    for (final file in files) {
      if (file is File && file.path.endsWith('.ttf')) {
        final ByteData data = await file.readAsBytes().then((Uint8List bytes) {
          return ByteData.view(Uint8List.fromList(bytes).buffer);
        });
        loader.addFont(Future<ByteData>.value(data));
      }
    }
    await loader.load();
  }
}

Future<void> testSvgPainter({
  required WidgetTester tester,
  required CustomPainter painter,
  required String goldenName,
  String goldenPath = 'goldens',
  Size size = const Size(100, 100),
}) async {
  // Set window properties for consistent goldens and exact framing
  tester.view.devicePixelRatio = 1.0;
  final containerSize = Size(size.width + 20, size.height + 20); // Account for 10px border
  tester.view.physicalSize = containerSize;

  await tester.pumpWidget(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Center(
        child: Container(
          width: containerSize.width,
          height: containerSize.height,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.red, width: 10),
            color: Colors.grey[200],
          ),
          child: CustomPaint(size: size, painter: painter),
        ),
      ),
    ),
  );

  await expectLater(find.byType(Container), matchesGoldenFile('$goldenPath/$goldenName'));

  // Reset for next test
  tester.view.resetDevicePixelRatio();
  tester.view.resetPhysicalSize();
}

Future<void> testSvgWidget({
  required WidgetTester tester,
  required Widget widget,
  required String goldenName,
  String goldenPath = 'goldens',
  Size size = const Size(100, 100),
}) async {
  tester.view.devicePixelRatio = 1.0;
  final containerSize = Size(size.width + 20, size.height + 20);
  tester.view.physicalSize = containerSize;

  await tester.pumpWidget(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Center(
        child: Container(
          width: containerSize.width,
          height: containerSize.height,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.red, width: 10),
            color: Colors.grey[200],
          ),
          child: SizedBox(width: size.width, height: size.height, child: widget),
        ),
      ),
    ),
  );

  // Wait for async image decoding
  await tester.runAsync(() async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
  });
  await tester.pumpAndSettle();

  await expectLater(find.byType(Container), matchesGoldenFile('$goldenPath/$goldenName'));

  tester.view.resetDevicePixelRatio();
  tester.view.resetPhysicalSize();
}

Future<void> testSvgWidgetNative({
  required WidgetTester tester,
  required Widget widget,
  required String goldenName,
  String goldenPath = 'goldens',
  required Size size,
}) async {
  tester.view.devicePixelRatio = 1.0;
  tester.view.physicalSize = size;

  await tester.pumpWidget(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Center(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: widget,
        ),
      ),
    ),
  );

  // Wait for async image decoding
  await tester.runAsync(() async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
  });
  await tester.pumpAndSettle();

  await expectLater(find.byType(SizedBox), matchesGoldenFile('$goldenPath/$goldenName'));

  tester.view.resetDevicePixelRatio();
  tester.view.resetPhysicalSize();
}

/// Tests the painter without a defined size, relying on its "native" resolution
/// (which in our implementation should correspond to the viewBox).
Future<void> testSvgPainterNative({
  required WidgetTester tester,
  required CustomPainter painter,
  required String goldenName,
  String goldenPath = 'goldens',
}) async {
  tester.view.devicePixelRatio = 1.0;

  // Use the viewBox getter if available (generated by SvgPainterGenerator)
  // to set the exact surface size.
  final size = (painter as dynamic).viewBox as Size;
  tester.view.physicalSize = size;

  await tester.pumpWidget(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Center(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: CustomPaint(painter: painter),
        ),
      ),
    ),
  );

  await expectLater(find.byType(SizedBox), matchesGoldenFile('$goldenPath/$goldenName'));

  tester.view.resetDevicePixelRatio();
  tester.view.resetPhysicalSize();
}

/// Runs golden tests for a painter based on the [tests] configuration.
///
/// The [tests] map determines which tests run and their platform overrides:
/// - Key presence means the test will run
/// - Value of null means no platform-specific golden needed
/// - Value with platforms means those platforms use platform-specific goldens
///
/// Use [defaultGoldenTests] for the common case of running both tests with
/// no platform overrides.
Future<void> testDualResolutionPainter({
  required WidgetTester tester,
  required CustomPainter painter,
  required String name,
  required SvgTestType type,
  required Map<GoldenTestType, Set<TargetPlatform>?> tests,
  String? folder,
}) async {
  final String goldenPath = folder != null ? '$folder/goldens' : 'goldens';

  if (tests.containsKey(GoldenTestType.fixed)) {
    await testSvgPainter(
      tester: tester,
      painter: painter,
      goldenName: goldenFileName('${name}_fixed', tests[GoldenTestType.fixed]),
      goldenPath: goldenPath,
      size: const Size(200, 200),
    );
  }

  if (tests.containsKey(GoldenTestType.viewBox)) {
    await testSvgPainterNative(
      tester: tester,
      painter: painter,
      goldenName: goldenFileName('${name}_viewBox', tests[GoldenTestType.viewBox]),
      goldenPath: goldenPath,
    );
  }
}

Future<void> testDualResolutionWidget({
  required WidgetTester tester,
  required Widget widget,
  required String name,
  required SvgTestType type,
  required Map<GoldenTestType, Set<TargetPlatform>?> tests,
  required Size nativeSize,
  String? folder,
}) async {
  final String goldenPath = folder != null ? '$folder/goldens' : 'goldens';

  if (tests.containsKey(GoldenTestType.fixed)) {
    await testSvgWidget(
      tester: tester,
      widget: widget,
      goldenName: goldenFileName('${name}_fixed', tests[GoldenTestType.fixed]),
      goldenPath: goldenPath,
      size: const Size(200, 200),
    );
  }

  if (tests.containsKey(GoldenTestType.viewBox)) {
    await testSvgWidgetNative(
      tester: tester,
      widget: widget,
      goldenName: goldenFileName('${name}_viewBox', tests[GoldenTestType.viewBox]),
      goldenPath: goldenPath,
      size: nativeSize,
    );
  }
}
