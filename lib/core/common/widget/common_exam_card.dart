import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:thermonic/utils/widget_extensions.dart';

import '../../../models/exam_model_response/exam_model_response.dart';
import '../../routes/app_pages.dart';
import '../../theme/app_theme.dart';
import '../../theme/color_constants.dart';
import '../constants/app_constants.dart';
import '../constants/image_constants.dart';
import 'common_card.dart';
import 'common_components.dart';

class CommonExamCard extends StatelessWidget {
  final ExamModelResponse item;
  final bool isFromTab;
  final VoidCallback? onTap;

  const CommonExamCard({
    super.key,
    required this.item,
    this.isFromTab = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CommonCard(
      width: 206,
      child: isFromTab ? _buildExamCardForTabScreen() : _buildExamCard(),
    ).onTap(
      onTap ??
          () {
            Get.toNamed(
              Routes.exam,
              arguments: {ArgumentsConst.isFromExam: true},
            );
          },
    );
  }

  Widget _buildExamCard() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 64,
          width: 64,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadiusGeometry.circular(8),
            color: ColorConstants.primaryColor,
          ),
          child: CommonComponents.getNetworkImageViewAPI(
            item.image ?? '',
            // boxFit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 12),
        Flexible(
          child: Text(
            item.name ?? '',
            style: AppThemeState().textStyleRegular(
              ColorConstants.whiteColor,
              fontSize: 14,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
      ],
    );
  }

  Widget _buildExamCardForTabScreen() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 87,
          width: 87,
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            borderRadius: BorderRadiusGeometry.circular(8),
            color: ColorConstants.primaryColor,
          ),
          child: Image.asset(item.image ?? '', fit: BoxFit.cover),
        ),
        10.hBox,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.name ?? '',
                style: AppThemeState().textStyleRegular(
                  ColorConstants.whiteColor,
                  fontSize: 14,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              6.vBox,
              // Duration & Language
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 15,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(ImageConstants.icClock),
                      6.hBox,
                      Text(
                        '00:16',
                        style: AppThemeState().textStyleRegular(
                          ColorConstants.greyColor,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              8.vBox,
              IntrinsicWidth(
                child:
                    Container(
                      height: 32,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 9,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        gradient: CommonComponents.primaryPurpleGradient,
                      ),
                      child: Center(
                        child: Text(
                          'lblStartExam'.tr,
                          style: AppThemeState().textStyleRegular(
                            ColorConstants.whiteColor,
                            fontSize: 12,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ).onTap(() {
                      Get.toNamed(Routes.exam);
                    }),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
