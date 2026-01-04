import 'package:svg_painter/src/xml_model/xml_attribute_name.dart';
import 'package:test/test.dart';

void main() {
  group('XmlAttributeName', () {
    test('should have correct string values', () {
      // Arrange & Act & Assert
      expect(XmlAttributeName.x.name, 'x');
      expect(XmlAttributeName.y.name, 'y');
      expect(XmlAttributeName.x1.name, 'x1');
      expect(XmlAttributeName.cx.name, 'cx');
      expect(XmlAttributeName.points.name, 'points');
      expect(XmlAttributeName.stopColor.name, 'stop-color');
      expect(XmlAttributeName.strokeDasharray.name, 'stroke-dasharray');
      expect(XmlAttributeName.className.name, 'class');
      expect(XmlAttributeName.viewBox.name, 'viewBox');
    });
  });
}
