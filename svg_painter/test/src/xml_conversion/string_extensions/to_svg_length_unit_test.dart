import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:svg_painter/src/xml_conversion/string_extensions/to_svg_length_unit.dart';
import 'package:test/test.dart';

void main() {
  group('ToSvgLengthUnit', () {
    const expectedMapping = <String, SvgLengthUnit>{
      '': SvgLengthUnit.none,
      'ch': SvgLengthUnit.ch,
      'cm': SvgLengthUnit.cm,
      'em': SvgLengthUnit.em,
      'ex': SvgLengthUnit.ex,
      'in': SvgLengthUnit.inUnit,
      'mm': SvgLengthUnit.mm,
      'pc': SvgLengthUnit.pc,
      'pt': SvgLengthUnit.pt,
      'px': SvgLengthUnit.px,
      'Q': SvgLengthUnit.q,
      'rem': SvgLengthUnit.rem,
      'vh': SvgLengthUnit.vh,
      'vmax': SvgLengthUnit.vmax,
      'vmin': SvgLengthUnit.vmin,
      'vw': SvgLengthUnit.vw,
    };

    group('toSvgLengthUnit', () {
      test('should return correct unit for all supported suffixes', () {
        // Arrange & Act & Assert
        expectedMapping.forEach((String suffix, SvgLengthUnit expectedUnit) {
          expect(
            suffix.toSvgLengthUnit(),
            equals(expectedUnit),
            reason: 'Suffix "$suffix" did not map to $expectedUnit',
          );
        });
      });

      test('should return SvgLengthUnit.none for unknown suffixes', () {
        // Arrange & Act & Assert
        expect('foo'.toSvgLengthUnit(), SvgLengthUnit.none);
        expect('  '.toSvgLengthUnit(), SvgLengthUnit.none);
      });

      test('should verify all enum values are covered in test', () {
        // Arrange
        // We expect all enum values to be in our mapping.
        // SvgLengthUnit.none is mapped to '' (and default).
        final Set<SvgLengthUnit> mappedUnits = expectedMapping.values.toSet();

        // Act & Assert
        for (final SvgLengthUnit unit in SvgLengthUnit.values) {
          expect(
            mappedUnits.contains(unit),
            isTrue,
            reason: 'Enum value $unit is not covered by test expectations',
          );
        }
      });
    });
  });
}
