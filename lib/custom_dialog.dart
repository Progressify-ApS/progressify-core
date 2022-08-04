import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../styled_buttons.dart';
import '../styles.dart';
import 'custom_text.dart';
import 'services/navigation/navigation_service.dart';

class CustomDialog extends StatelessWidget {
  final BoxConstraints? constraints;
  final Widget child;
  final double borderRadius;
  final EdgeInsets? insetPadding;

  const CustomDialog(
      {this.borderRadius = 6,
      this.insetPadding,
      required this.child,
      this.constraints,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: insetPadding ?? const Dialog().insetPadding,
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(borderRadius),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Container(
        constraints: constraints,
        decoration: AppStyle.radialGradientDecoration.copyWith(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius),
          ),
        ),
        child: child,
      ),
    );
  }
}

class CustomAlertDialog extends StatelessWidget {
  static Future showInfo(
      {String? identifier, required String title, required String message}) {
    return NavigationService.instance.showDialog(
      child: CustomAlertDialog(
        constraints: const BoxConstraints.tightFor(width: 400),
        insetPadding: const EdgeInsets.all(16),
        icon: FaIcon(
          FontAwesomeIcons.circleInfo,
          color: AppStyle.primaryRed,
          size: 48,
        ),
        title: CustomText(
          title,
          textType: TextType.dialogTitle,
          textAlign: TextAlign.center,
        ),
        titlePadding: const EdgeInsets.only(top: 8, bottom: 8),
        child: CustomText(
          message,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  final Widget? child;

  ///Optional - Overwrites default checkmark icon
  final Widget? icon;

  ///Optional - Overwrites the default OK button
  final Widget? button;

  ///Overwrites the title
  final Widget? title;

  ///Overwrites the default internal padding
  final EdgeInsets internalPadding;

  ///Overwrites the default title padding
  final EdgeInsets titlePadding;

  ///Overwrites the default child padding
  final EdgeInsets childPadding;

  ///Adds an optional constraint to the size of the dialog
  final BoxConstraints? constraints;

  ///Defines insetSize
  final EdgeInsets? insetPadding;

  const CustomAlertDialog(
      {this.child,
      this.internalPadding = const EdgeInsets.all(16),
      this.childPadding = const EdgeInsets.symmetric(horizontal: 32),
      this.titlePadding =
          const EdgeInsets.only(top: 16, bottom: 24, left: 32, right: 32),
      this.title,
      this.icon,
      this.button,
      this.constraints,
      this.insetPadding,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      constraints: constraints,
      insetPadding: insetPadding,
      child: Padding(
        padding: internalPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null)
              icon as Widget
            else
              Icon(
                Icons.check_circle,
                color: AppStyle.primaryRed,
                size: 64,
              ),
            //
            // Image.asset(
            //   TileTravelConfig.checkmarkIcon,
            //   width: 64,
            //   height: 64,
            //   fit: BoxFit.cover,
            //   color: AMStyle.color(AMColor.blueLight),
            // ),
            if (title != null)
              Padding(
                padding: titlePadding,
                child: title,
              ),
            if (child != null)
              Padding(
                padding: childPadding,
                child: child,
              ),
            const SizedBox(
              height: 16,
            ),
            if (button != null)
              button as Widget
            else
              StyledButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: CustomText(
                  'OK',
                  color: Colors.white,
                ),
              )
          ],
        ),
      ),
    );
  }
}

class CustomChoiceDialog extends StatelessWidget {
  final Widget? child;

  ///Optional - Overwrites default checkmark icon
  final Widget? icon;

  ///Optional - Overwrites the default OK button
  final Widget? acceptButton;

  ///Optional - Overwrites the default Cancel button
  final Widget? declineButton;

  ///Overwrites the title
  final Widget? title;

  ///Overwrites the default internal padding
  final EdgeInsets internalPadding;

  ///Overwrites the default title padding
  final EdgeInsets titlePadding;

  ///Overwrites the default child padding
  final EdgeInsets childPadding;

  ///Dictates the arrangement of buttons, horizontal or vertical
  final Axis buttonArrangement;

  ///Constrains the dialog size
  final BoxConstraints? constraints;

  ///Defines insetSize
  final EdgeInsets? insetPadding;

  const CustomChoiceDialog(
      {this.child,
      this.internalPadding = const EdgeInsets.all(16),
      this.childPadding = const EdgeInsets.symmetric(horizontal: 32),
      this.insetPadding,
      this.titlePadding =
          const EdgeInsets.only(top: 0, bottom: 16, left: 32, right: 32),
      this.title,
      this.icon,
      this.acceptButton,
      this.declineButton,
      this.buttonArrangement = Axis.vertical,
      this.constraints,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      insetPadding: insetPadding,
      constraints: constraints,
      child: Padding(
        padding: internalPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null)
              icon as Widget
            else
              Icon(
                CupertinoIcons.question_circle,
                size: 64,
                color: AppStyle.primaryRed,
              ),

            ///Leaving this as a pattern if you choose to use an image
            // Image.asset(
            //   TileTravelConfig.checkmarkIcon,
            //   width: 64,
            //   height: 64,
            //   fit: BoxFit.cover,
            //   color: TTStyle.color(TTColor.blueLight),
            // ),
            if (title != null)
              Padding(
                padding: titlePadding,
                child: title,
              ),
            if (child != null)
              Padding(
                padding: childPadding,
                child: child,
              ),
            if (child != null)
              const SizedBox(
                height: 16,
              ),
            if (buttonArrangement == Axis.vertical)
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (acceptButton != null)
                      acceptButton as Widget
                    else
                      StyledButton(
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                        child: CustomText(
                          'OK',
                          color: Colors.white,
                          textType: TextType.button,
                        ),
                      ),
                    const SizedBox(
                      height: 8,
                    ),
                    if (declineButton != null)
                      declineButton as Widget
                    else
                      StyledButton.dark(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        child: CustomText(
                          'Cancel',
                          textType: TextType.button,
                          color: AppStyle.white,
                        ),
                      )
                  ],
                ),
              )
            else
              Flexible(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: acceptButton ??
                          StyledButton(
                            onPressed: () {
                              Navigator.of(context).pop(true);
                            },
                            child: CustomText(
                              'OK',
                              textType: TextType.button,
                              color: Colors.white,
                            ),
                          ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: declineButton ??
                          StyledButton.dark(
                            onPressed: () {
                              Navigator.of(context).pop(false);
                            },
                            child: CustomText(
                              'Cancel',
                              textType: TextType.button,
                              color: AppStyle.white,
                            ),
                          ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
