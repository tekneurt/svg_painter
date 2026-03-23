import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/svg_model/_svg_model.dart';
import 'package:svg_painter/src/xml_conversion/_xml_conversion.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
  test('nested svg should be SvgRoot? or SvgSvg?', () {
    final document = XmlDocument.parse('<svg xmlns="http://www.w3.org/2000/svg"><svg id="nested" /></svg>');
    final XmlElement rootElement = document.rootElement;
    final Result<SvgElement> result = rootElement.toSvgElement();
    final SvgRoot root = result.fold((Failure<SvgElement> f) => throw Exception(f.message), (SvgElement v) => v as SvgRoot);
    
    final nested = root.children.first as SvgSvg; // It is SvgSvg, not SvgRoot
    expect(nested, isA<SvgSvg>());
    expect(nested, isNot(isA<SvgRoot>()));
  });
}
