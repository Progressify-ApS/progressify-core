import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'custom_text.dart';
import 'styles.dart';

class CustomLink extends StatelessWidget {
  final String text;
  final String url;
  final TextType textType;
  final TextType hoverType;
  final Color color;
  final EdgeInsets? margin;
  final TextAlign? textAlign;
  final double? lineSpacing;
  final int? maxLines;
  final TextOverflow overflow;
  final Function()? onTap;

  CustomLink(this.text,
      {String? url,
      this.textType = TextType.h5,
      this.hoverType = TextType.h5SemiBold,
      Color? color,
      this.onTap,
      this.margin = EdgeInsets.zero,
      this.textAlign,
      this.lineSpacing = 1.5,
      this.maxLines,
      this.overflow = TextOverflow.visible,
      Key? key})
      : url = url ?? '',
        color = color ?? AppStyleCore.black,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    bool hover = false;
    return StatefulBuilder(builder: (context, setState) {
      return MouseRegion(
        onEnter: (event) {
          setState(() => hover = true);
        },
        onExit: (event) {
          setState(() => hover = false);
        },
        child: InkWell(
          onTap: () async {
            if (onTap != null) {
              onTap!();
            } else {
              try {
                launchUrl(Uri.parse(url));
              } catch (e) {
                if (kDebugMode) {
                  print(e);
                }
              }
            }
          },
          child: CustomText(
            text,
            color: color,
            textType: hover ? hoverType : textType,
            fontStyle: hover ? FontStyle.italic : FontStyle.normal,
            margin: margin,
            textAlign: textAlign,
            lineSpacing: lineSpacing,
            maxLines: maxLines,
            overflow: overflow,
          ),
        ),
      );
    });
  }
}
