import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:thermonic/pages/profile_setup/profile_setup_controller.dart';
import 'package:thermonic/utils/widget_extensions.dart';

import '../../core/common/constants/app_constants.dart';
import '../../core/common/constants/image_constants.dart';
import '../../core/common/enum/grade_selection_enum.dart';
import '../../core/common/repository/local_data/local_data_source.dart';
import '../../core/common/widget/common_appbar.dart';
import '../../core/common/widget/common_background.dart';
import '../../core/common/widget/common_button.dart';
import '../../core/common/widget/common_components.dart';
import '../../core/common/widget/common_textform_field.dart';
import '../../core/common/widget/drop_down/stream_selector_widget.dart';
import '../../core/common/widget/grade_selector_widget.dart';
import '../../core/di/injector_container.dart';
import '../../core/routes/app_pages.dart';
import '../../core/theme/app_theme.dart';
import '../../core/theme/color_constants.dart';
import '../../core/theme/font_constants.dart';
import '../../models/user_model_response/user_model_response.dart';
import '../../utils/validator.dart';

class ProfileSetupView extends GetView<ProfileSetupController> {
  const ProfileSetupView({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonBackground(
      child: SafeArea(
        top: false,
        bottom: true,
        child: RefreshIndicator(
          onRefresh: () async {
            await controller.completeProfileSetup(isRefresh: true);
          },
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  controller: controller.scrollController,
                  child: Column(
                    children: [
                      100.vBox,
                      // CommonAppBar(
                      //   text: (controller.isFromEditProfile ?? false) ? 'lblEditProfile'.tr : 'profileSetupTitle'.tr,
                      //   onTap: () {
                      //     (controller.isFromEditProfile ?? false) ? Get.back() : Get.offAllNamed(Routes.login);
                      //   },
                      // ).marginOnly(bottom: 10),
                    /*  ProfileImagePicker(controller: controller),
                      16.vBox,*/
                      ProfileFormFields(controller: controller),
                    ],
                  ),
                ),
              ),
              CommonButton(
                buttonText: 'lblSignUp'.tr,
                onTap: () async {
                  /*if ((controller.isFromEditProfile ?? false) && !(await controller.hasProfileChanged())) {
                    Get.back();
                    return;
                  }*/
                    print("sign up click");
               /*   if (controller.formKey.currentState!.validate()) {
                    //Get.offAllNamed(Routes.dashboard);
                    // controller.completeProfileSetup();
                  }*/
                  Get.offAllNamed(Routes.dashboard);
                },
              ).marginOnly(bottom: 10),
              Text('loginTitle'.tr, style: AppThemeState().textStyleMedium(ColorConstants.blackColor, fontSize: FontConstants.font_14)),
              15.vBox,
            ],
          ).paddingSymmetric(horizontal: 16),
        ),
      ),
    );
  }
}

class ProfileImagePicker extends StatelessWidget {
  final ProfileSetupController controller;

  const ProfileImagePicker({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final isRTL = Directionality.of(context) == TextDirection.rtl;

    return SizedBox(
      width: 20,
      height: 20,
      child:
          Stack(
            children: [
             /* Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: ColorConstants.whiteColor, width: 2),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Obx(() {
                    if (controller.hasSelectedNewLocalImage()) {
                      return Image.file(File(controller.selectedPath.value), fit: BoxFit.cover, width: 100, height: 100);
                    }

                    if (controller.hasNetworkImage()) {
                      return CommonComponents.getNetworkImageViewAPI(controller.networkImageUrl.value);
                    }

                    return Image.asset(ImageConstants.icDefaultUSer, fit: BoxFit.cover, width: 100, height: 100);
                  }),
                ),
              ),*/
            /*  Positioned(
                bottom: 0,
                left: isRTL ? 0 : null,
                right: isRTL ? null : 0,
                child: Container(
                  height: 29,
                  width: 29,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorConstants.primaryColor,
                    border: Border.all(color: ColorConstants.whiteColor, width: 2),
                  ),
                  child: SvgPicture.asset(ImageConstants.icCamera, matchTextDirection: true).paddingAll(6),
                ),
              ),*/
            ],
          ).onTap(() {
         /*   CommonComponents.showChooseOptionForImage(
              'lblSelectProfileImage',
              isProfile: true,
              onImageSelect: (path) {
                if (path.isNotEmpty) {
                  controller.selectedPath.value = path;
                  controller.networkImageUrl.value = '';
                }
              },
            );*/
          }),
    );
  }
}

class ProfileFormFields extends StatelessWidget {
  final ProfileSetupController controller;

  const ProfileFormFields({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: Image.asset(ImageConstants.icAppLogo, height: 64, width: 64,)),

          20.vBox,
          FullNameField(),
          EmailField(),
          PasswordField(),
          ConfirmPasswordField()
         // MobileNumberField(),
          //GradeSelectorView(controller: controller),
          //StreamSelectorView(key: controller.streamSectionKey),
        ],
      ),
    );
  }
}

class FullNameField extends StatelessWidget {
  const FullNameField({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileSetupController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('lblFullName'.tr, style: AppThemeState().textStyleMedium(ColorConstants.blackColor, fontSize: FontConstants.font_14)),
        8.vBox,
        CommonTextFormField(
          editController: controller.editConFullName,
          focusNode: controller.focusFullName,
          labelText: 'lblEnterFullName'.tr,
          textInputType: TextInputType.name,
          textInputAction: TextInputAction.next,
          maxLength: AppConstants.fullName,
          onValidate: (value) => Validator.nameValidator(value),
          onChange: (value) {},
        ).marginOnly(bottom: 16),
      ],
    );
  }
}

class EmailField extends StatelessWidget {
  const EmailField({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileSetupController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('lblEmail'.tr, style: AppThemeState().textStyleMedium(ColorConstants.blackColor, fontSize: FontConstants.font_14)),
        8.vBox,
        CommonTextFormField(
          editController: controller.editConEmail,
          focusNode: controller.focusEmail,
          labelText: 'lblEnterEmail'.tr,
          textInputType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          maxLength: AppConstants.email,
          onValidate: (value) => Validator.emailValidator(value),
          onChange: (value) {},
        ).marginOnly(bottom: 16),
      ],
    );
  }
}


class PasswordField extends StatelessWidget {
  const PasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileSetupController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'lblPassword'.tr,
          style: AppThemeState().textStyleMedium(
            ColorConstants.blackColor,
            fontSize: FontConstants.font_14,
          ),
        ),
        8.vBox,
        CommonTextFormField(
          editController: controller.editConPass,
          focusNode: controller.focusPassword,
          labelText: 'lblPassword'.tr,
          textInputType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.done,
         isPassword: true, // Hides password text
          onValidate: (value) => Validator.passwordValidator(value),
          onChange: (value) {},
        ).marginOnly(bottom: 16),
      ],
    );
  }
}

class ConfirmPasswordField extends StatelessWidget {
  const ConfirmPasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileSetupController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'lblConfirmPassword'.tr,
          style: AppThemeState().textStyleMedium(
            ColorConstants.blackColor,
            fontSize: FontConstants.font_14,
          ),
        ),
        8.vBox,
        CommonTextFormField(
          editController: controller.editConConfirmPass,
          focusNode: controller.focusConfirmPassword,
          labelText: 'lblConfirmPassword'.tr,
          textInputType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.done,
          //  isObscure: true, // Hides password text
          onValidate: (value) => Validator.confirmPasswordValidator(value,controller.editConPass.text),
          onChange: (value) {},
        ).marginOnly(bottom: 16),
      ],
    );
  }
}

/*class MobileNumberField extends StatelessWidget {
  const MobileNumberField({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileSetupController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('lblMobileNumber'.tr, style: AppThemeState().textStyleMedium(ColorConstants.blackColor, fontSize: FontConstants.font_14)),
        8.vBox,
        CommonTextFormField(
          editController: controller.editConMobileNumber,
          focusNode: controller.focusMobileNumber,
          labelText: 'lblEnterMobileNumber'.tr,
          textInputType: TextInputType.number,
          readOnly: true,
          textInputAction: TextInputAction.next,
          maxLength: AppConstants.mobileNumber,
          prefixWidget: Container(
            padding: const EdgeInsets.only(left: 10, right: 8),
            decoration: const BoxDecoration(color: Colors.transparent),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(ImageConstants.icFlag, width: 24, height: 16, fit: BoxFit.contain),
                10.hBox,
                Text(
                  '(+965)',
                  style: AppThemeState().textStyleRegular(ColorConstants.secondaryButtonTextColor, fontSize: FontConstants.font_16),
                ),
                12.hBox,
                Container(height: 15, width: 2, color: ColorConstants.secondaryButtonTextColor),
              ],
            ),
          ),
          onValidate: (value) => Validator.mobileNumberValidator(value),
          onChange: (value) {},
        ).marginOnly(bottom: 16),
      ],
    );
  }
}*/

class GradeSelectorView extends StatelessWidget {
  const GradeSelectorView({super.key, required this.controller});

  final ProfileSetupController controller;

  @override
  Widget build(BuildContext context) {
    // final controller = Get.find<ProfileSetupController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('lblSelectGrade'.tr, style: AppThemeState().textStyleMedium(ColorConstants.whiteColor, fontSize: FontConstants.font_14)),
        8.vBox,
        Obx(() {
          if (controller.gradeList.isEmpty) {
            return SizedBox(
              height: 50,
              child: Center(child: CircularProgressIndicator(color: ColorConstants.primaryColor)),
            );
          }

          return GradeSelector(
            localDataSource: controller.localDataSource,
            grades: controller.gradeList,
            selectedGrade: controller.selectedGrade,
            selectionType: GradeSelectionType.single,
            isProfileScreen: true,
            onTap: (GradeModel grade) {
              controller.selectedGrade.value = grade.id!;
              controller.onGradeChanged();
            },
          );
        }).marginOnly(bottom: 16),
      ],
    );
  }
}

class StreamSelectorView extends StatelessWidget {
  const StreamSelectorView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileSetupController>();

    return Obx(() {
      final selectedGradeId = controller.selectedGrade.value;
      final selectedGradeModel = controller.gradeList.firstWhereOrNull((e) => e.id == selectedGradeId);

      if ((selectedGradeModel?.streams?.isEmpty ?? true)) {
        return const SizedBox.shrink();
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('lblStream'.tr, style: AppThemeState().textStyleMedium(ColorConstants.whiteColor, fontSize: FontConstants.font_14)),
          8.vBox,
          StreamSelectorRow(
            streamOptions: selectedGradeModel?.streams ?? [],
            selectedStreamId: controller.selectedStreamId,
            isProfileScreen: true,
            localDataSource: getIt<LocalDataSource>(),
            onStreamSelected: (streamId) {
              controller.selectedStreamId.value = streamId;
            },
          ),
          47.vBox,
        ],
      );
    });
  }
}
