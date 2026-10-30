import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/xml_conversion/xml_element_extensions/to_svg_fe_merge.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
  group('ToSvgFeMerge', () {
    test('should parse feMergeNode children and attributes when valid XML is provided', () {
      // Arrange
      final document = XmlDocument.parse('''
<feMerge result="mergedOutput" id="mergeElem">
  <feMergeNode in="blurLayer" />
  <feMergeNode in="SourceGraphic" />
</feMerge>''');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgFeMerge> result = element.toSvgFeMerge();

      // Assert
      expect(result, isA<Success<SvgFeMerge>>());
      final SvgFeMerge merge = (result as Success<SvgFeMerge>).value;
      expect(merge.nodes.length, 2);
      expect(merge.nodes[0].inSource, 'blurLayer');
      expect(merge.nodes[1].inSource, 'SourceGraphic');
      expect(merge.result, 'mergedOutput');
      expect(merge.id, 'mergeElem');
    });

    test('should parse empty feMerge when no children are provided', () {
      // Arrange
      final document = XmlDocument.parse('<feMerge />');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgFeMerge> result = element.toSvgFeMerge();

      // Assert
      expect(result, isA<Success<SvgFeMerge>>());
      final SvgFeMerge merge = (result as Success<SvgFeMerge>).value;
      expect(merge.nodes, isEmpty);
      expect(merge.result, isNull);
    });
  });
}
