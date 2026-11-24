import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgMarkerOrient', () {
    test('should provide correct constants when accessed', () {
      // Arrange & Act & Assert
      expect(SvgMarkerOrient.auto, isA<SvgMarkerOrientAuto>());
      expect(SvgMarkerOrient.autoStartReverse, isA<SvgMarkerOrientAutoStartReverse>());
      expect(SvgMarkerOrient.zero, isA<SvgMarkerOrientAngle>());
      expect((SvgMarkerOrient.zero as SvgMarkerOrientAngle).degrees, 0.0);
    });

    test('should format correctly when toString is called', () {
      // Arrange
      const auto = SvgMarkerOrientAuto();
      const autoStartReverse = SvgMarkerOrientAutoStartReverse();
      const angle = SvgMarkerOrientAngle(45.5);

      // Act & Assert
      expect(auto.toString(), 'auto');
      expect(autoStartReverse.toString(), 'auto-start-reverse');
      expect(angle.toString(), '45.5');
    });

    test('should support value equality when comparing instances', () {
      // Arrange
      const auto1 = SvgMarkerOrientAuto();
      const auto2 = SvgMarkerOrientAuto();
      const rev1 = SvgMarkerOrientAutoStartReverse();
      const rev2 = SvgMarkerOrientAutoStartReverse();
      const angle1 = SvgMarkerOrientAngle(90.0);
      const angle2 = SvgMarkerOrientAngle(90.0);
      const angleDiff = SvgMarkerOrientAngle(45.0);

      // Act & Assert
      expect(auto1, equals(auto2));
      expect(rev1, equals(rev2));
      expect(angle1, equals(angle2));
      expect(angle1, isNot(equals(angleDiff)));
      expect(auto1, isNot(equals(rev1)));
      expect(auto1, isNot(equals(angle1)));
      expect(angle1.hashCode, angle2.hashCode);
    });
  });
}
