/// Utility mapping Flutter color values to their `Colors` constant names.
class FlutterColorMap {
  /// Maps ARGB color values to their Flutter `Colors` representation string.
  static const Map<int, String> _valueToName = <int, String>{
    // Base Colors
    0x00000000: 'Colors.transparent',
    0xFF000000: 'Colors.black',
    0xFFFFFFFF: 'Colors.white',

    // Red
    0xFFF44336: 'Colors.red',
    0xFFFFEBEE: 'Colors.red.shade50',
    0xFFFFCDD2: 'Colors.red.shade100',
    0xFFEF9A9A: 'Colors.red.shade200',
    0xFFE57373: 'Colors.red.shade300',
    0xFFEF5350: 'Colors.red.shade400',
    0xFFE53935: 'Colors.red.shade600',
    0xFFD32F2F: 'Colors.red.shade700',
    0xFFC62828: 'Colors.red.shade800',
    0xFFB71C1C: 'Colors.red.shade900',

    // Pink
    0xFFE91E63: 'Colors.pink',
    0xFFFCE4EC: 'Colors.pink.shade50',
    0xFFF8BBD0: 'Colors.pink.shade100',
    0xFFF48FB1: 'Colors.pink.shade200',
    0xFFF06292: 'Colors.pink.shade300',
    0xFFEC407A: 'Colors.pink.shade400',
    0xFFD81B60: 'Colors.pink.shade600',
    0xFFC2185B: 'Colors.pink.shade700',
    0xFFAD1457: 'Colors.pink.shade800',
    0xFF880E4F: 'Colors.pink.shade900',

    // Purple
    0xFF9C27B0: 'Colors.purple',
    0xFFF3E5F5: 'Colors.purple.shade50',
    0xFFE1BEE7: 'Colors.purple.shade100',
    0xFFCE93D8: 'Colors.purple.shade200',
    0xFFBA68C8: 'Colors.purple.shade300',
    0xFFAB47BC: 'Colors.purple.shade400',
    0xFF8E24AA: 'Colors.purple.shade600',
    0xFF7B1FA2: 'Colors.purple.shade700',
    0xFF6A1B9A: 'Colors.purple.shade800',
    0xFF4A148C: 'Colors.purple.shade900',

    // Deep Purple
    0xFF673AB7: 'Colors.deepPurple',
    0xFFEDE7F6: 'Colors.deepPurple.shade50',
    0xFFD1C4E9: 'Colors.deepPurple.shade100',
    0xFFB39DDB: 'Colors.deepPurple.shade200',
    0xFF9575CD: 'Colors.deepPurple.shade300',
    0xFF7E57C2: 'Colors.deepPurple.shade400',
    0xFF5E35B1: 'Colors.deepPurple.shade600',
    0xFF512DA8: 'Colors.deepPurple.shade700',
    0xFF4527A0: 'Colors.deepPurple.shade800',
    0xFF311B92: 'Colors.deepPurple.shade900',

    // Indigo
    0xFF3F51B5: 'Colors.indigo',
    0xFFE8EAF6: 'Colors.indigo.shade50',
    0xFFC5CAE9: 'Colors.indigo.shade100',
    0xFF9FA8DA: 'Colors.indigo.shade200',
    0xFF7986CB: 'Colors.indigo.shade300',
    0xFF5C6BC0: 'Colors.indigo.shade400',
    0xFF3949AB: 'Colors.indigo.shade600',
    0xFF303F9F: 'Colors.indigo.shade700',
    0xFF283593: 'Colors.indigo.shade800',
    0xFF1A237E: 'Colors.indigo.shade900',

    // Blue
    0xFF2196F3: 'Colors.blue',
    0xFFE3F2FD: 'Colors.blue.shade50',
    0xFFBBDEFB: 'Colors.blue.shade100',
    0xFF90CAF9: 'Colors.blue.shade200',
    0xFF64B5F6: 'Colors.blue.shade300',
    0xFF42A5F5: 'Colors.blue.shade400',
    0xFF1E88E5: 'Colors.blue.shade600',
    0xFF1976D2: 'Colors.blue.shade700',
    0xFF1565C0: 'Colors.blue.shade800',
    0xFF0D47A1: 'Colors.blue.shade900',

    // Light Blue
    0xFF03A9F4: 'Colors.lightBlue',
    0xFFE1F5FE: 'Colors.lightBlue.shade50',
    0xFFB3E5FC: 'Colors.lightBlue.shade100',
    0xFF81D4FA: 'Colors.lightBlue.shade200',
    0xFF4FC3F7: 'Colors.lightBlue.shade300',
    0xFF29B6F6: 'Colors.lightBlue.shade400',
    0xFF039BE5: 'Colors.lightBlue.shade600',
    0xFF0288D1: 'Colors.lightBlue.shade700',
    0xFF0277BD: 'Colors.lightBlue.shade800',
    0xFF01579B: 'Colors.lightBlue.shade900',

    // Cyan
    0xFF00BCD4: 'Colors.cyan',
    0xFFE0F7FA: 'Colors.cyan.shade50',
    0xFFB2EBF2: 'Colors.cyan.shade100',
    0xFF80DEEA: 'Colors.cyan.shade200',
    0xFF4DD0E1: 'Colors.cyan.shade300',
    0xFF26C6DA: 'Colors.cyan.shade400',
    0xFF00ACC1: 'Colors.cyan.shade600',
    0xFF0097A7: 'Colors.cyan.shade700',
    0xFF00838F: 'Colors.cyan.shade800',
    0xFF006064: 'Colors.cyan.shade900',

    // Teal
    0xFF009688: 'Colors.teal',
    0xFFE0F2F1: 'Colors.teal.shade50',
    0xFFB2DFDB: 'Colors.teal.shade100',
    0xFF80CBC4: 'Colors.teal.shade200',
    0xFF4DB6AC: 'Colors.teal.shade300',
    0xFF26A69A: 'Colors.teal.shade400',
    0xFF00897B: 'Colors.teal.shade600',
    0xFF00796B: 'Colors.teal.shade700',
    0xFF00695C: 'Colors.teal.shade800',
    0xFF004D40: 'Colors.teal.shade900',

    // Green
    0xFF4CAF50: 'Colors.green',
    0xFFE8F5E9: 'Colors.green.shade50',
    0xFFC8E6C9: 'Colors.green.shade100',
    0xFFA5D6A7: 'Colors.green.shade200',
    0xFF81C784: 'Colors.green.shade300',
    0xFF66BB6A: 'Colors.green.shade400',
    0xFF43A047: 'Colors.green.shade600',
    0xFF388E3C: 'Colors.green.shade700',
    0xFF2E7D32: 'Colors.green.shade800',
    0xFF1B5E20: 'Colors.green.shade900',

    // Light Green
    0xFF8BC34A: 'Colors.lightGreen',
    0xFFF1F8E9: 'Colors.lightGreen.shade50',
    0xFFDCEDC8: 'Colors.lightGreen.shade100',
    0xFFC5E1A5: 'Colors.lightGreen.shade200',
    0xFFAED581: 'Colors.lightGreen.shade300',
    0xFF9CCC65: 'Colors.lightGreen.shade400',
    0xFF7CB342: 'Colors.lightGreen.shade600',
    0xFF689F38: 'Colors.lightGreen.shade700',
    0xFF558B2F: 'Colors.lightGreen.shade800',
    0xFF33691E: 'Colors.lightGreen.shade900',

    // Lime
    0xFFCDDC39: 'Colors.lime',
    0xFFF9FBE7: 'Colors.lime.shade50',
    0xFFF0F4C3: 'Colors.lime.shade100',
    0xFFE6EE9C: 'Colors.lime.shade200',
    0xFFDCE775: 'Colors.lime.shade300',
    0xFFD4E157: 'Colors.lime.shade400',
    0xFFC0CA33: 'Colors.lime.shade600',
    0xFFAFB42B: 'Colors.lime.shade700',
    0xFF9E9D24: 'Colors.lime.shade800',
    0xFF827717: 'Colors.lime.shade900',

    // Yellow
    0xFFFFEB3B: 'Colors.yellow',
    0xFFFFFDE7: 'Colors.yellow.shade50',
    0xFFFFF9C4: 'Colors.yellow.shade100',
    0xFFFFF59D: 'Colors.yellow.shade200',
    0xFFFFF176: 'Colors.yellow.shade300',
    0xFFFFEE58: 'Colors.yellow.shade400',
    0xFFFDD835: 'Colors.yellow.shade600',
    0xFFFBC02D: 'Colors.yellow.shade700',
    0xFFF9A825: 'Colors.yellow.shade800',
    0xFFF57F17: 'Colors.yellow.shade900',

    // Amber
    0xFFFFC107: 'Colors.amber',
    0xFFFFF8E1: 'Colors.amber.shade50',
    0xFFFFECB3: 'Colors.amber.shade100',
    0xFFFFE082: 'Colors.amber.shade200',
    0xFFFFD54F: 'Colors.amber.shade300',
    0xFFFFCA28: 'Colors.amber.shade400',
    0xFFFFB300: 'Colors.amber.shade600',
    0xFFFFA000: 'Colors.amber.shade700',
    0xFFFF8F00: 'Colors.amber.shade800',
    0xFFFF6F00: 'Colors.amber.shade900',

    // Orange
    0xFFFF9800: 'Colors.orange',
    0xFFFFF3E0: 'Colors.orange.shade50',
    0xFFFFE0B2: 'Colors.orange.shade100',
    0xFFFFCC80: 'Colors.orange.shade200',
    0xFFFFB74D: 'Colors.orange.shade300',
    0xFFFFA726: 'Colors.orange.shade400',
    0xFFFB8C00: 'Colors.orange.shade600',
    0xFFF57C00: 'Colors.orange.shade700',
    0xFFEF6C00: 'Colors.orange.shade800',
    0xFFE65100: 'Colors.orange.shade900',

    // Deep Orange
    0xFFFF5722: 'Colors.deepOrange',
    0xFFFBE9E7: 'Colors.deepOrange.shade50',
    0xFFFFCCBC: 'Colors.deepOrange.shade100',
    0xFFFFAB91: 'Colors.deepOrange.shade200',
    0xFFFF8A65: 'Colors.deepOrange.shade300',
    0xFFFF7043: 'Colors.deepOrange.shade400',
    0xFFF4511E: 'Colors.deepOrange.shade600',
    0xFFE64A19: 'Colors.deepOrange.shade700',
    0xFFD84315: 'Colors.deepOrange.shade800',
    0xFFBF360C: 'Colors.deepOrange.shade900',

    // Brown
    0xFF795548: 'Colors.brown',
    0xFFEFEBE9: 'Colors.brown.shade50',
    0xFFD7CCC8: 'Colors.brown.shade100',
    0xFFBCAAA4: 'Colors.brown.shade200',
    0xFFA1887F: 'Colors.brown.shade300',
    0xFF8D6E63: 'Colors.brown.shade400',
    0xFF6D4C41: 'Colors.brown.shade600',
    0xFF5D4037: 'Colors.brown.shade700',
    0xFF4E342E: 'Colors.brown.shade800',
    0xFF3E2723: 'Colors.brown.shade900',

    // Grey
    0xFF9E9E9E: 'Colors.grey',
    0xFFFAFAFA: 'Colors.grey.shade50',
    0xFFF5F5F5: 'Colors.grey.shade100',
    0xFFEEEEEE: 'Colors.grey.shade200',
    0xFFE0E0E0: 'Colors.grey.shade300',
    0xFFBDBDBD: 'Colors.grey.shade400',
    0xFF757575: 'Colors.grey.shade600',
    0xFF616161: 'Colors.grey.shade700',
    0xFF424242: 'Colors.grey.shade800',
    0xFF212121: 'Colors.grey.shade900',

    // Blue Grey
    0xFF607D8B: 'Colors.blueGrey',
    0xFFECEFF1: 'Colors.blueGrey.shade50',
    0xFFCFD8DC: 'Colors.blueGrey.shade100',
    0xFFB0BEC5: 'Colors.blueGrey.shade200',
    0xFF90A4AE: 'Colors.blueGrey.shade300',
    0xFF78909C: 'Colors.blueGrey.shade400',
    0xFF546E7A: 'Colors.blueGrey.shade600',
    0xFF455A64: 'Colors.blueGrey.shade700',
    0xFF37474F: 'Colors.blueGrey.shade800',
    0xFF263238: 'Colors.blueGrey.shade900',
  };

  /// Returns the Flutter code representation for a given [colorArgb].
  ///
  /// Falls back to `const Color(0x...)` if no named match is found.
  static String getColorCode(int colorArgb) {
    final String? name = _valueToName[colorArgb];
    if (name != null) {
      return name;
    }

    // Standard hex representation
    final String hex = colorArgb.toRadixString(16).toUpperCase().padLeft(8, '0');
    return 'const Color(0x$hex)';
  }
}
