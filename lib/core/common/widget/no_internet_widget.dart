import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:thermonic/utils/widget_extensions.dart';

import '../../routes/app_pages.dart';
import '../../theme/app_theme.dart';
import '../../theme/color_constants.dart';
import '../constants/image_constants.dart';
import 'common_button.dart';

class NoInternetWidget extends StatelessWidget {
  const NoInternetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(ImageConstants.icNoInternet, width: 120, height: 120),
        16.vBox,
        Text(
          'lblNoInternet'.tr,
          style: AppThemeState().textStyleRegular(
            ColorConstants.whiteColor,
            fontSize: 16,
          ),
        ),
        8.vBox,
        Text(
          'lblNoInternetInfo'.tr,
          style: AppThemeState().textStyleRegular(
            ColorConstants.greyColor,
            fontSize: 14,
          ),
        ),
        32.vBox,
        CommonButton(
          buttonText: 'lblGoToDownloads'.tr,
          onTap: () {
            Get.toNamed(Routes.myDownloads);
          },
          backgroundColor: Colors.transparent,
          border: Border.all(color: ColorConstants.primaryColor),
        ).paddingSymmetric(horizontal: 16),
      ],
    ).paddingSymmetric(horizontal: 16);
    // return Padding(
    //   padding: const EdgeInsets.all(12),
    //
    //   child: ElevatedButton.icon(
    //     onPressed: () => Get.toNamed(Routes.myDownloads),
    //     icon: Icon(Icons.download),
    //     label: Text("You're offline – Go to Downloads"),
    //     style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
    //   ),
    // );
  }
}
