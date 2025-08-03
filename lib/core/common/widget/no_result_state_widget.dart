import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thermonic/core/common/widget/common_button.dart';
import 'package:thermonic/utils/widget_extensions.dart';

import '../../theme/app_theme.dart';
import '../../theme/color_constants.dart';
import '../../theme/font_constants.dart';

enum NoResultType { noData, noInternet }

class NoResultStateWidget extends StatelessWidget {
  final NoResultType type;
  final String? message;
  final VoidCallback onRetry;

  const NoResultStateWidget({
    super.key,
    required this.type,
    required this.onRetry,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    String displayMessage;
    String imagePath;

    switch (type) {
      case NoResultType.noInternet:
        displayMessage = message ?? "lblNoInternet";
        // imagePath = ImageConstants.noInternet;
        break;
      case NoResultType.noData:
        displayMessage = message ?? "lblNoData";
        // imagePath = ImageConstants.noData;
        break;
    }

    return Center(
      child: Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset(
            //   imagePath,
            //   width: 180,
            //   height: 180,
            //   fit: BoxFit.contain,
            // ),
            20.vBox,
            Text(
              displayMessage.tr,
              style: AppThemeState().textStyleRegular(
                ColorConstants.whiteColor,
                fontSize: FontConstants.font_16,
              ),
              textAlign: TextAlign.center,
            ),
            24.vBox,
            CommonButton(buttonText: 'lblRetry'.tr, onTap: onRetry),
          ],
        ),
      ),
    );
  }
}
