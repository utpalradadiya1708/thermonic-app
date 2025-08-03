import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thermonic/utils/widget_extensions.dart';

import '../../theme/app_theme.dart';
import '../../theme/color_constants.dart';
import '../constants/image_constants.dart';

class NoDataWidget extends StatelessWidget {
  final String? text;
  final String? subText;
  const NoDataWidget({super.key, this.text, this.subText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            ImageConstants.icNoDataFound,
            height: 120,
            width: 120,
            matchTextDirection: true,
          ),
          16.vBox,
          Text(
            text ?? 'lblDataNotAvailable'.tr,
            style: AppThemeState().textStyleRegular(
              ColorConstants.whiteColor,
              fontSize: 16,
            ),
          ),
          8.vBox,
          Text(
            subText ?? 'lblDataNotAvailableInfo'.tr,
            textAlign: TextAlign.center,
            style: AppThemeState().textStyleRegular(
              ColorConstants.greyColor,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
