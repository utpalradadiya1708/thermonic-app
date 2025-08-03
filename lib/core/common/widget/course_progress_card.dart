import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thermonic/core/common/constants/image_constants.dart';
import 'package:thermonic/core/theme/color_constants.dart';
import 'package:thermonic/utils/widget_extensions.dart';

import '../../theme/app_theme.dart';

class CourseProgressCard extends StatelessWidget {
  final String title;
  final String lessonCount;
  final String duration;
  final String moduleProgress;
  final double progressPercent;
  final String imagePath;
  final Color bgColor;

  const CourseProgressCard({
    super.key,
    required this.title,
    required this.lessonCount,
    required this.duration,
    required this.moduleProgress,
    required this.progressPercent,
    required this.imagePath,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: EdgeInsetsDirectional.only(end: 12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 76,
            height: 76,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: ColorConstants.lightGreenColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.asset(imagePath, fit: BoxFit.contain),
          ),
          const SizedBox(width: 12),
          // Text + Progress
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppThemeState().textStyleRegular(
                    ColorConstants.blackColor2,
                    fontSize: 16,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                8.vBox,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(ImageConstants.icLessons),
                    6.hBox,
                    Expanded(
                      child: Text(
                        lessonCount,
                        style: AppThemeState().textStyleRegular(
                          ColorConstants.blackColor2,
                          fontSize: 12,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    16.hBox,
                    SvgPicture.asset(
                      ImageConstants.icClockGreen,
                      height: 14,
                      width: 15,
                    ),
                    6.hBox,
                    Expanded(
                      child: Text(
                        duration,
                        style: AppThemeState().textStyleRegular(
                          ColorConstants.blackColor2,
                          fontSize: 12,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                12.vBox,
                LinearProgressIndicator(
                  value: progressPercent,
                  borderRadius: BorderRadius.circular(35),
                  backgroundColor: ColorConstants.inActiveProgressColor,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    ColorConstants.greenColor,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        moduleProgress,
                        style: AppThemeState().textStyleRegular(Colors.black),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "${(progressPercent * 100).round()}%",
                      style: AppThemeState().textStyleRegular(Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
