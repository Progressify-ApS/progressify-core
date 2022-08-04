import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSegmentedTile extends StatelessWidget {
  final bool
      selected; // if the tile is selected and should have green line shown
  final EdgeInsets? margin;
  final EdgeInsets padding; // padding
  final Color? color, borderColor; // background color of tile
  final Widget? leading; // Leading widget
  final Widget? trailing; // Trailing widget
  final Widget? title; // Title widget
  final Widget? body; // widget shown under the title row
  final double
      contentPadding; // padding between the center piece and leading/trailing widgets
  final double linePaddingLeft; // left padding of the bottom divider
  final double linePaddingRight; // right padding of the bottom divider
  final bool expanded; // if the tile should expand in the vertical direction
  final bool expandBody; // if the body should be expanded when tile is expanded
  final MainAxisAlignment
      expandedMainAxisAlignment; // the main axis alignment of the content column if the tile is expanded
  final void Function()? onTap;
  final bool arrowRight;
  final bool textFieldRight;
  final bool settingsRight;
  final bool showBorder;
  final bool dottedDivider;
  final bool solidDivider;
  final bool shadow;
  final double borderRadius;

  const CustomSegmentedTile(
      {Key? key,
      this.title,
      this.body,
      this.leading,
      this.trailing,
      this.color,
      this.borderColor = Colors.white,
      this.onTap,
      this.selected = false,
      this.margin,
      this.padding = const EdgeInsets.all(16),
      this.contentPadding = 16,
      this.linePaddingLeft = 16,
      this.linePaddingRight = 16,
      this.expanded = false,
      this.expandBody = false,
      this.expandedMainAxisAlignment = MainAxisAlignment.center,
      this.arrowRight = false,
      this.textFieldRight = false,
      this.settingsRight = false,
      this.dottedDivider = false,
      this.showBorder = false,
      this.solidDivider = false,
      this.shadow = false,
      this.borderRadius = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTile(
      borderColor: borderColor ?? Theme.of(context).primaryColor,
      margin: margin,
      selected: selected,
      padding: padding,
      color: color,
      onTap: onTap,
      linePaddingLeft: linePaddingLeft,
      linePaddingRight: linePaddingRight,
      expanded: expanded,
      dottedDivider: dottedDivider,
      solidDivider: solidDivider,
      showBorder: showBorder,
      shadow: shadow,
      borderRadius: borderRadius,
      child: Row(
        children: [
          if (leading != null)
            Padding(
              padding: EdgeInsets.only(right: contentPadding),
              child: leading,
            ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: expandedMainAxisAlignment,
              children: [
                if (title != null) title as Widget,
                if (body != null && expandBody)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: body,
                    ),
                  ),
                if (body != null && !expandBody)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: body,
                  ),
              ],
            ),
          ),
          if (trailing != null)
            Padding(
              padding: EdgeInsets.only(left: contentPadding),
              child: trailing,
            ),
          if (settingsRight)
            Padding(
              padding: EdgeInsets.only(left: contentPadding),
              child: const Icon(Icons.more_vert),
            ),
          if (arrowRight)
            Padding(
                padding: EdgeInsets.only(left: contentPadding),
                child: const Icon(CupertinoIcons.chevron_right)),
          if (textFieldRight)
            Padding(
              padding: EdgeInsets.only(left: contentPadding),
              child: const Icon(Icons.comment),
            ),
        ],
      ),
    );
  }
}

class CustomTile extends StatelessWidget {
  final EdgeInsets? margin, padding;
  final Color? color, borderColor;
  final Widget child;
  final void Function()? onTap;
  final bool expanded,
      showBorder,
      dottedDivider,
      solidDivider,
      shadow,
      selected;
  final double borderRadius, borderWidth, linePaddingLeft, linePaddingRight;

  const CustomTile(
      {Key? key,
      required this.child,
      this.margin = const EdgeInsets.symmetric(vertical: 16),
      this.padding = const EdgeInsets.all(16),
      this.color = Colors.white,
      this.borderColor = Colors.white,
      this.onTap,
      this.linePaddingLeft = 16,
      this.linePaddingRight = 16,
      this.borderWidth = 1.5,
      this.expanded = false,
      this.dottedDivider = false,
      this.solidDivider = false,
      this.showBorder = false,
      this.selected = false,
      this.shadow = false,
      this.borderRadius = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            border: showBorder
                ? Border.all(
                    color: borderColor ?? Theme.of(context).primaryColor,
                    width: borderWidth)
                : null,
            boxShadow: shadow
                ? [
                    const BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 0,
                      blurRadius: 6,
                    ),
                  ]
                : null,
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (expanded) Expanded(child: _child(context)),
              if (!expanded) _child(context),
              if (dottedDivider)
                Padding(
                  padding: EdgeInsets.only(
                      left: linePaddingLeft, right: linePaddingRight),
                  child: DashedLine(
                    color: color as Color,
                    dashWidth: 2.5,
                    height: 1.5,
                  ),
                ),
              if (solidDivider)
                Padding(
                  padding: EdgeInsets.only(
                      left: linePaddingLeft, right: linePaddingRight),
                  child: Divider(
                      height: 1,
                      thickness: 1,
                      color: Theme.of(context).primaryColor),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _child(BuildContext context) {
    return Padding(
      padding: padding as EdgeInsets,
      child: Center(child: child),
    );
  }
}

class DashedLine extends StatelessWidget {
  final double height;
  final double dashWidth;
  final Color color;

  const DashedLine(
      {Key? key,
      this.height = 1,
      this.color = Colors.black,
      this.dashWidth = 5.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      final boxWidth = constraints.constrainWidth();
      final dashHeight = height;
      final dashCount = (boxWidth / (2 * dashWidth)).floor();
      return Flex(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        direction: Axis.horizontal,
        children: List.generate(dashCount, (index) {
          return SizedBox(
            width: dashWidth,
            height: dashHeight,
            child: DecoratedBox(
              decoration: BoxDecoration(color: color),
            ),
          );
        }),
      );
    });
  }
}
