import 'package:flutter/material.dart';
import 'package:progressify_core/services/navigation/navigation_service.dart';

import '../styles.dart';

enum TextType {
  h1,
  h1Bold,
  h2Bold,
  h2Heavy,
  h3,
  h3Bold,
  h3Heavy,
  h4,
  h4SemiBold,
  h4Bold,
  h4Heavy,
  h5,
  h5Bold,
  h5SemiBold,
  body,
  caption,
  captionBold,
  captionMini,
  captionMiniBold,
  button,
  newT,
  timer,
  timerCountdown,
  dialogTitle
}

class CustomText extends StatelessWidget {
  final String? fontFamily;
  final String text;
  final TextType textType;
  final Color color;
  final EdgeInsets? margin;
  final TextAlign? textAlign;
  final FontStyle fontStyle;
  final double? lineSpacing;
  final int? maxLines;
  final TextOverflow overflow;
  final double? letterSpacing;
  final TextDecoration? decoration;

  CustomText(this.text,
      {this.textType = TextType.h5,
      Color? color,
      this.fontFamily,
      this.letterSpacing,
      this.margin = EdgeInsets.zero,
      this.textAlign,
      this.lineSpacing = 1.5,
      this.maxLines,
      this.overflow = TextOverflow.visible,
      this.fontStyle = FontStyle.normal,
      this.decoration = TextDecoration.none,
      Key? key})
      : color = color ?? AppStyleCore.black,
        super(key: key);

  static TextStyle? style(TextType textType, {Color? color}) {
    TextTheme textTheme =
        Theme.of(NavigationService.instance.navigatorKey.currentContext!)
            .textTheme;
    switch (textType) {
      case TextType.h1: //w900,42,
        return textTheme.headline1;
      case TextType.h1Bold: //w900,42,
        return textTheme.headline1
            ?.copyWith(fontWeight: FontWeight.w800, fontSize: 42);
      case TextType.h2Bold: //w600,32
        return textTheme.headline2
            ?.copyWith(fontSize: 32, fontWeight: FontWeight.w700);
      case TextType.h2Heavy: //w600,32
        return textTheme.headline2
            ?.copyWith(fontSize: 32, fontWeight: FontWeight.w900);
      case TextType.h3: //20
        return textTheme.headline3?.copyWith(fontSize: 22);
      case TextType.h3Bold: //w700, 20
        return textTheme.headline3
            ?.copyWith(fontWeight: FontWeight.w800, fontSize: 22);
      case TextType.h3Heavy: //w700, 20
        return textTheme.headline3
            ?.copyWith(fontWeight: FontWeight.w900, fontSize: 22);
      case TextType.dialogTitle: //w700, 20
        return textTheme.headline3
            ?.copyWith(fontWeight: FontWeight.w800, fontSize: 22);
      case TextType.h4: //w600, 18
        return textTheme.headline4?.copyWith(fontSize: 18);
      case TextType.h4Bold: //w700, 18
        return textTheme.headline4
            ?.copyWith(fontWeight: FontWeight.w800, fontSize: 18);
      case TextType.h4Heavy: //w700, 18
        return textTheme.headline4
            ?.copyWith(fontWeight: FontWeight.w900, fontSize: 18);
      case TextType.h4SemiBold: //w700, 18
        return textTheme.headline4
            ?.copyWith(fontWeight: FontWeight.w700, fontSize: 18);
      case TextType.h5: //w400,16
        return textTheme.headline5?.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        );
      case TextType.h5Bold: //w700, 16
        return textTheme.headline5?.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w900,
        );
      case TextType.h5SemiBold: //w700, 16
        return textTheme.headline5?.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w800,
        );
      case TextType.body: //w500, 15
        return textTheme.bodyText1
            ?.copyWith(fontSize: 14, fontWeight: FontWeight.w400);
      case TextType.caption: //w500, 14
        return textTheme.headline5?.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        );
      case TextType.captionBold: //w600, 14
        return textTheme.headline5?.copyWith(
            fontSize: 14, fontWeight: FontWeight.w600
            //letterSpacing: 1.1 removed this on purpose, we like it better without
            );
      case TextType.captionMini: //w500, 14
        return textTheme.headline5?.copyWith(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        );
      case TextType.captionMiniBold: //w500, 14
        return textTheme.headline5?.copyWith(
          fontSize: 12,
          fontWeight: FontWeight.w700,
        );
      case TextType.newT:
        return textTheme.bodyText1?.copyWith(
          fontSize: 13.5,
          fontWeight: FontWeight.w300,
        );
      case TextType.timer:
        return textTheme.bodyText1?.copyWith(
          fontSize: 19,
          fontWeight: FontWeight.w200,
        );
      case TextType.timerCountdown:
        return textTheme.bodyText1?.copyWith(
          fontSize: 40,
          fontWeight: FontWeight.w700,
        );
      case TextType.button:
        return textTheme.headline5?.copyWith(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        );
      default:
        return textTheme.bodyText1
            ?.copyWith(fontSize: 15, fontWeight: FontWeight.w500);
    }
  }

  @override
  Widget build(BuildContext context) {
    TextStyle ctStyle = style(textType) as TextStyle;

    return Container(
      margin: margin,
      child: Text(
        text,
        style: ctStyle.copyWith(
          letterSpacing: letterSpacing,
          fontStyle: fontStyle,
          color: color,
          height: lineSpacing ?? 1.0,
          fontFamily: fontFamily,
          fontFamilyFallback: ['Roboto'],
          decoration: decoration,
        ),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      ),
    );
  }
}
