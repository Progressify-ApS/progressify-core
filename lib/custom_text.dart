import 'package:flutter/material.dart';

enum TextType {
  h1,
  h1ExtraLight,
  h1Bold,
  h2Bold,
  h2Light,
  h2Heavy,
  h3,
  h3Bold,
  h3Heavy,
  h4,
  h4SemiBold,
  h4Bold,
  h4Heavy,
  h5,
  h5Light,
  h5Thin,
  h5Bold,
  h5SemiBold,
  h5Heavy,
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
  final double? sizeOverride;
  final TextType textType;
  final Color? color;
  final EdgeInsets? margin;
  final TextAlign? textAlign;
  final FontStyle fontStyle;
  final double? lineSpacing;
  final int? maxLines;
  final TextOverflow overflow;
  final double? letterSpacing;
  final TextDecoration? decoration;
  final bool selectable;

  const CustomText(this.text,
      {this.textType = TextType.h5,
      this.color,
      this.fontFamily,
      this.letterSpacing,
      this.margin = EdgeInsets.zero,
      this.textAlign,
      this.lineSpacing,
      this.maxLines,
      this.overflow = TextOverflow.visible,
      this.fontStyle = FontStyle.normal,
      this.decoration = TextDecoration.none,
      this.sizeOverride,
      this.selectable = false,
      Key? key})
      : super(key: key);

  static TextStyle? style(TextType textType, {BuildContext? context}) {
    TextTheme textTheme = context == null
        ? ThemeData.dark().textTheme
        : Theme.of(context).textTheme;
    switch (textType) {
      case TextType.h1:
        return textTheme.headline1;
      case TextType.h1ExtraLight:
        return textTheme.headline1?.copyWith(fontWeight: FontWeight.w200);
      case TextType.h1Bold:
        return textTheme.headline1?.copyWith(fontWeight: FontWeight.w800);
      case TextType.h2Bold:
        return textTheme.headline2?.copyWith(fontWeight: FontWeight.w800);
      case TextType.h2Light:
        return textTheme.headline2?.copyWith(fontWeight: FontWeight.w300);
      case TextType.h2Heavy:
        return textTheme.headline2?.copyWith(fontWeight: FontWeight.w900);
      case TextType.h3:
        return textTheme.headline3;
      case TextType.h3Bold:
        return textTheme.headline3?.copyWith(fontWeight: FontWeight.w800);
      case TextType.h3Heavy:
        return textTheme.headline3?.copyWith(fontWeight: FontWeight.w900);
      case TextType.dialogTitle:
        return textTheme.headline3?.copyWith(fontWeight: FontWeight.w800);
      case TextType.h4:
        return textTheme.headline4;
      case TextType.h4Bold:
        return textTheme.headline4?.copyWith(fontWeight: FontWeight.w800);
      case TextType.h4Heavy:
        return textTheme.headline4?.copyWith(fontWeight: FontWeight.w900);
      case TextType.h4SemiBold:
        return textTheme.headline4?.copyWith(fontWeight: FontWeight.w700);

      case TextType.h5Heavy:
        return textTheme.headline5?.copyWith(
          fontWeight: FontWeight.w900,
        );
      case TextType.h5Bold:
        return textTheme.headline5?.copyWith(
          fontWeight: FontWeight.w700,
        );
      case TextType.h5SemiBold:
        return textTheme.headline5?.copyWith(
          fontWeight: FontWeight.w600,
        );
      case TextType.h5:
        return textTheme.headline5;

      case TextType.h5Thin:
        return textTheme.headline5?.copyWith(fontWeight: FontWeight.w300);

      case TextType.h5Light:
        return textTheme.headline5?.copyWith(fontWeight: FontWeight.w100);

      case TextType.body:
        return textTheme.bodyText1;
      case TextType.caption:
        return textTheme.caption?.copyWith(fontSize: 12);
      case TextType.captionBold:
        return textTheme.caption
            ?.copyWith(fontSize: 12, fontWeight: FontWeight.w600);
      case TextType.captionMini:
        return textTheme.caption
            ?.copyWith(fontSize: 10, fontWeight: FontWeight.w300);
      case TextType.captionMiniBold:
        return textTheme.caption
            ?.copyWith(fontSize: 10, fontWeight: FontWeight.w700);
      case TextType.newT:
        return textTheme.bodyText1
            ?.copyWith(fontSize: 13.5, fontWeight: FontWeight.w300);
      case TextType.timer:
        return textTheme.bodyText1
            ?.copyWith(fontSize: 19, fontWeight: FontWeight.w200);
      case TextType.timerCountdown:
        return textTheme.headline1
            ?.copyWith(fontSize: 40, fontWeight: FontWeight.w700);
      case TextType.button:
        return textTheme.button;
      default:
        return textTheme.bodyText1;
    }
  }

  @override
  Widget build(BuildContext context) {
    TextStyle ctStyle = style(textType, context: context) as TextStyle;
    if (selectable) {
      return SelectableRegion(
          focusNode: FocusNode(),
          selectionControls: materialTextSelectionControls,
          child: buildContent(ctStyle));
    } else {
      return buildContent(ctStyle);
    }
  }

  Container buildContent(TextStyle ctStyle) {
    return Container(
      margin: margin,
      child: Text(
        text,
        style: ctStyle.copyWith(
            letterSpacing: letterSpacing,
            fontStyle: fontStyle,
            color: color ?? ctStyle.color,
            height: lineSpacing ?? 1.0,
            fontFamily: fontFamily,
            fontFamilyFallback: ['Roboto'],
            decoration: decoration,
            fontSize: sizeOverride),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      ),
    );
  }
}
