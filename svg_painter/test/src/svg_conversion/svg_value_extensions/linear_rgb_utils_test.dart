import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/svg_conversion/svg_value_extensions/linear_rgb_utils.dart';
import 'package:test/test.dart';

void main() {
  group('linear_rgb_utils', () {
    group('sRgbToLinear and linearToSRgb', () {
      test('should roundtrip black and white accurately when bounds are tested', () {
        // Arrange
        const black = 0.0;
        const white = 1.0;

        // Act & Assert
        expect(sRgbToLinear(black), closeTo(0.0, 1e-6));
        expect(linearToSRgb(0.0), closeTo(0.0, 1e-6));
        expect(sRgbToLinear(white), closeTo(1.0, 1e-6));
        expect(linearToSRgb(1.0), closeTo(1.0, 1e-6));
      });

      test('should follow low-threshold linear formula when channel is below threshold', () {
        // Arrange
        const lowSrgb = 0.03;
        const lowLinear = 0.002;

        // Act
        final double linResult = sRgbToLinear(lowSrgb);
        final double srgbResult = linearToSRgb(lowLinear);

        // Assert
        expect(linResult, closeTo(lowSrgb / 12.92, 1e-6));
        expect(srgbResult, closeTo(lowLinear * 12.92, 1e-6));
      });

      test('should roundtrip intermediate sRGB values when converted to linear and back', () {
        // Arrange
        const testValues = <double>[0.1, 0.25, 0.5, 0.75, 0.9];

        for (final val in testValues) {
          // Act
          final double linear = sRgbToLinear(val);
          final double roundtrip = linearToSRgb(linear);

          // Assert
          expect(roundtrip, closeTo(val, 1e-4));
        }
      });
    });

    group('interpolateLinearRgbStops', () {
      test('should return unchanged stops when stop count is less than two', () {
        // Arrange
        final singleStop = <GradientStop>[
          const GradientStop(offset: 0.25, colorArgb: 0xFFFF0000, opacity: 0.8),
        ];

        // Act
        final List<GradientStop> result = interpolateLinearRgbStops(singleStop);

        // Assert
        expect(result, equals(singleStop));
      });

      test('should interpolate in linear space producing brighter midpoint when colors transition', () {
        // Arrange: Blue (0xFF0000FF) to Red (0xFFFF0000)
        final stops = <GradientStop>[
          const GradientStop(offset: 0.0, colorArgb: 0xFF0000FF),
          const GradientStop(offset: 1.0, colorArgb: 0xFFFF0000),
        ];

        // Act
        final List<GradientStop> result = interpolateLinearRgbStops(stops);

        // Assert: 1 start + 16 steps = 17 stops
        expect(result.length, 17);
        expect(result.first.offset, 0.0);
        expect(result.first.colorArgb, 0xFF0000FF);
        expect(result.last.offset, 1.0);
        expect(result.last.colorArgb, 0xFFFF0000);

        // Midpoint at index 8 (t = 8/16 = 0.5)
        final GradientStop midpoint = result[8];
        expect(midpoint.offset, 0.5);
        final int midR = (midpoint.colorArgb >> 16) & 0xFF;
        final int midG = (midpoint.colorArgb >> 8) & 0xFF;
        final int midB = midpoint.colorArgb & 0xFF;

        // In sRGB linear interpolation, midpoint would be (128, 0, 128).
        // In linear RGB interpolation, midpoint is ~188 (pinkish), noticeably > 128!
        expect(midR, greaterThan(180));
        expect(midG, 0);
        expect(midB, greaterThan(180));
      });

      test('should preserve hard stop transitions when offsets are equal or non-increasing', () {
        // Arrange: Hard edge at 0.5 (Red to Blue)
        final stops = <GradientStop>[
          const GradientStop(offset: 0.0, colorArgb: 0xFFFF0000),
          const GradientStop(offset: 0.5, colorArgb: 0xFFFF0000),
          const GradientStop(offset: 0.5, colorArgb: 0xFF0000FF),
          const GradientStop(offset: 1.0, colorArgb: 0xFF0000FF),
        ];

        // Act
        final List<GradientStop> result = interpolateLinearRgbStops(stops, stepsPerSegment: 4);

        // Assert:
        // Segment 1 (0.0 -> 0.5): 4 steps
        // Segment 2 (0.5 -> 0.5): 1 hard stop added directly
        // Segment 3 (0.5 -> 1.0): 4 steps
        expect(result.any((s) => s.offset == 0.5 && s.colorArgb == 0xFFFF0000), isTrue);
        expect(result.any((s) => s.offset == 0.5 && s.colorArgb == 0xFF0000FF), isTrue);
      });
    });
  });
}
