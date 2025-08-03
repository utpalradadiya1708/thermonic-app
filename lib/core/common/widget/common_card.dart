import 'package:flutter/material.dart';

import '../../theme/color_constants.dart';

class CommonCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final EdgeInsets? margin;
  final Color color;
  final double? borderRadius;
  final Color? borderColor;
  final double? height;
  final double? width;
  final BoxBorder? border;
  final BorderRadiusGeometry? borderRadiusGeometry;
  final Decoration? decoration;

  const CommonCard({
    super.key,
    this.height,
    this.width,
    required this.child,
    this.borderRadius,
    this.borderColor,
    this.padding = const EdgeInsets.all(10),
    this.margin,
    this.border,
    this.decoration,
    this.borderRadiusGeometry,
    this.color = ColorConstants.secondaryButtonColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // Only set constraints if not inside Expanded/Flexible
      constraints: (height != null || width != null)
          ? BoxConstraints(
              minHeight: height ?? 0,
              maxHeight: height ?? double.infinity,
              minWidth: width ?? 0,
              maxWidth: width ?? double.infinity,
            )
          : null,
      margin: margin,
      padding: padding,
      decoration:
          decoration ??
          BoxDecoration(
            color: color,
            borderRadius:
                borderRadiusGeometry ??
                BorderRadius.circular(borderRadius ?? 12),
            border:
                border ??
                Border.all(
                  color: borderColor ?? ColorConstants.borderColor,
                  width: 1,
                ),
          ),
      child: child,
    );
  }
}
