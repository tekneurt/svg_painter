import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgComponentTransferType', () {
    test('should return correct enum when valid string provided to from', () {
      // Arrange & Act & Assert
      expect(SvgComponentTransferType.from('identity'), SvgComponentTransferType.identity);
      expect(SvgComponentTransferType.from('table'), SvgComponentTransferType.table);
      expect(SvgComponentTransferType.from('discrete'), SvgComponentTransferType.discrete);
      expect(SvgComponentTransferType.from('linear'), SvgComponentTransferType.linear);
      expect(SvgComponentTransferType.from('gamma'), SvgComponentTransferType.gamma);
    });

    test('should return null when null or unknown string provided to from', () {
      // Arrange & Act & Assert
      expect(SvgComponentTransferType.from(null), isNull);
      expect(SvgComponentTransferType.from('unknown'), isNull);
    });

    test('should have correct string values when inspected', () {
      // Arrange & Act & Assert
      expect(SvgComponentTransferType.identity.value, 'identity');
      expect(SvgComponentTransferType.table.value, 'table');
      expect(SvgComponentTransferType.discrete.value, 'discrete');
      expect(SvgComponentTransferType.linear.value, 'linear');
      expect(SvgComponentTransferType.gamma.value, 'gamma');
    });
  });
}
