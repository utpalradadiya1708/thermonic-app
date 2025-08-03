import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:thermonic/utils/widget_extensions.dart';

import '../../core/common/constants/app_constants.dart';
import '../../core/common/constants/image_constants.dart';
import '../../core/common/repository/local_data/local_data_source.dart';
import '../../core/common/widget/common_background.dart';
import '../../core/common/widget/common_button.dart';
import '../../core/common/widget/common_check_box.dart';
import '../../core/common/widget/common_textform_field.dart';
import '../../core/di/injector_container.dart';
import '../../core/routes/app_pages.dart';
import '../../core/theme/app_size_constants.dart';
import '../../core/theme/app_theme.dart';
import '../../core/theme/color_constants.dart';
import '../../core/theme/font_constants.dart';
import '../../localization/locate_controller.dart';
import '../../utils/validator.dart';
import 'login_controller.dart';

class LoginView extends GetView<LoginController> {
  final LocaleController localeController = Get.put(LocaleController());
  final localDataSource = getIt<LocalDataSource>();

  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return CommonBackground(
      child: SafeArea(
        top: true,
        bottom: true,
        child: SingleChildScrollView(
          child: Column(
            children: [
              50.vBox,
              Image.asset(ImageConstants.icAppLogo, height: 64, width: 64,),
              20.vBox,

              /* 24.vBox,
              // SvgPicture.asset(ImageConstants.icAppLogo, height: 64, width: 64,color: Colors.black,),
              32.vBox,*/
             /* Text(
                'loginTitle'.tr,
                style: AppThemeState().textStyleRegular(
                  ColorConstants.whiteColor,
                  fontSize: FontConstants.font_20,
                ),
                textAlign: TextAlign.center,
                softWrap: true,
              ).marginOnly(bottom: 8),*/
              /*Text(
                'loginSubtitle'.tr,
                style: AppThemeState().textStyleMedium(
                  ColorConstants.greyColor,
                  fontSize: FontConstants.font_16,
                ),
                textAlign: TextAlign.center,
              ).marginOnly(bottom: 24),*/
              Form(key: controller.formKey, child: onGetMobileAndPasswordForm()),
              /* Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() {
                    return CommonCheckBox(
                      isChecked: controller.isTermsAndConditionSelected.value,
                      onTap: () {
                        controller.isTermsAndConditionSelected.value =
                            !controller.isTermsAndConditionSelected.value;
                      },
                    );
                  }),
                  8.hBox,
                 Flexible(
                    child: RichText(
                      text: TextSpan(
                        style: AppThemeState().textStyleMedium(
                          ColorConstants.greyColor,
                          fontSize: FontConstants.font_16,
                        ),
                        children: [
                          TextSpan(text: 'lblIAgree'.tr),
                          TextSpan(
                            text: 'lblTermsOfService'.tr,
                            style: AppThemeState().textStyleMedium(
                              ColorConstants.primaryColor,
                              fontSize: FontConstants.font_16,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.toNamed(
                                  Routes.termsAndConditions,
                                  arguments: {ArgumentsConst.isFrom: 1},
                                );
                              },
                          ),
                          TextSpan(text: 'lblAnd'.tr),
                          TextSpan(
                            text: 'lblPrivacyPolicy'.tr,
                            style: AppThemeState().textStyleMedium(
                              ColorConstants.primaryColor,
                              fontSize: FontConstants.font_16,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.toNamed(
                                  Routes.privacyPolicy,
                                  arguments: {ArgumentsConst.isFrom: 2},
                                );
                              },
                          ),
                          const TextSpan(text: '.'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),*/
              30.vBox,
              CommonButton(
                buttonText: 'loginTitle'.tr,
                onTap: () {
                  print("click of login:${controller.formKey.currentState!.validate()}");
                  // if (controller.formKey.currentState!.validate()) {
                    //controller.onGetLogin();
                    Get.offAllNamed(Routes.dashboard);
                  // }
                },
              ).marginOnly(bottom: 16),
              CommonButton(
                buttonText: 'lblSignUp'.tr,
                onTap: () async {
                  /*await localDataSource.setGuestUser(true);
                  Get.offAllNamed(Routes.dashboard);*/
                  Get.offAllNamed(Routes.profileSetup, arguments: {ArgumentsConst.mobileNumber: controller.editConMobileNumber.text});
                },
                backgroundColor: ColorConstants.transparentColor,
                textColor: ColorConstants.greyBorderColor,
                //border: Border.all(color: ColorConstants.greyBorderColor),
              ),
            ],
          ).marginSymmetric(horizontal: AppSizeConstants.size_15),
        ),
      ),
    );
  }

  Widget onGetMobileAndPasswordForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'lblEmail'.tr,
          style: AppThemeState().textStyleMedium(
            ColorConstants.blackColor,
            fontSize: FontConstants.font_14,
          ),
        ),
        8.vBox,
        CommonTextFormField(
          editController: controller.editConEmail,
          focusNode: controller.focusEmail,
          labelText: 'lblEnterEmail'.tr,
          textInputType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          borderColor: const Color(0xFF1E4E8C),
          maxLength: AppConstants.email,
       /*   prefixWidget: Container(
           // padding: EdgeInsets.only(left: 10, right: 8),
            decoration: BoxDecoration(color: Colors.transparent),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
              *//*  SvgPicture.asset(
                  ImageConstants.icFlag,
                  width: 24,
                  height: 16,
                  fit: BoxFit.contain,
                ),
                10.hBox,*//*
               *//* Text(
                  '(+965)',
                  style: AppThemeState().textStyleRegular(
                    ColorConstants.secondaryButtonTextColor,
                    fontSize: FontConstants.font_16,
                  ),
                ),
                12.hBox,*//*
               *//* Container(
                  height: 15,
                  width: 2,
                  color: ColorConstants.secondaryButtonTextColor,
                ),*//*
              ],
            ),
          ),*/
          onChange: (value) {},
          onValidate: (value) {
            return Validator.emailValidator(value);
          },
          onFocusChange: (value) {},
          onFieldSubmitted: (value) {
            controller.focusPassword.requestFocus();
          },
        ).marginOnly(bottom: AppSizeConstants.size_14),

        /// PASSWORD FIELD
        Text(
          'lblPassword'.tr,
          style: AppThemeState().textStyleMedium(
            ColorConstants.blackColor,
            fontSize: FontConstants.font_14,
          ),
        ),
        8.vBox,

        CommonTextFormField(
          editController: controller.editConPassword,
          focusNode: controller.focusPassword,
          labelText: 'lblEnterPassword'.tr,
          textInputType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.done,
          borderColor: const Color(0xFF1E4E8C),
          onChange: (value) {},
          onValidate: (value) {
            return Validator.passwordValidator(value);
          },
          onFocusChange: (value) {},
          onFieldSubmitted: (value) {
            // Optionally handle enter key here
          },
        ).marginOnly(bottom: AppSizeConstants.size_14),
      ],
    );
  }
}
