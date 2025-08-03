import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:thermonic/core/common/widget/common_background.dart';
import 'package:thermonic/core/common/widget/common_white_circle_with_center_icon.dart';
import 'package:thermonic/utils/widget_extensions.dart';

import '../../core/common/constants/image_constants.dart';
import '../../core/common/widget/common_button.dart';
import '../../core/theme/app_size_constants.dart';
import '../../core/theme/app_theme.dart';
import '../../core/theme/color_constants.dart';
import '../../core/theme/font_constants.dart';
import '../../localization/locate_controller.dart';
import 'otp_controller.dart';

class OtpView extends GetView<OtpController> {
  // final _otpPinFieldController = GlobalKey<OtpPinFieldState>();
  final LocaleController localeController = Get.put(LocaleController());

  OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    // final isRTL = Directionality.of(context) == TextDirection.rtl;
    // return CommonBackground(
    //   child: SafeArea(
    //     top: true,
    //     bottom: true,
    //     child: SingleChildScrollView(
    //       child: Stack(
    //         children: [
    //           Column(
    //             children: [
    //               24.vBox,
    //               SvgPicture.asset(
    //                 ImageConstants.icAppLogo,
    //                 height: 64,
    //                 width: 64,
    //               ),
    //               32.vBox,
    //               Text(
    //                 'otpVerificationTitle'.tr,
    //                 style: AppThemeState().textStyleRegular(
    //                   ColorConstants.whiteColor,
    //                   fontSize: FontConstants.font_20,
    //                 ),
    //                 textAlign: TextAlign.center,
    //                 softWrap: true,
    //               ).marginOnly(bottom: 8),
    //               Text(
    //                 '${'otpVerificationSubtitle'.tr} +${controller.countryCode}-${controller.mobileNumber ?? ''}',
    //                 style: AppThemeState().textStyleMedium(
    //                   ColorConstants.greyColor,
    //                   fontSize: FontConstants.font_16,
    //                 ),
    //                 textAlign: TextAlign.center,
    //               ).marginOnly(bottom: 24),
    //               LayoutBuilder(
    //                 builder: (context, constraints) {
    //                   const otpLength = 6;
    //                   double totalWidth = constraints.maxWidth;
    //                   double spacing = 12; // spacing between fields
    //                   double maxFieldWidth = 48;
    //
    //                   // Calculate the max width each field can occupy
    //                   double calculatedFieldWidth =
    //                       (totalWidth - (spacing * (otpLength - 1))) /
    //                       otpLength;
    //
    //                   // Ensure it doesn’t exceed max width
    //                   double fieldWidth = calculatedFieldWidth.clamp(
    //                     36,
    //                     maxFieldWidth,
    //                   );
    //
    //                   return OtpPinField(
    //                     key: _otpPinFieldController,
    //                     autoFillEnable: false,
    //                     textInputAction: TextInputAction.next,
    //                     onSubmit: (text) {},
    //                     onChange: (text) {},
    //                     onCodeChanged: (code) {},
    //                     fieldHeight: 48,
    //                     fieldWidth: fieldWidth,
    //                     autoFocus: false,
    //                     otpPinFieldStyle: OtpPinFieldStyle(
    //                       showHintText: true,
    //                       activeFieldBackgroundColor:
    //                           ColorConstants.primaryColor,
    //                       defaultFieldBorderColor: ColorConstants.borderColor,
    //                       defaultFieldBackgroundColor:
    //                           ColorConstants.secondaryButtonColor,
    //                       textStyle: AppThemeState().textStyleRegular(
    //                         ColorConstants.whiteColor,
    //                         fontSize: 16,
    //                       ),
    //                       fieldBorderRadius: 8,
    //                       hintText: "",
    //                     ),
    //                     maxLength: otpLength,
    //                     showCursor: false,
    //                     cursorColor: ColorConstants.secondaryColor,
    //                     showCustomKeyboard: false,
    //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                     otpPinFieldDecoration: OtpPinFieldDecoration.custom,
    //                   );
    //                 },
    //               ).paddingSymmetric(horizontal: 8).marginOnly(bottom: 24),
    //
    //               // Form(key: controller.formKey, child: onGetEmailTextFormField()),
    //               CommonButton(
    //                 buttonText: 'lblVerify'.tr,
    //                 onTap: () async {
    //                   final enteredOtp =
    //                       _otpPinFieldController
    //                           .currentState
    //                           ?.controller
    //                           .text ??
    //                       "";
    //                   final isValid = await controller.onSubmitButtonClick(
    //                     enteredOtp,
    //                   );
    //
    //                   if (!isValid && enteredOtp.length == 6) {
    //                     _otpPinFieldController.currentState?.clearOtp();
    //                   }
    //                 },
    //               ).marginOnly(bottom: 28),
    //               Obx(() {
    //                 if (controller.secondsRemaining.value == 0) {
    //                   return Text(
    //                     'lblResendCode'.tr,
    //                     style: AppThemeState().textStyleRegular(
    //                       ColorConstants.greyColor,
    //                       decoration: TextDecoration.underline,
    //                       fontSize: FontConstants.font_14,
    //                     ),
    //                   ).onTap(() async {
    //                     controller.onResendOtp();
    //                     _otpPinFieldController.currentState?.clearOtp();
    //                     controller.startTimer();
    //                   });
    //                 }
    //
    //                 return RichText(
    //                   text: TextSpan(
    //                     text: 'lblResendCodeIn'.tr,
    //                     style: AppThemeState().textStyleRegular(
    //                       ColorConstants.greyColor,
    //                       fontSize: FontConstants.font_14,
    //                     ),
    //                     children: <TextSpan>[
    //                       TextSpan(
    //                         text:
    //                             "00:${controller.secondsRemaining.value.toString().padLeft(2, '0')}",
    //                         style: AppThemeState().textStyleRegular(
    //                           ColorConstants.primaryColor,
    //                           fontSize: FontConstants.font_14,
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 );
    //               }),
    //             ],
    //           ).marginSymmetric(horizontal: AppSizeConstants.size_15),
    //           isRTL
    //               ? Positioned(
    //                   right: 16,
    //                   top: 24,
    //                   child: CommonWhiteCircleWithCenterIcon(
    //                     child: SvgPicture.asset(
    //                       ImageConstants.icBackArrow,
    //                       height: 24,
    //                       width: 24,
    //                       matchTextDirection: true,
    //                     ),
    //                     onTap: () {
    //                       Get.back();
    //                     },
    //                   ),
    //                 )
    //               : Positioned(
    //                   left: 16,
    //                   top: 24,
    //                   child: CommonWhiteCircleWithCenterIcon(
    //                     child: SvgPicture.asset(
    //                       ImageConstants.icBackArrow,
    //                       height: 24,
    //                       width: 24,
    //                       matchTextDirection: true,
    //                     ),
    //                     onTap: () {
    //                       Get.back();
    //                     },
    //                   ),
    //                 ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
    return Placeholder();
  }
}
