import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/app_size_constants.dart';
import '../../theme/color_constants.dart';

class CommonCircleWithCenterIcon extends GetView {
  const CommonCircleWithCenterIcon({
    required this.child,
    this.padding,
    this.boxDecoration,
    super.key,
  });

  final Widget child;
  final EdgeInsets? padding;
  final BoxDecoration? boxDecoration;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.all(AppSizeConstants.size_15),
      decoration:
          boxDecoration ??
          BoxDecoration(
            shape: BoxShape.circle,
            color: ColorConstants.whiteColor,
          ),
      child: child,
    );
  }
}
