import 'package:flutter/material.dart';

enum AppColor {
  lightGrey,
  blueSuperBright,
  orange,
  red,
  white,
  purple,
  blueLight,
  blueMedium,
  blueDark,
  subText,
  doubleLetter,
  tripleLetter,
  doubleWord,
  tripleWord,
  errorGradientStart,
  errorGradientEnd,
  dialogGradientStart,
  dialogGradientEnd
}

class AppStyleCore {
  static Map<AppColor, Color> colors = {
    AppColor.lightGrey: colorFromHex('#ffe5e5'),
    AppColor.blueSuperBright: colorFromHex('#d3d8ff'),
    AppColor.orange: colorFromHex('#EF9B66'),
    AppColor.errorGradientStart: colorFromHex('#EF9B66'),
    AppColor.red: colorFromHex('#F86F6F'),
    AppColor.errorGradientEnd: colorFromHex('#F86F6F'),
    AppColor.tripleLetter: colorFromHex('#F86F6F'),
    AppColor.white: Colors.white,
    AppColor.purple: colorFromHex('#754dd1'),
    AppColor.blueLight: colorFromHex('#0ED3DB'),
    AppColor.blueMedium: colorFromHex('#0694EA'),
    AppColor.doubleLetter: colorFromHex('#0694EA'),
    AppColor.blueDark: colorFromHex('#000a51'),
    AppColor.subText: Colors.white.withOpacity(0.5),
    AppColor.dialogGradientStart: colorFromHex('#1852A0'),
    AppColor.dialogGradientEnd: colorFromHex('#1A2C78'),
  };

  static Color get primaryRed => colorFromHex('#ab2328');

  static Color get blue => colorFromHex('#282c45');

  static Color get bronze => colorFromHex('#9a6d43');

  static Color get cream => colorFromHex('#e9e3d3');

  static Color get grey => colorFromHex('#606060');

  static Color get greyLight => colorFromHex('#b0b0b0');

  static Color get greyDark => colorFromHex('#656565');

  static Color get black => AppStyleCore.colorFromHex('#333333');

  static Color get white => AppStyleCore.colorFromHex('#FFFFFF');

  static Color get bgWhite => AppStyleCore.colorFromHex('#f2f2f2');

  static Color get shadow => greyLight.withOpacity(0.2);

  static Color colorFromHex(String hexColor) {
    final hexCode = hexColor.replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }

  static RoundedRectangleBorder mainButtonShape =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(8));
}
