import 'package:xml/xml.dart';

import '../../base/result.dart';
import '../../svg_model/_svg_model.dart';
import '../../xml_model/_xml_model.dart';
import '../_xml_conversion.dart';

/// Extension to convert [XmlElement] to `<feFunc*>` elements.
extension ToSvgFeFunc on XmlElement {
  /// Converts this [XmlElement] to an [SvgFeFuncR].
  Result<SvgFeFuncR> toSvgFeFuncR() {
    final (
      SvgComponentTransferType type,
      List<double> tableValues,
      double slope,
      double intercept,
      double amplitude,
      double exponent,
      double offset,
      CommonAttributes common,
    ) = _parseFuncAttributes(XmlElementName.feFuncR);
    return Success<SvgFeFuncR>(
      SvgFeFuncR(
        type: type,
        tableValues: tableValues,
        slope: slope,
        intercept: intercept,
        amplitude: amplitude,
        exponent: exponent,
        offset: offset,
        coreAttributes: common.core,
      ),
    );
  }

  /// Converts this [XmlElement] to an [SvgFeFuncG].
  Result<SvgFeFuncG> toSvgFeFuncG() {
    final (
      SvgComponentTransferType type,
      List<double> tableValues,
      double slope,
      double intercept,
      double amplitude,
      double exponent,
      double offset,
      CommonAttributes common,
    ) = _parseFuncAttributes(XmlElementName.feFuncG);
    return Success<SvgFeFuncG>(
      SvgFeFuncG(
        type: type,
        tableValues: tableValues,
        slope: slope,
        intercept: intercept,
        amplitude: amplitude,
        exponent: exponent,
        offset: offset,
        coreAttributes: common.core,
      ),
    );
  }

  /// Converts this [XmlElement] to an [SvgFeFuncB].
  Result<SvgFeFuncB> toSvgFeFuncB() {
    final (
      SvgComponentTransferType type,
      List<double> tableValues,
      double slope,
      double intercept,
      double amplitude,
      double exponent,
      double offset,
      CommonAttributes common,
    ) = _parseFuncAttributes(XmlElementName.feFuncB);
    return Success<SvgFeFuncB>(
      SvgFeFuncB(
        type: type,
        tableValues: tableValues,
        slope: slope,
        intercept: intercept,
        amplitude: amplitude,
        exponent: exponent,
        offset: offset,
        coreAttributes: common.core,
      ),
    );
  }

  /// Converts this [XmlElement] to an [SvgFeFuncA].
  Result<SvgFeFuncA> toSvgFeFuncA() {
    final (
      SvgComponentTransferType type,
      List<double> tableValues,
      double slope,
      double intercept,
      double amplitude,
      double exponent,
      double offset,
      CommonAttributes common,
    ) = _parseFuncAttributes(XmlElementName.feFuncA);
    return Success<SvgFeFuncA>(
      SvgFeFuncA(
        type: type,
        tableValues: tableValues,
        slope: slope,
        intercept: intercept,
        amplitude: amplitude,
        exponent: exponent,
        offset: offset,
        coreAttributes: common.core,
      ),
    );
  }

  (SvgComponentTransferType, List<double>, double, double, double, double, double, CommonAttributes)
  _parseFuncAttributes(XmlElementName elementName) {
    final SvgComponentTransferType type =
        SvgComponentTransferType.from(getAttribute(XmlAttributeName.type.name)) ??
        SvgComponentTransferType.identity;

    final String? rawTable = getAttribute(XmlAttributeName.tableValues.name);
    final List<double> tableValues = rawTable == null
        ? const <double>[]
        : rawTable
            .trim()
            .split(RegExp(r'[\s,]+'))
            .where((String s) => s.isNotEmpty)
            .map((String s) => double.tryParse(s) ?? 0.0)
            .toList();

    final double slope = double.tryParse(getAttribute(XmlAttributeName.slope.name) ?? '') ?? 1.0;
    final double intercept =
        double.tryParse(getAttribute(XmlAttributeName.intercept.name) ?? '') ?? 0.0;
    final double amplitude =
        double.tryParse(getAttribute(XmlAttributeName.amplitude.name) ?? '') ?? 1.0;
    final double exponent =
        double.tryParse(getAttribute(XmlAttributeName.exponent.name) ?? '') ?? 1.0;
    final double offset = double.tryParse(getAttribute(XmlAttributeName.offset.name) ?? '') ?? 0.0;

    final CommonAttributes common = toCommonAttributes(elementName);

    return (type, tableValues, slope, intercept, amplitude, exponent, offset, common);
  }
}
