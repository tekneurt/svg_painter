import 'package:svg_painter/src/svg_model/attribute_groups/svg_core_attributes.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:test/test.dart';

void main() {
  group('SvgFeGaussianBlur', () {
    test('should return correct string representation when toString is called', () {
      // Arrange
      const blur = SvgFeGaussianBlur(
        stdDeviationX: 2.5,
        stdDeviationY: 4.5,
        inSource: 'SourceGraphic',
        result: 'blurred',
        coreAttributes: SvgCoreAttributes(id: 'blur1'),
      );

      // Act
      final result = blur.toString();

      // Assert
      expect(result, 'SvgFeGaussianBlur(stdDeviation: (2.5, 4.5), in: SourceGraphic, result: blurred)');
    });

    test('should store properties correctly when instantiated', () {
      // Arrange
      const blur = SvgFeGaussianBlur(
        stdDeviationX: 5.0,
        stdDeviationY: 7.0,
        inSource: 'SourceAlpha',
        result: 'blurAlpha',
        coreAttributes: SvgCoreAttributes(id: 'blur2'),
      );

      // Act & Assert
      expect(blur.stdDeviationX, 5.0);
      expect(blur.stdDeviationY, 7.0);
      expect(blur.inSource, 'SourceAlpha');
      expect(blur.result, 'blurAlpha');
      expect(blur.id, 'blur2');
    });
  });

  group('SvgFeOffset', () {
    test('should return correct string representation when toString is called', () {
      // Arrange
      const offset = SvgFeOffset(
        dx: 15.0,
        dy: 25.0,
        inSource: 'SourceGraphic',
        result: 'offsetResult',
        coreAttributes: SvgCoreAttributes(id: 'off1'),
      );

      // Act
      final result = offset.toString();

      // Assert
      expect(result, 'SvgFeOffset(dx: 15.0, dy: 25.0, in: SourceGraphic, result: offsetResult)');
    });

    test('should store properties correctly when instantiated', () {
      // Arrange
      const offset = SvgFeOffset(
        dx: 60.0,
        dy: 70.0,
        inSource: 'blurOut',
        result: 'offOut',
        coreAttributes: SvgCoreAttributes(id: 'off2'),
      );

      // Act & Assert
      expect(offset.dx, 60.0);
      expect(offset.dy, 70.0);
      expect(offset.inSource, 'blurOut');
      expect(offset.result, 'offOut');
      expect(offset.id, 'off2');
    });
  });

  group('SvgFeMerge and SvgFeMergeNode', () {
    test('should return correct string representation when toString is called', () {
      // Arrange
      const node1 = SvgFeMergeNode(inSource: 'blur2');
      const node2 = SvgFeMergeNode(inSource: 'SourceGraphic');
      const merge = SvgFeMerge(
        nodes: <SvgFeMergeNode>[node1, node2],
        result: 'mergedOut',
        coreAttributes: SvgCoreAttributes(id: 'merge1'),
      );

      // Act & Assert
      expect(node1.toString(), 'SvgFeMergeNode(in: blur2)');
      expect(merge.toString(), 'SvgFeMerge(nodes: 2, result: mergedOut)');
      expect(merge.id, 'merge1');
    });

    test('should store properties correctly when instantiated', () {
      // Arrange
      const node1 = SvgFeMergeNode(inSource: 'layerA');
      const node2 = SvgFeMergeNode(inSource: 'layerB');
      const merge = SvgFeMerge(
        nodes: <SvgFeMergeNode>[node1, node2],
        result: 'finalMerge',
      );

      // Act & Assert
      expect(merge.nodes.length, 2);
      expect(merge.nodes[0].inSource, 'layerA');
      expect(merge.nodes[1].inSource, 'layerB');
      expect(merge.result, 'finalMerge');
    });
  });
}
