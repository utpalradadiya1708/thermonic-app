import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/app_theme.dart';
import '../../theme/color_constants.dart';

class CommonHeaderView extends StatelessWidget {
  final String title;
  final VoidCallback? onViewAllTap;
  final bool showViewAll;

  const CommonHeaderView({
    super.key,
    required this.title,
    this.onViewAllTap,
    this.showViewAll = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: AppThemeState().textStyleRegular(
            ColorConstants.whiteColor,
            fontSize: 16,
          ),
        ),
        const Spacer(),
        if (showViewAll && onViewAllTap != null)
          GestureDetector(
            onTap: onViewAllTap,
            child: Text(
              'viewAll'.tr,
              style: AppThemeState().textStyleRegular(
                ColorConstants.greyColor,
                fontSize: 14,
                decoration: TextDecoration.underline,
                decorationColor: ColorConstants.greyColor,
              ),
            ),
          ),
      ],
    ).paddingSymmetric(horizontal: 16);
  }
}
