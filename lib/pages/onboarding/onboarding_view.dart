import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thermonic/pages/onboarding/pages/onboarding_common_view.dart';
import 'package:thermonic/utils/widget_extensions.dart';

import '../../core/common/constants/image_constants.dart';
import '../../core/common/widget/common_background.dart';
import '../../core/common/widget/common_button.dart';
import '../../core/theme/app_size_constants.dart';
import '../../core/theme/color_constants.dart';
import 'onboarding_controller.dart';

class OnBoardingView extends GetView<OnBoardingController> {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonBackground(
      child: SafeArea(
        top: false,
        bottom: true,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isSmallDevice = constraints.maxHeight < 720;

            return Column(
              children: [
                24.vBox,
                // if (!isSmallDevice) 24.vBox else 24.vBox,
                Expanded(
                  child: Center(
                    child: PageView(
                      // physics: const NeverScrollableScrollPhysics(),
                      controller: controller.pageController.value,
                      onPageChanged: (index) {
                        controller.currentPage.value = index;
                      },
                      children: [
                        OnBoardingCommonView(
                          pageImage: ImageConstants.onBoarding1New,
                          pageMessage: 'onBoardingFirstMsg'.tr,
                          pageTitle: 'onBoardingFirstTitle'.tr,
                          isSmallDevice: isSmallDevice,
                        ),
                        OnBoardingCommonView(
                          pageImage: ImageConstants.onBoarding2New,
                          pageMessage: 'onBoardingSecondMsg'.tr,
                          pageTitle: 'onBoardingSecondTitle'.tr,
                          isSmallDevice: isSmallDevice,
                        ),
                        OnBoardingCommonView(
                          pageImage: ImageConstants.onBoarding3New,
                          pageMessage: 'onBoardingThirdMsg'.tr,
                          pageTitle: 'onBoardingThirdTitle'.tr,
                          isSmallDevice: isSmallDevice,
                        ),
                      ],
                    ),
                  ),
                ),
                if (!isSmallDevice) 24.vBox else 12.vBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (index) {
                    // For RTL, reverse the index
                    int displayIndex =
                        Directionality.of(context).name ==
                            TextDirection.rtl.name
                        ? (2 - index)
                        : index;

                    return Obx(() {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: controller.currentPage.value == displayIndex
                            ? AppSizeConstants.size_30
                            : AppSizeConstants.size_15,
                        height: AppSizeConstants.size_6,
                        margin: EdgeInsets.symmetric(
                          horizontal: AppSizeConstants.size_6,
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(
                            AppSizeConstants.size_26,
                          ),
                          color: controller.currentPage.value == displayIndex
                              ? ColorConstants.primaryColor
                              : ColorConstants.primaryColor.withValues(
                                  alpha: 0.2,
                                ),
                        ),
                      );
                    });
                  }),
                ),
                if (!isSmallDevice) 72.vBox else 24.vBox,
                Obx(
                  () => controller.currentPage.value == 2
                      ? Row(
                          children: [
                            Expanded(
                              child: CommonButton(
                                buttonText: 'lblGetStarted'.tr,
                                onTap: () {
                                  controller.nextScreen();
                                },
                              ),
                            ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: CommonButton(
                                border: Border.all(
                                  color: ColorConstants.borderColor,
                                  width: 1,
                                ),
                                textColor:
                                    ColorConstants.secondaryButtonTextColor,
                                buttonText: 'lblSkip'.tr,
                                backgroundColor:
                                    ColorConstants.secondaryButtonColor,
                                onTap: () {
                                  controller.nextScreen();
                                },
                              ),
                            ),
                            21.hBox,
                            Expanded(
                              child: CommonButton(
                                buttonText: 'lblNext'.tr,
                                onTap: () {
                                  controller.pageController.value.nextPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeIn,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                ),
                if (!isSmallDevice) 32.vBox else 16.vBox,
              ],
            ).paddingSymmetric(horizontal: 16);
          },
        ),
      ),
    );
    // var height = MediaQuery.of(context).viewPadding.top;
  }
}
