# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.3.0] - 2026-03-23

### Changed

- **SDK Support**: Upgraded to **Dart 3.11.3** and **Flutter 3.41.5**.
- **Style**: Synchronized with official Flutter repository `analysis_options.yaml`.

## [0.2.0] - 2026-01-31

### Added

- Added `propertyMapping` to `@SvgPainter` to allow renaming of generated properties (e.g. mapping `fill1` to `backgroundFill`).
- Added `exposureMode` to `@SvgPainter` to control how dynamic properties are exposed (`none`, `id`, `indexed`, `mixed`).

## [0.1.1] - 2026-01-26

### Fixed

- Added example file for pub.dev documentation

## [0.1.0] - 2026-01-25

### Added

- `@SvgPainter` annotation for marking classes for SVG code generation
- `SvgPainter.file()` constructor for file-based SVG input
- `SvgPainter.code()` constructor for inline SVG string input
