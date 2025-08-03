import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/color_constants.dart';

class CommonWhiteCircleWithCenterIcon extends GetView {
  const CommonWhiteCircleWithCenterIcon({
    required this.child,
    this.onTap,
    this.padding,
    this.boxDecoration,
    this.borderColor,
    this.color,
    this.width,
    this.borderRadius,
    this.height,
    super.key,
  });

  final Widget child;
  final double? height;
  final double? width;
  final double? borderRadius;
  final EdgeInsets? padding;
  final BoxDecoration? boxDecoration;
  final Color? borderColor;
  final Color? color;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height ?? 38,
        width: width ?? 44,
        padding: padding ?? EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        decoration:
            boxDecoration ??
            BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius ?? 8),
              color: color ?? ColorConstants.primaryColor,
              border: Border.all(
                color: borderColor ?? ColorConstants.borderColor,
                width: 1,
              ),
            ),
        child: child,
      ),
    );
  }
}
