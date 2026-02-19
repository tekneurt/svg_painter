import '../../svg_model/_svg_model.dart';

/// Helper to parse SVG transform strings.
class SvgTransformParser {
  /// Parses an SVG transform string into a structured [SvgTransformAttributes] object.
  static SvgTransformAttributes? parse(String? transform) {
    if (transform == null || transform.trim().isEmpty) {
      return null;
    }

    final List<SvgTransformOperation> operations = <SvgTransformOperation>[];
    final RegExp transformReg = RegExp(r'(\w+)\s*\(([^)]+)\)');
    final Iterable<Match> matches = transformReg.allMatches(transform);

    for (final Match match in matches) {
      final String? type = match.group(1);
      final String? paramsStr = match.group(2);

      assert(type != null && paramsStr != null, 'Regex match guaranteed groups 1 and 2');
      if (type == null || paramsStr == null) {
        continue;
      }

      final List<double> params = paramsStr
          .split(RegExp(r'[\s,]+'))
          .where((String s) => s.isNotEmpty)
          .map((String s) => double.tryParse(s) ?? 0.0)
          .toList();

      if (params.isEmpty) {
        continue;
      }

      switch (type) {
        case 'translate':
          final double tx = params[0];
          final double ty = params.length > 1 ? params[1] : 0.0;
          operations.add(SvgTranslate(tx, ty));
        case 'rotate':
          final double angle = params[0];
          if (params.length == 3) {
            final double cx = params[1];
            final double cy = params[2];
            operations.add(SvgRotate(angle, cx, cy));
          } else {
            operations.add(SvgRotate(angle));
          }
        case 'scale':
          final double sx = params[0];
          final double sy = params.length > 1 ? params[1] : sx;
          operations.add(SvgScale(sx, sy));
        case 'skewX':
          operations.add(SvgSkewX(params[0]));
        case 'skewY':
          operations.add(SvgSkewY(params[0]));
        case 'matrix':
          if (params.length >= 6) {
            operations.add(
              SvgMatrix(params[0], params[1], params[2], params[3], params[4], params[5]),
            );
          }
      }
    }

    if (operations.isEmpty) {
      return null;
    }

    return SvgTransformAttributes(operations);
  }
}
