import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thermonic/utils/widget_extensions.dart';

import '../../routes/app_pages.dart';
import '../../theme/app_theme.dart';
import '../../theme/color_constants.dart';
import '../constants/app_constants.dart';
import 'common_card.dart';
import 'common_components.dart';

class ExamOrPackageCard extends StatelessWidget {
  final String? name;
  final String? imageUrl;
  final int? expiryDaysRemaining;
  final String? gradeName;
  final String? type;
  final String? semesterName;
  final String? streamName;
  final String? orderAmount;
  final bool isForExam;
  final bool? examAttempted;
  final int? itemId;
  final int subjectId;
  final VoidCallback? onTap;
  final bool? isExpired;

  // Order detail strings
  final String? purchasedOn;
  final String? expiresOn;
  final String? daysRemaining;
  final String? orderId;
  final String? planType;

  const ExamOrPackageCard({
    super.key,
    this.name,
    this.imageUrl,
    this.expiryDaysRemaining,
    this.gradeName,
    this.type,
    this.semesterName,
    this.streamName,
    this.orderAmount,
    this.examAttempted,
    required this.isForExam,
    this.itemId,
    this.onTap,
    required this.subjectId,
    this.purchasedOn,
    this.expiresOn,
    this.daysRemaining,
    this.orderId,
    this.planType,
    this.isExpired,
  });

  @override
  Widget build(BuildContext context) {
    return CommonCard(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (imageUrl != null)
                CommonComponents.getNetworkImageViewAPI(imageUrl!, width: 80, height: 80, radius: 12, boxFit: BoxFit.contain),
              14.hBox,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name ?? '', style: AppThemeState().textStyleRegular(ColorConstants.whiteColor, fontSize: 14)),
                    const SizedBox(height: 6),
                    // Show "Expired" label if expired
                    if (isExpired == true) ...[
                      Text(
                        'lblExpired'.tr,
                        style: AppThemeState().textStyleRegular(
                          ColorConstants.redColor,
                          fontSize: 14,
                          decoration: TextDecoration.underline,
                          decorationColor: ColorConstants.primaryColor,
                        ),
                      ).marginOnly(bottom: 8),
                    ]
                    // Show "Days Remaining" only if NOT expired, expiryDaysRemaining is not null, and exam not attempted
                    else if (isExpired == false && expiryDaysRemaining != null && examAttempted != true) ...[
                      Text(
                        'lblDaysRemaining'.trParams({'value': expiryDaysRemaining.toString()}),
                        style: AppThemeState().textStyleRegular(
                          ColorConstants.primaryColor,
                          fontSize: 14,
                          decoration: TextDecoration.underline,
                          decorationColor: ColorConstants.primaryColor,
                        ),
                      ).onTap(() {
                        CommonComponents.commonBottomSheet(
                          child: _buildOrderDetailsBottomSheet(),
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                          boxDecoration: BoxDecoration(
                            color: ColorConstants.secondaryButtonColor,
                            border: Border(
                              top: BorderSide(color: ColorConstants.primaryColor),
                              left: BorderSide(color: ColorConstants.primaryColor),
                              right: BorderSide(color: ColorConstants.primaryColor),
                            ),
                            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                          ),
                          enableDrag: true,
                        );
                      }),
                    ],
                    (expiryDaysRemaining != null && !(examAttempted ?? false)) ? 10.vBox : 5.vBox,
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        if (gradeName != null) CommonComponents.gradientContainer(gradeName!),
                        if (semesterName != 'sem1_sem2' && (semesterName?.isNotEmpty ?? false))
                          CommonComponents.gradientContainer(semesterName!),
                        if (streamName?.isNotEmpty ?? false) CommonComponents.gradientContainer(streamName!),
                      ],
                    ),

                    if (examAttempted ?? false) ...[
                      10.vBox,
                      Text('lblExamAttempted'.tr, style: AppThemeState().textStyleRegular(ColorConstants.greenColor)),
                    ],
                  ],
                ),
              ),
            ],
          ),

          if (isForExam && !(examAttempted ?? false) && (type != 'grade' && type != 'grade_exam')) ...[
            16.vBox,
            InkWell(
              onTap:
                  onTap ??
                  () {
                    CommonComponents.commonDialog(
                      title: 'lblExamWarningMessage'.tr,
                      positiveText: 'Ok',
                      negativeText: 'Cancel',
                      onPositiveTap: () {
                        if (itemId != null) {
                          Get.toNamed(Routes.exam, arguments: {ArgumentsConst.orderId: itemId, ArgumentsConst.subjectId: subjectId});
                        }
                      },
                    );
                  },
              child: Container(
                height: 40,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), gradient: CommonComponents.primaryPurpleGradient),
                child: Center(
                  child: Text('lblStartExam'.tr, style: AppThemeState().textStyleRegular(ColorConstants.whiteColor, fontSize: 12)),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildOrderDetailsBottomSheet() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("lblOrderDetails".tr, style: AppThemeState().textStyleMedium(ColorConstants.whiteColor, fontSize: 18)),
          16.vBox,
          _orderInfoTile("lblPurchasedOn".tr, purchasedOn ?? "-"),
          _orderInfoTile("lblExpiresOn".tr, expiresOn ?? "-"),

          _orderInfoTile("lblRemainingDays".tr, daysRemaining ?? expiryDaysRemaining.toString()),

          _orderInfoTile("lblOrderId".tr, itemId.toString() ?? "-"),

          _orderInfoTile("lblOrderAmount".tr, orderAmount ?? "-"),
        ],
      ),
    );
  }

  Widget _orderInfoTile(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppThemeState().textStyleRegular(ColorConstants.whiteColor, fontSize: 14)),
          Text(value, style: AppThemeState().textStyleMedium(ColorConstants.whiteColor, fontSize: 14)),
        ],
      ),
    );
  }
}
