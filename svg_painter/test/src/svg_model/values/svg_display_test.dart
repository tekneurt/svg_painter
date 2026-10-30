import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgDisplay', () {
    test('should have all 18 standard enum values when inspected', () {
      // Arrange & Act & Assert
      expect(SvgDisplay.values, hasLength(18));
      expect(SvgDisplay.inline.value, 'inline');
      expect(SvgDisplay.block.value, 'block');
      expect(SvgDisplay.listItem.value, 'list-item');
      expect(SvgDisplay.runIn.value, 'run-in');
      expect(SvgDisplay.compact.value, 'compact');
      expect(SvgDisplay.marker.value, 'marker');
      expect(SvgDisplay.table.value, 'table');
      expect(SvgDisplay.inlineTable.value, 'inline-table');
      expect(SvgDisplay.tableRowGroup.value, 'table-row-group');
      expect(SvgDisplay.tableHeaderGroup.value, 'table-header-group');
      expect(SvgDisplay.tableFooterGroup.value, 'table-footer-group');
      expect(SvgDisplay.tableRow.value, 'table-row');
      expect(SvgDisplay.tableColumnGroup.value, 'table-column-group');
      expect(SvgDisplay.tableColumn.value, 'table-column');
      expect(SvgDisplay.tableCell.value, 'table-cell');
      expect(SvgDisplay.tableCaption.value, 'table-caption');
      expect(SvgDisplay.none.value, 'none');
      expect(SvgDisplay.contents.value, 'contents');
    });

    test('should return correct enum when valid string provided to from', () {
      // Arrange
      const validNames = <String, SvgDisplay>{
        'inline': SvgDisplay.inline,
        'block': SvgDisplay.block,
        'list-item': SvgDisplay.listItem,
        'run-in': SvgDisplay.runIn,
        'compact': SvgDisplay.compact,
        'marker': SvgDisplay.marker,
        'table': SvgDisplay.table,
        'inline-table': SvgDisplay.inlineTable,
        'table-row-group': SvgDisplay.tableRowGroup,
        'table-header-group': SvgDisplay.tableHeaderGroup,
        'table-footer-group': SvgDisplay.tableFooterGroup,
        'table-row': SvgDisplay.tableRow,
        'table-column-group': SvgDisplay.tableColumnGroup,
        'table-column': SvgDisplay.tableColumn,
        'table-cell': SvgDisplay.tableCell,
        'table-caption': SvgDisplay.tableCaption,
        'none': SvgDisplay.none,
        'contents': SvgDisplay.contents,
      };

      for (final MapEntry<String, SvgDisplay> entry in validNames.entries) {
        // Act
        final SvgDisplay? result = SvgDisplay.from(entry.key);

        // Assert
        expect(result, entry.value);
      }
    });

    test('should parse case-insensitively and ignore whitespace when from is called', () {
      // Arrange
      const inputUpper = '  INLINE  ';
      const inputMixed = '  Table-Row-Group ';

      // Act
      final SvgDisplay? resultUpper = SvgDisplay.from(inputUpper);
      final SvgDisplay? resultMixed = SvgDisplay.from(inputMixed);

      // Assert
      expect(resultUpper, SvgDisplay.inline);
      expect(resultMixed, SvgDisplay.tableRowGroup);
    });

    test('should return null when input is null or unknown', () {
      // Arrange
      const String? nullInput = null;
      const unknownInput = 'not-a-valid-display';

      // Act
      final SvgDisplay? nullResult = SvgDisplay.from(nullInput);
      final SvgDisplay? unknownResult = SvgDisplay.from(unknownInput);

      // Assert
      expect(nullResult, isNull);
      expect(unknownResult, isNull);
    });

    test('should return false for isRendered when display is none', () {
      // Arrange
      const SvgDisplay display = SvgDisplay.none;

      // Act
      final bool isRendered = display.isRendered;

      // Assert
      expect(isRendered, isFalse);
    });

    test('should return true for isRendered when display is not none', () {
      // Arrange
      final Iterable<SvgDisplay> nonNoneDisplays = SvgDisplay.values.where(
        (SvgDisplay d) => d != SvgDisplay.none,
      );

      for (final display in nonNoneDisplays) {
        // Act
        final bool isRendered = display.isRendered;

        // Assert
        expect(isRendered, isTrue);
      }
    });
  });
}
