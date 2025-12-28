/// Helper to parse and manipulate SVG transform strings.
class SvgTransformParser {
  /// Scales the translation and rotation center parameters in the [transform] string
  /// by [sx] and [sy]. Returns the modified transform string, or null if [transform] is null or empty.
  static String? scaleTransform(String? transform, double sx, double sy) {
    if (transform == null || transform.trim().isEmpty) {
      return null;
    }

    final StringBuffer buffer = StringBuffer();
    final RegExp transformReg = RegExp(r'(\w+)\s*\(([^)]+)\)');
    final Iterable<Match> matches = transformReg.allMatches(transform);

    for (final Match match in matches) {
      final String type = match.group(1)!;
      final String paramsStr = match.group(2)!;
      final List<double> params = paramsStr
          .split(RegExp(r'[\s,]+'))
          .where((String s) => s.isNotEmpty)
          .map((String s) => double.tryParse(s) ?? 0.0)
          .toList();

      if (params.isEmpty) {
        continue;
      }

      if (buffer.isNotEmpty) {
        buffer.write(' ');
      }

      switch (type) {
        case 'translate':
          final double tx = params[0] * sx;
          final double ty = (params.length > 1 ? params[1] : 0.0) * sy;
          buffer.write('translate($tx, $ty)');
        case 'rotate':
          final double angle = params[0];
          if (params.length == 3) {
            final double cx = params[1] * sx;
            final double cy = params[2] * sy;
            buffer.write('rotate($angle, $cx, $cy)');
          } else {
            buffer.write('rotate($angle)');
          }
        case 'scale':
          // Scale factors don't change based on current unit scaling.
          // Scale(s) scales the coordinate system itself.
          final double scaleX = params[0];
          final double scaleY = params.length > 1 ? params[1] : scaleX;
          buffer.write('scale($scaleX, $scaleY)');
        case 'skewX':
          buffer.write('skewX(${params[0]})');
        case 'skewY':
          buffer.write('skewY(${params[0]})');
        case 'matrix':
          // matrix(a, b, c, d, e, f)
          // e and f are translation.
          // x' = ax + cy + e
          // We are in scaled space.
          // e -> e * sx (if x translation)
          // f -> f * sy (if y translation)
          // The other parameters a, b, c, d might depend on aspect ratio if sx != sy?
          // For now, let's assume sx == sy or just scale translation.
          // Strictly:
          // [ a c e ]
          // [ b d f ]
          // [ 0 0 1 ]
          // New matrix M' = S * M * inv(S) ?
          // No, we want to apply T_user.
          // P_pix = P_user * S.
          // P_pix' = (T_user * P_user) * S = T_user * (P_pix * inv(S)) * S.
          // M' = S * M_user * inv(S).
          // S = diag(sx, sy, 1). inv(S) = diag(1/sx, 1/sy, 1).
          // M_user = [[a, c, e], [b, d, f], [0, 0, 1]]
          // S * M = [[sx*a, sx*c, sx*e], [sy*b, sy*d, sy*f], ...]
          // (S*M) * inv(S) = [[sx*a/sx, sx*c/sy, sx*e], [sy*b/sx, sy*d/sy, sy*f], ...]
          // = [[a, c*(sx/sy), e*sx], [b*(sy/sx), d, f*sy], ...]
          // So:
          // a' = a
          // b' = b * (sy/sx)
          // c' = c * (sx/sy)
          // d' = d
          // e' = e * sx
          // f' = f * sy
          if (params.length >= 6) {
            final double a = params[0];
            final double b = params[1];
            final double c = params[2];
            final double d = params[3];
            final double e = params[4];
            final double f = params[5];

            final double newB = b * (sy / sx);
            final double newC = c * (sx / sy);
            final double newE = e * sx;
            final double newF = f * sy;

            buffer.write('matrix($a, $newB, $newC, $d, $newE, $newF)');
          }
      }
    }
    return buffer.toString();
  }
}
