import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thermonic/utils/widget_extensions.dart';

import '../../../core/theme/app_theme.dart';
import '../../../core/theme/color_constants.dart';
import '../../../core/theme/font_constants.dart';

class OnBoardingCommonView extends StatelessWidget {
  final String pageImage;
  final String pageTitle;
  final String pageMessage;
  final bool isSmallDevice;

  const OnBoardingCommonView({
    super.key,
    required this.pageImage,
    required this.pageTitle,
    required this.pageMessage,
    this.isSmallDevice = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          pageImage,
          // height: isSmallDevice ? 220 : 240,
          // fit: BoxFit.contain,
        ),
        16.vBox,
        Text(
          pageTitle,
          style: AppThemeState().textStyleRegular(
            ColorConstants.whiteColor,
            fontSize: isSmallDevice ? 20 : FontConstants.font_28,
          ),
          textAlign: TextAlign.center,
        ).marginOnly(bottom: 8),
        Text(
          pageMessage,
          style: AppThemeState().textStyleRegular(
            ColorConstants.greyColor,
            fontSize: isSmallDevice ? 14 : FontConstants.font_16,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
