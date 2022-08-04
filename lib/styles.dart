import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'custom_text.dart';

var mainButtonShape =
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(8));

var mainGradientLeft = AppStyle.colorFromHex('#0ED3DB');
var mainGradientRight = AppStyle.colorFromHex('#0694EA');

var linearGradient = BoxDecoration(
    gradient: LinearGradient(
  colors: [
    mainGradientLeft,
    mainGradientRight,
  ],
  transform: const GradientRotation(3.14),
));

var errorGradient = BoxDecoration(
    gradient: LinearGradient(
  colors: [
    AppStyle.colorFromHex('#EF9B66'),
    AppStyle.colorFromHex('#F86F6F'),
  ],
));

var linearGradientDialogBackground = BoxDecoration(
  borderRadius: BorderRadius.circular(8),
  gradient: LinearGradient(
    colors: [
      AppStyle.colorFromHex('#1852A0'),
      AppStyle.colorFromHex('#1A2C78'),
    ],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
  ),
);

var radialGradientBackground = BoxDecoration(
    gradient: RadialGradient(
  colors: [
    AppStyle.colorFromHex('#02176F'),
    AppStyle.colorFromHex('#000A51'),
  ],
));

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

class AppStyle {
  static double smallPhoneVh = 667;
  static double maxIphoneVW = 428;

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

  static Color get black => AppStyle.colorFromHex('#333333');

  static Color get white => AppStyle.colorFromHex('#FFFFFF');

  static Color get bgWhite => AppStyle.colorFromHex('#f2f2f2');

  static Color get shadow => greyLight.withOpacity(0.2);

  static RoundedRectangleBorder mainButtonShape =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(8));

  static Color color(AppColor color) {
    return colors[color] as Color;
  }

  static bool isSmallPhone(BuildContext context) =>
      MediaQuery.of(context).size.height <= smallPhoneVh;

  static double calculateRel(BuildContext context, {required double base}) {
    //this is based on the widest viewport of iPhones
    double multiplier = base / maxIphoneVW;
    double ceiling = maxIphoneVW * multiplier;
    double vW = MediaQuery.of(context).size.width;
    double result = vW * multiplier;
    return result > ceiling ? ceiling : result;
  }

  static Color colorFromHex(String hexColor) {
    final hexCode = hexColor.replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }

  static TextTheme textTheme({Color? color}) {
    TextStyle baseStyle =
        TextStyle(color: color ?? AppStyle.black, fontFamily: 'Avenir');
    return TextTheme(
      headline1: baseStyle.copyWith(fontSize: 96),
      headline2: baseStyle.copyWith(fontSize: 60),
      headline3: baseStyle.copyWith(fontSize: 48),
      headline4: baseStyle.copyWith(fontSize: 34),
      headline5: baseStyle.copyWith(fontSize: 24),
      headline6: baseStyle.copyWith(fontSize: 20, fontWeight: FontWeight.w500),
      subtitle1: baseStyle.copyWith(fontSize: 16),
      subtitle2: baseStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w500),
      bodyText1: baseStyle.copyWith(fontSize: 16),
      bodyText2: baseStyle.copyWith(fontSize: 14),
      button: baseStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w500),
      caption: baseStyle.copyWith(fontSize: 12),
      overline: baseStyle.copyWith(fontSize: 10),
    );
  }

  static InputDecoration get formInputStyle2 => InputDecoration(
        border: InputBorder.none,
        floatingLabelStyle: CustomText.style(TextType.captionBold)!.copyWith(
          color: greyLight,
          height: 1.6,
        ),
        labelStyle: CustomText.style(TextType.captionBold)!
            .copyWith(color: greyLight, height: 1.6),
        hintStyle: CustomText.style(TextType.captionBold)!
            .copyWith(color: greyLight, height: 1.6),
        filled: true,
        fillColor: Colors.grey[100],
        contentPadding:
            const EdgeInsets.only(left: 14.0, bottom: 0.0, top: 8.0, right: 14),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(18),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(18.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryRed),
          borderRadius: BorderRadius.circular(18.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(18.0),
        ),
      );

  static InputDecoration get formInputStyle => InputDecoration(
        border: InputBorder.none,
        floatingLabelStyle: CustomText.style(TextType.captionBold)!.copyWith(
          color: greyLight,
          height: 1.6,
        ),
        labelStyle: CustomText.style(TextType.captionBold)!
            .copyWith(color: greyLight, height: 1.6),
        hintStyle: CustomText.style(TextType.captionBold)!
            .copyWith(color: greyLight, height: 1.6),
        filled: true,
        fillColor: Colors.grey[100],
        contentPadding:
            const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0, right: 14),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(4.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(4.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryRed),
          borderRadius: BorderRadius.circular(4.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(4.0),
        ),
      );

  static InputDecorationTheme inputUnderline = InputDecorationTheme(
    labelStyle: TextStyle(
      fontSize: 16,
      letterSpacing: 1.1,
      color: AppStyle.color(AppColor.subText),
    ),
    floatingLabelStyle: TextStyle(
      fontSize: 16,
      letterSpacing: 1.1,
      color: AppStyle.color(AppColor.white),
    ),
    hintStyle: TextStyle(
      fontSize: 16,
      letterSpacing: 1.1,
      color: AppStyle.color(AppColor.subText),
    ),
    border: UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppStyle.color(AppColor.subText),
        width: 1,
      ),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppStyle.color(AppColor.subText),
        width: 1,
      ),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppStyle.color(AppColor.white),
        width: 1,
      ),
    ),
    focusedErrorBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: AppStyle.color(AppColor.red), width: 1),
    ),
    errorBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: AppStyle.color(AppColor.red), width: 1),
    ),
  );

  static InputDecorationTheme inputOutline = InputDecorationTheme(
    labelStyle: TextStyle(
      fontSize: 16,
      letterSpacing: 1.1,
      color: greyDark,
    ),
    hintStyle: TextStyle(
      fontSize: 16,
      letterSpacing: 1.1,
      color: greyDark,
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(
        color: grey,
        width: 2,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: grey,
        width: 2,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: greyDark,
        width: 2,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: primaryRed,
        width: 2,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: primaryRed,
        width: 2,
      ),
    ),
  );

  static ThemeData theme() => ThemeData(
        brightness: Brightness.light,
        textTheme: textTheme(),
        dialogTheme:
            const DialogTheme().copyWith(backgroundColor: AppStyle.white),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: AppStyle.primaryRed,
        errorColor: color(AppColor.errorGradientEnd),
        scaffoldBackgroundColor:
            AppStyle.colorFromHex('#f6f6f6').withOpacity(0.2),
        // backgroundColor: AMStyle.primaryRed,
        canvasColor: bgWhite,
        cardColor: color(AppColor.blueDark),
        scrollbarTheme: ScrollbarThemeData(
            thumbColor: MaterialStateColor.resolveWith((states) => greyDark)),
        appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          color: AppStyle.white,
          centerTitle: true,
          titleTextStyle: const TextStyle(color: Colors.black),
          toolbarTextStyle: const TextStyle(color: Colors.black),
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          shadowColor: Colors.white,
          elevation: 1,
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.resolveWith(
              (states) => CustomText.style(TextType.button),
            ),
          ),
        ),
        inputDecorationTheme: inputOutline,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: createMaterialColor(
            color(AppColor.blueMedium),
          ),
        ).copyWith(
            primary: color(AppColor.blueMedium),
            secondary: color(AppColor.orange),
            onPrimary: white,
            onSecondary: white,
            onSurface: white),
      );

  static CustomText header(String input) => CustomText(
        input,
        textAlign: TextAlign.center,
        textType: TextType.h3Bold,
      );

  static CustomText subtitle(String input) => CustomText(
        input,
        textAlign: TextAlign.center,
        textType: TextType.caption,
        color: color(AppColor.blueLight),
      );

  static BoxDecoration radialGradientDecoration = BoxDecoration(
    gradient: RadialGradient(
      colors: [
        Colors.grey[100] as Color,
        Colors.white,
      ],
    ),
  );

  static BoxDecoration linearGradientDialogBackground = BoxDecoration(
    borderRadius: BorderRadius.circular(8),
    gradient: LinearGradient(
      colors: [
        Colors.grey[100] as Color,
        Colors.grey[200] as Color,
      ],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
    ),
  );

  static BoxDecoration linearGradientDecoration = BoxDecoration(
    gradient: LinearGradient(
      colors: [
        AppStyle.primaryRed,
        // color(AMColor.red),
        AppStyle.primaryRed,
      ],
      transform: const GradientRotation(3.14),
    ),
  );

  static BoxDecoration errorGradientDecoration = BoxDecoration(
    gradient: LinearGradient(
      colors: [
        color(AppColor.errorGradientStart),
        color(AppColor.errorGradientEnd),
      ],
    ),
  );

  static MaterialColor createMaterialColor(Color color) {
    List<double> strengths = <double>[.05];
    Map<int, Color> swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;
    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (double strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }
}
