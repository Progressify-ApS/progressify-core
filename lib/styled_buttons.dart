import 'package:flutter/material.dart';

import 'styles.dart';

class StyledButton extends StatelessWidget {
  final Function()? onPressed;
  final Widget child;
  final double elevation;
  final double height;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Color color;
  final double cornerRadius;
  final bool elevated;
  final BoxConstraints? constraints;

  StyledButton(
      {required this.onPressed,
      required this.child,
      this.elevation = 10,
      this.height = 44,
      this.padding = EdgeInsets.zero,
      this.margin = EdgeInsets.zero,
      Color? color,
      this.cornerRadius = 8,
      this.constraints,
      Key? key})
      : color = color ?? AppStyle.primaryRed,
        elevated = false,
        super(key: key);

  StyledButton.dark(
      {required this.onPressed,
      required this.child,
      this.elevation = 10,
      this.height = 44,
      this.padding = EdgeInsets.zero,
      this.margin = EdgeInsets.zero,
      Color? color,
      this.cornerRadius = 6,
      this.constraints,
      Key? key})
      : color = color ?? AppStyle.grey,
        elevated = false,
        super(key: key);

  StyledButton.elevated(
      {required this.onPressed,
      required this.child,
      this.elevation = 10,
      this.height = 50,
      this.padding = EdgeInsets.zero,
      this.margin = EdgeInsets.zero,
      Color? color,
      this.cornerRadius = 6,
      this.constraints,
      Key? key})
      : color = color ?? AppStyle.primaryRed,
        elevated = true,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if (elevated) {
      return StyledElevatedButton(
        onPressed: onPressed,
        height: height,
        padding: padding,
        margin: margin,
        color: color,
        cornerRadius: cornerRadius,
        elevation: elevation,
        constraints: constraints,
        child: child,
      );
    } else {
      return StyledFlatButton(
        onPressed: onPressed,
        height: height,
        padding: padding,
        margin: margin,
        color: color,
        cornerRadius: cornerRadius,
        constraints: constraints,
        child: child,
      );
    }
  }
}

class StyledElevatedButton extends StatelessWidget {
  final Function()? onPressed;
  final Widget child;
  final double elevation;
  final double height;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Color? color;
  final double cornerRadius;
  final BoxConstraints? constraints;

  const StyledElevatedButton(
      {Key? key,
      this.onPressed,
      required this.child,
      required this.elevation,
      required this.height,
      required this.padding,
      required this.margin,
      this.color,
      this.constraints,
      this.cornerRadius = 6})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      constraints: constraints,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: elevation,
          shape: AppStyle.mainButtonShape,
          padding: EdgeInsets.zero,
        ),
        child: Container(
          height: height,
          padding: padding,
          decoration: color != null
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(cornerRadius),
                  color: color)
              : AppStyle.linearGradientDecoration.copyWith(
                  borderRadius: BorderRadius.circular(cornerRadius),
                ),
          child: Center(
            child: child,
          ),
        ),
      ),
    );
  }
}

class StyledFlatButton extends StatelessWidget {
  final Function()? onPressed;
  final Widget child;
  final double height;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Color? color;
  final double cornerRadius;
  final BoxConstraints? constraints;

  const StyledFlatButton(
      {Key? key,
      this.onPressed,
      required this.child,
      required this.height,
      required this.padding,
      required this.margin,
      this.constraints,
      this.color,
      this.cornerRadius = 6})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      constraints: constraints,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          shape: AppStyle.mainButtonShape,
          padding: EdgeInsets.zero,
        ),
        child: Container(
          height: height,
          padding: padding,
          decoration: color != null
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(cornerRadius),
                  color: color)
              : AppStyle.linearGradientDecoration.copyWith(
                  borderRadius: BorderRadius.circular(cornerRadius),
                ),
          child: Center(
            child: child,
          ),
        ),
      ),
    );
  }
}
