import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:svg_painter/src/xml_conversion/xml_element_extensions/to_svg_fe_component_transfer.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
  group('ToSvgFeComponentTransfer', () {
    test(
      'should parse feComponentTransfer with all child functions and attributes when valid XML is provided',
      () {
        // Arrange
        final document = XmlDocument.parse('''
<feComponentTransfer in="SourceGraphic" result="transferOut" id="ct1">
  <feFuncR type="linear" slope="1.5" intercept="0.1" />
  <feFuncG type="gamma" amplitude="2.5" exponent="3.5" offset="0.2" />
  <feFuncB type="table" tableValues="0.3 0.7" />
  <feFuncA type="discrete" tableValues="0.0 1.0" />
</feComponentTransfer>
''');
        final XmlElement element = document.rootElement;

        // Act
        final Result<SvgFeComponentTransfer> result = element.toSvgFeComponentTransfer();

        // Assert
        expect(result, isA<Success<SvgFeComponentTransfer>>());
        final SvgFeComponentTransfer transfer = (result as Success<SvgFeComponentTransfer>).value;
        expect(transfer.inSource, 'SourceGraphic');
        expect(transfer.result, 'transferOut');
        expect(transfer.id, 'ct1');
        expect(transfer.funcR?.type, SvgComponentTransferType.linear);
        expect(transfer.funcR?.slope, 1.5);
        expect(transfer.funcR?.intercept, 0.1);
        expect(transfer.funcG?.type, SvgComponentTransferType.gamma);
        expect(transfer.funcG?.amplitude, 2.5);
        expect(transfer.funcB?.type, SvgComponentTransferType.table);
        expect(transfer.funcB?.tableValues, <double>[0.3, 0.7]);
        expect(transfer.funcA?.type, SvgComponentTransferType.discrete);
        expect(transfer.funcA?.tableValues, <double>[0.0, 1.0]);
      },
    );

    test('should handle empty feComponentTransfer when no children or attributes are provided', () {
      // Arrange
      final document = XmlDocument.parse('<feComponentTransfer />');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgFeComponentTransfer> result = element.toSvgFeComponentTransfer();

      // Assert
      expect(result, isA<Success<SvgFeComponentTransfer>>());
      final SvgFeComponentTransfer transfer = (result as Success<SvgFeComponentTransfer>).value;
      expect(transfer.funcR, isNull);
      expect(transfer.funcG, isNull);
      expect(transfer.funcB, isNull);
      expect(transfer.funcA, isNull);
      expect(transfer.inSource, isNull);
      expect(transfer.result, isNull);
    });
  });
}
