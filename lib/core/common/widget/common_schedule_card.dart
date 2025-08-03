import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:thermonic/utils/widget_extensions.dart';

import '../../theme/app_theme.dart';
import '../../theme/color_constants.dart';
import 'common_card.dart';

class CommonScheduleCard extends StatelessWidget {
  final String? image;
  final String? title;
  final String? subTitle;
  final String? subTitleIcon;
  final TextStyle? titleStyle;
  final TextStyle? subTitleStyle;
  final Widget? suffixWidget;
  final Color? color;
  final String? text;

  const CommonScheduleCard({
    super.key,
    this.image,
    this.color,
    this.title,
    this.subTitle,
    this.suffixWidget,
    this.subTitleIcon,
    this.subTitleStyle,
    this.text,
    this.titleStyle,
  });

  @override
  Widget build(BuildContext context) {
    return CommonCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: color ?? ColorConstants.primaryColor,
            ),
            padding: const EdgeInsets.all(9),
            child: text != null
                ? Text(
                    text ?? '',
                    style: AppThemeState().textStyleRegular(
                      ColorConstants.whiteColor,
                      fontSize: 14,
                    ),
                  )
                : SvgPicture.asset(image ?? ''),
          ),
          10.hBox,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title ?? '',
                  style:
                      titleStyle ??
                      AppThemeState().textStyleMedium(
                        ColorConstants.whiteColor,
                        fontSize: 16,
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                6.vBox,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (subTitleIcon != null) ...[
                      SvgPicture.asset(subTitleIcon ?? ''),
                      6.hBox,
                    ],
                    Expanded(
                      child: Text(
                        subTitle ?? '',
                        style:
                            subTitleStyle ??
                            AppThemeState().textStyleMedium(
                              ColorConstants.greyColor,
                              fontSize: 14,
                            ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (suffixWidget != null) ...[8.hBox, suffixWidget!],
        ],
      ),
    );
  }
}
