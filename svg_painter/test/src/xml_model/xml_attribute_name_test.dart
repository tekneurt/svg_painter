import 'package:svg_painter/src/xml_model/xml_attribute_name.dart';
import 'package:test/test.dart';

void main() {
  group('XmlAttributeName', () {
    test('should map every enum value to the correct SVG attribute string', () {
      // Arrange & Act & Assert
      for (final XmlAttributeName value in XmlAttributeName.values) {
        final String expected = switch (value) {
          XmlAttributeName.x => 'x',
          XmlAttributeName.y => 'y',
          XmlAttributeName.x1 => 'x1',
          XmlAttributeName.y1 => 'y1',
          XmlAttributeName.x2 => 'x2',
          XmlAttributeName.y2 => 'y2',
          XmlAttributeName.cx => 'cx',
          XmlAttributeName.cy => 'cy',
          XmlAttributeName.points => 'points',
          XmlAttributeName.r => 'r',
          XmlAttributeName.rx => 'rx',
          XmlAttributeName.ry => 'ry',
          XmlAttributeName.width => 'width',
          XmlAttributeName.height => 'height',
          XmlAttributeName.pathLength => 'pathLength',
          XmlAttributeName.transform => 'transform',
          XmlAttributeName.id => 'id',
          XmlAttributeName.href => 'href',
          XmlAttributeName.fx => 'fx',
          XmlAttributeName.fy => 'fy',
          XmlAttributeName.fr => 'fr',
          XmlAttributeName.d => 'd',
          XmlAttributeName.offset => 'offset',
          XmlAttributeName.stopColor => 'stop-color',
          XmlAttributeName.stopOpacity => 'stop-opacity',
          XmlAttributeName.gradientTransform => 'gradientTransform',
          XmlAttributeName.gradientUnits => 'gradientUnits',
          XmlAttributeName.spreadMethod => 'spreadMethod',
          XmlAttributeName.className => 'class',
          XmlAttributeName.style => 'style',
          XmlAttributeName.fill => 'fill',
          XmlAttributeName.fillOpacity => 'fill-opacity',
          XmlAttributeName.stroke => 'stroke',
          XmlAttributeName.strokeOpacity => 'stroke-opacity',
          XmlAttributeName.strokeWidth => 'stroke-width',
          XmlAttributeName.strokeDasharray => 'stroke-dasharray',
          XmlAttributeName.strokeLinecap => 'stroke-linecap',
          XmlAttributeName.strokeLinejoin => 'stroke-linejoin',
          XmlAttributeName.opacity => 'opacity',
          XmlAttributeName.fontSize => 'font-size',
          XmlAttributeName.fontWeight => 'font-weight',
          XmlAttributeName.fontStyle => 'font-style',
          XmlAttributeName.fontFamily => 'font-family',
          XmlAttributeName.viewBox => 'viewBox',
          XmlAttributeName.preserveAspectRatio => 'preserveAspectRatio',
          XmlAttributeName.dx => 'dx',
          XmlAttributeName.dy => 'dy',
          XmlAttributeName.rotate => 'rotate',
          XmlAttributeName.type => 'type',
          XmlAttributeName.media => 'media',
          XmlAttributeName.title => 'title',
          XmlAttributeName.xmlSpace => 'xml:space',
        };
        expect(value.name, expected, reason: 'Enum $value should map to "$expected"');
      }
    });
  });
}
