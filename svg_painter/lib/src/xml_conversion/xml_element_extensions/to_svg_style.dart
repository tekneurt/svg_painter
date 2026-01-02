import 'package:xml/xml.dart';

import '../../base/_base.dart';
import '../../svg_model/_svg_model.dart';
import '../../xml_model/_xml_model.dart';
import '../_xml_conversion.dart';

extension ToSvgStyle on XmlElement {
  /// Converts this [XmlElement] to an [SvgStyle].
  Result<SvgStyle> toSvgStyle() {
    final String? id = toXmlAttributeValue(XmlAttributeName.id);
    return Success<SvgStyle>(SvgStyle(id: id));
  }
}
