import 'dart:ui';

class AppColors {
  static const themeColor = Color(0xFF10AA69);
  static const themeText = Color(0xFF0F0F0F);
  static const textB29 = Color(0xFF292929);
  static const textB22 = Color(0xFF222222);
  static const dividerC = Color(0xFFEFEFEF);
  static const grayE6 = Color(0xFF6E6E6E);
  static const bgColor = Color(0xFFF8F8F8);

  static Color colorsUtil(String hexStr, {double alpha = 1}) {
    hexStr = hexStr.toUpperCase().replaceAll("#", "");
    int hex = int.parse(hexStr, radix: 16);
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    return Color.fromRGBO(
        (hex & 0xFF0000) >> 16, (hex & 0x00FF00) >> 8, (hex & 0x0000FF) >> 0, alpha);
  }
}
