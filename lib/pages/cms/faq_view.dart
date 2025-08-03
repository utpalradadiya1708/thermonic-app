import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thermonic/core/common/widget/common_card.dart';
import 'package:thermonic/utils/widget_extensions.dart';

import '../../core/common/constants/image_constants.dart';
import '../../core/common/widget/common_appbar.dart';
import '../../core/common/widget/common_background.dart';
import '../../core/common/widget/expanded_section.dart';
import '../../core/theme/app_size_constants.dart';
import '../../core/theme/app_theme.dart';
import '../../core/theme/color_constants.dart';
import '../../core/theme/font_constants.dart';
import 'cms_controller.dart';

class FaqView extends GetView<CmsController> {
  const FaqView({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonBackground(
      child: Column(
        children: [
          CommonAppBar(text: 'lblFAQ'.tr),
          Expanded(
            child: Obx(
              () => ListView.separated(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: controller.faqList.value.length,
                separatorBuilder: (context, index) {
                  return 16.vBox;
                },
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          if (controller.expandedIndex.value == index) {
                            controller.expandedIndex.value = -1;
                          } else {
                            controller.expandedIndex.value = index;
                          }
                        },
                        child: Obx(() {
                          bool isExpanded =
                              controller.expandedIndex.value == index;

                          return CommonCard(
                            decoration: BoxDecoration(
                              color: ColorConstants.secondaryButtonColor,
                              border: Border(
                                top: BorderSide(
                                  color: ColorConstants.borderColor,
                                ),
                                left: BorderSide(
                                  color: ColorConstants.borderColor,
                                ),
                                right: BorderSide(
                                  color: ColorConstants.borderColor,
                                ),
                                bottom: isExpanded
                                    ? BorderSide.none
                                    : BorderSide(
                                        color: ColorConstants.borderColor,
                                      ),
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                                bottomLeft: isExpanded
                                    ? Radius.zero
                                    : Radius.circular(12),
                                bottomRight: isExpanded
                                    ? Radius.zero
                                    : Radius.circular(12),
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: AppSizeConstants.size_16,
                              vertical: AppSizeConstants.size_12,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(
                                    controller.faqList.value[index]["question"],
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: AppThemeState().textStyleRegular(
                                      ColorConstants.whiteColor,
                                      fontSize: FontConstants.font_16,
                                    ),
                                  ),
                                ),
                                Image.asset(
                                  isExpanded
                                      ? ImageConstants.icMinus
                                      : ImageConstants.icExpand,
                                  height: isExpanded ? 18 : 12,
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                      Obx(() {
                        final bool isExpanded =
                            controller.expandedIndex.value == index;
                        return ExpandedSection(
                          expand: isExpanded,
                          child: CommonCard(
                            padding: EdgeInsets.only(
                              top: 0,
                              left: AppSizeConstants.size_16,
                              right: AppSizeConstants.size_16,
                              bottom: AppSizeConstants.size_10,
                            ),
                            decoration: BoxDecoration(
                              color: ColorConstants.secondaryButtonColor,
                              border: Border(
                                top: isExpanded
                                    ? BorderSide.none
                                    : BorderSide(
                                        color: ColorConstants.borderColor,
                                      ),
                                left: BorderSide(
                                  color: ColorConstants.borderColor,
                                ),
                                right: BorderSide(
                                  color: ColorConstants.borderColor,
                                ),
                                bottom: BorderSide(
                                  color: ColorConstants.borderColor,
                                ),
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: isExpanded
                                    ? Radius.zero
                                    : Radius.circular(12),
                                topRight: isExpanded
                                    ? Radius.zero
                                    : Radius.circular(12),
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                              ),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // Optionally show vertical line here using SVG
                                Flexible(
                                  fit: FlexFit.tight,
                                  child: Text(
                                    controller.faqList.value[index]["answer"],
                                    style: AppThemeState().textStyleRegular(
                                      ColorConstants.whiteColor,
                                      fontSize: FontConstants.font_14,
                                    ),
                                  ),
                                ),
                              ],
                            ).marginOnly(bottom: AppSizeConstants.size_15),
                          ),
                        );
                      }),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ).paddingSymmetric(horizontal: AppSizeConstants.size_16),
    );
  }
}
