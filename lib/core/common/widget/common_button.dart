import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/app_size_constants.dart';
import '../../theme/app_theme.dart';
import '../../theme/color_constants.dart';
import '../../theme/font_constants.dart';

class CommonButton extends StatefulWidget {
  const CommonButton({
    super.key,
    this.width,
    this.height,
    this.backgroundColor,
    this.textColor,
    required this.buttonText,
    required this.onTap,
    this.padding,
    this.borderRadius,
    this.textAlign,
    this.suffixIcon,
    this.fontSize,
    this.border,
    this.debounceDuration = const Duration(seconds: 1),
  });

  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? textColor;
  final String buttonText;
  final void Function() onTap;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;
  final Widget? suffixIcon;
  final TextAlign? textAlign;
  final BoxBorder? border;
  final Duration debounceDuration;
  final double? fontSize;

  @override
  State<CommonButton> createState() => _CommonButtonState();
}

class _CommonButtonState extends State<CommonButton> {
  DateTime? _lastTapTime;

  void _handleTap() {
    final now = DateTime.now();
    if (_lastTapTime == null ||
        now.difference(_lastTapTime!) > widget.debounceDuration) {
      _lastTapTime = now;
      widget.onTap();
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _handleTap,
      hoverColor: ColorConstants.transparentColor,
      splashColor: ColorConstants.transparentColor,
      focusColor: ColorConstants.transparentColor,
      child: Container(
        width: widget.width ?? Get.width,
        decoration: BoxDecoration(
          color: widget.backgroundColor ?? ColorConstants.primaryColor,
          borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
          border: widget.border ?? const Border.fromBorderSide(BorderSide.none),
        ),
        padding:
            widget.padding ??
            EdgeInsets.symmetric(
              vertical: AppSizeConstants.size_15,
              horizontal: AppSizeConstants.size_20,
            ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                widget.buttonText,
                textAlign: widget.textAlign ?? TextAlign.center,
                style: AppThemeState().textStyleRegular(
                  widget.textColor ?? ColorConstants.whiteColor,
                  fontSize: widget.fontSize ?? FontConstants.font_16,
                ),
              ),
            ),
            widget.suffixIcon ?? Container(),
          ],
        ),
      ),
    );
  }
}
