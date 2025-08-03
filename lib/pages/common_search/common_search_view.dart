import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:thermonic/utils/widget_extensions.dart';

import '../../core/common/constants/app_constants.dart';
import '../../core/common/constants/image_constants.dart';
import '../../core/common/widget/common_background.dart';
import '../../core/common/widget/common_card.dart';
import '../../core/common/widget/common_components.dart';
import '../../core/common/widget/common_textform_field.dart';
import '../../core/common/widget/common_white_circle_with_center_icon.dart';
import '../../core/common/widget/no_data_widget.dart';
import '../../core/common/widget/shimmer_effect.dart';
import '../../core/routes/app_pages.dart';
import '../../core/theme/app_theme.dart';
import '../../core/theme/color_constants.dart';
import 'common_search_controller.dart';

class CommonSearchView extends GetView<CommonSearchController> {
  const CommonSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonBackground(
      child: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                CommonWhiteCircleWithCenterIcon(
                  height: 48,
                  width: 44,
                  onTap: Get.back,
                  child: SvgPicture.asset(
                    ImageConstants.icBackArrow,
                    matchTextDirection: true,
                  ),
                ),
                8.hBox,
                Expanded(
                  child: CommonTextFormField(
                    editController: controller.searchTextController.value,
                    focusNode: controller.searchFocus,
                    borderRadius: 12,
                    prefixWidget: SvgPicture.asset(
                      ImageConstants.icSearch,
                      height: 20,
                      width: 20,
                    ).paddingOnly(left: 0, top: 15, bottom: 15),
                    labelText: 'searchEvents'.tr,
                    onChange: controller.onSearchDebounced,
                    onValidate: (_) => null,
                    isAutofocus: true,
                    onChangeDebounceDuration: Duration(milliseconds: 300),
                    onDebounceChange: (value) {
                      // Perform Search Here
                    },
                  ),
                ),
              ],
            ),
            16.vBox,
            Expanded(
              child: Obx(() {
                if (controller.isShimmerShow.value &&
                    controller.commonSearchResultList.value.isEmpty) {
                  return shimmerView();
                }

                if (controller.commonSearchResultList.value.isEmpty) {
                  return NoDataWidget();
                }
                return ListView.separated(
                  shrinkWrap: true,
                  controller: controller.scrollController,
                  padding: EdgeInsets.zero,
                  // physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    var result = controller.commonSearchResultList.value[index];
                    return CommonCard(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          CommonComponents.getNetworkImageViewAPI(
                            result.image ?? '',
                            height: 100,
                            width: 100,
                            radius: 12,
                            boxFit: BoxFit.contain,
                          ),
                          9.hBox,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                result.name ?? '',
                                style: AppThemeState().textStyleRegular(
                                  ColorConstants.whiteColor,
                                  fontSize: 14,
                                ),
                              ),
                              6.vBox,
                              Text(
                                result.type != null && result.type!.isNotEmpty
                                    ? '${result.type![0].toUpperCase()}${result.type!.substring(1).toLowerCase()}'
                                    : '',
                                // result.type?.toUpperCase() ?? '',
                                style: AppThemeState().textStyleRegular(
                                  ColorConstants.greyColor,
                                  fontSize: 12,
                                ),
                              ),
                              8.vBox,
                              Text(
                                'lblKwd'.trParams({
                                  'value': result.price ?? '',
                                }),
                                style: AppThemeState().textStyleRegular(
                                  ColorConstants.greenColor,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ).onTap(() {
                      Get.toNamed(
                        result.type == 'exam'
                            ? Routes.examDetail
                            : Routes.courseDetail,
                        arguments: {
                          ArgumentsConst.courseName: result.name,
                          ArgumentsConst.courseId: result.id,
                          // ArgumentsConst.courseType: CourseType.examPackage,
                        },
                      );
                    });
                  },
                  separatorBuilder: (context, index) {
                    return 16.vBox;
                  },
                  itemCount: controller.commonSearchResultList.value.length,
                ).marginOnly(bottom: 20);
              }),
            ),
          ],
        ).paddingSymmetric(horizontal: 16),
      ),
    );
  }

  Widget shimmerView() {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return ShimmerEffect(height: 90);
      },
      separatorBuilder: (context, index) {
        return 16.vBox;
      },
      itemCount: 8,
    );
  }
}
