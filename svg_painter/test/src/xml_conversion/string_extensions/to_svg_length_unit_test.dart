import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:svg_painter/src/xml_conversion/string_extensions/to_svg_length_unit.dart';
import 'package:test/test.dart';

void main() {
  group('ToSvgLengthUnit', () {
    const expectedMapping = <String, SvgLengthUnit>{
      'px': SvgLengthUnit.px,
      'cm': SvgLengthUnit.cm,
      'mm': SvgLengthUnit.mm,
      'Q': SvgLengthUnit.q,
      'in': SvgLengthUnit.inUnit,
      'pt': SvgLengthUnit.pt,
      'pc': SvgLengthUnit.pc,
      'vw': SvgLengthUnit.vw,
      'vh': SvgLengthUnit.vh,
      'vmin': SvgLengthUnit.vmin,
      'vmax': SvgLengthUnit.vmax,
      '': SvgLengthUnit.none,
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
