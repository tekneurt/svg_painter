import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:svg_painter/src/xml_conversion/xml_element_extensions/to_svg_fe_func.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
  group('ToSvgFeFunc', () {
    test('should parse linear feFuncR with distinct attributes when valid XML is provided', () {
      // Arrange
      final document = XmlDocument.parse(
        '<feFuncR type="linear" slope="2.5" intercept="0.15" id="fR" />',
      );
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgFeFuncR> result = element.toSvgFeFuncR();

      // Assert
      expect(result, isA<Success<SvgFeFuncR>>());
      final SvgFeFuncR func = (result as Success<SvgFeFuncR>).value;
      expect(func.type, SvgComponentTransferType.linear);
      expect(func.slope, 2.5);
      expect(func.intercept, 0.15);
      expect(func.id, 'fR');
    });

    test('should parse gamma feFuncG with distinct attributes when valid XML is provided', () {
      // Arrange
      final document = XmlDocument.parse(
        '<feFuncG type="gamma" amplitude="3.5" exponent="4.5" offset="0.25" id="fG" />',
      );
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgFeFuncG> result = element.toSvgFeFuncG();

      // Assert
      expect(result, isA<Success<SvgFeFuncG>>());
      final SvgFeFuncG func = (result as Success<SvgFeFuncG>).value;
      expect(func.type, SvgComponentTransferType.gamma);
      expect(func.amplitude, 3.5);
      expect(func.exponent, 4.5);
      expect(func.offset, 0.25);
      expect(func.id, 'fG');
    });

    test('should parse table feFuncB with tableValues when valid XML is provided', () {
      // Arrange
      final document = XmlDocument.parse(
        '<feFuncB type="table" tableValues="0.1 0.4 0.9" id="fB" />',
      );
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgFeFuncB> result = element.toSvgFeFuncB();

      // Assert
      expect(result, isA<Success<SvgFeFuncB>>());
      final SvgFeFuncB func = (result as Success<SvgFeFuncB>).value;
      expect(func.type, SvgComponentTransferType.table);
      expect(func.tableValues, <double>[0.1, 0.4, 0.9]);
      expect(func.id, 'fB');
    });

    test('should parse discrete feFuncA with default values when attributes are absent', () {
      // Arrange
      final document = XmlDocument.parse('<feFuncA type="discrete" id="fA" />');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgFeFuncA> result = element.toSvgFeFuncA();

      // Assert
      expect(result, isA<Success<SvgFeFuncA>>());
      final SvgFeFuncA func = (result as Success<SvgFeFuncA>).value;
      expect(func.type, SvgComponentTransferType.discrete);
      expect(func.tableValues, isEmpty);
      expect(func.slope, 1.0);
      expect(func.intercept, 0.0);
      expect(func.amplitude, 1.0);
      expect(func.exponent, 1.0);
      expect(func.offset, 0.0);
      expect(func.id, 'fA');
    });
  });
}
