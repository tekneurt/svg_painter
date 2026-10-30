import 'package:svg_painter/src/svg_model/attribute_groups/svg_core_attributes.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
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

  group('SvgFeFunc', () {
    test('should return correct string representation when toString is called', () {
      // Arrange
      const funcR = SvgFeFuncR(type: SvgComponentTransferType.linear);
      const funcG = SvgFeFuncG(type: SvgComponentTransferType.gamma);
      const funcB = SvgFeFuncB(type: SvgComponentTransferType.table);
      const funcA = SvgFeFuncA(type: SvgComponentTransferType.discrete);

      // Act & Assert
      expect(funcR.toString(), 'SvgFeFuncR(type: SvgComponentTransferType.linear)');
      expect(funcG.toString(), 'SvgFeFuncG(type: SvgComponentTransferType.gamma)');
      expect(funcB.toString(), 'SvgFeFuncB(type: SvgComponentTransferType.table)');
      expect(funcA.toString(), 'SvgFeFuncA(type: SvgComponentTransferType.discrete)');
    });

    test('should store properties correctly when instantiated with distinct values', () {
      // Arrange
      const func = SvgFeFuncR(
        type: SvgComponentTransferType.gamma,
        tableValues: <double>[0.1, 0.4, 0.9],
        slope: 2.5,
        intercept: 0.15,
        amplitude: 3.5,
        exponent: 4.5,
        offset: 0.25,
        coreAttributes: SvgCoreAttributes(id: 'func1'),
      );

      // Act & Assert
      expect(func.type, SvgComponentTransferType.gamma);
      expect(func.tableValues, <double>[0.1, 0.4, 0.9]);
      expect(func.slope, 2.5);
      expect(func.intercept, 0.15);
      expect(func.amplitude, 3.5);
      expect(func.exponent, 4.5);
      expect(func.offset, 0.25);
      expect(func.id, 'func1');
    });
  });

  group('SvgFeComponentTransfer', () {
    test('should return correct string representation when toString is called', () {
      // Arrange
      const funcR = SvgFeFuncR(type: SvgComponentTransferType.linear);
      const transfer = SvgFeComponentTransfer(
        funcR: funcR,
        result: 'transferOut',
        coreAttributes: SvgCoreAttributes(id: 'ct1'),
      );

      // Act
      final result = transfer.toString();

      // Assert
      expect(
        result,
        'SvgFeComponentTransfer(R: SvgFeFuncR(type: SvgComponentTransferType.linear), G: null, B: null, A: null, result: transferOut)',
      );
      expect(transfer.id, 'ct1');
    });

    test('should store properties correctly when instantiated with distinct values', () {
      // Arrange
      const funcR = SvgFeFuncR(type: SvgComponentTransferType.linear, slope: 1.5);
      const funcG = SvgFeFuncG(type: SvgComponentTransferType.gamma, amplitude: 2.0);
      const funcB = SvgFeFuncB(type: SvgComponentTransferType.table, tableValues: <double>[0.2, 0.8]);
      const funcA = SvgFeFuncA(type: SvgComponentTransferType.discrete);
      const transfer = SvgFeComponentTransfer(
        funcR: funcR,
        funcG: funcG,
        funcB: funcB,
        funcA: funcA,
        inSource: 'layerIn',
        result: 'layerOut',
        coreAttributes: SvgCoreAttributes(id: 'ct2'),
      );

      // Act & Assert
      expect(transfer.funcR?.slope, 1.5);
      expect(transfer.funcG?.amplitude, 2.0);
      expect(transfer.funcB?.tableValues, <double>[0.2, 0.8]);
      expect(transfer.funcA?.type, SvgComponentTransferType.discrete);
      expect(transfer.inSource, 'layerIn');
      expect(transfer.result, 'layerOut');
      expect(transfer.id, 'ct2');
    });
  });
}
