import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:thermonic/core/common/constants/image_constants.dart';
import 'package:thermonic/core/common/widget/drop_down/dropdown_button2.dart';
import 'package:thermonic/core/theme/color_constants.dart';
import 'package:thermonic/utils/utils.dart';
import 'package:thermonic/utils/widget_extensions.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../core/common/constants/app_constants.dart';
import '../../core/common/repository/apis/auth_repository.dart';
import '../../core/common/widget/common_button.dart';
import '../../core/common/widget/common_components.dart';
import '../../core/di/injector_container.dart';
import '../../core/routes/app_pages.dart';
import '../../core/theme/app_size_constants.dart';
import '../../core/theme/app_theme.dart';
import '../../core/theme/font_constants.dart';
import '../../models/setting_item.dart';
import '../../models/user_model_response/user_model_response.dart';
import '../../utils/helper/session_manager.dart';
import '../dashboard/dashboard_controller.dart';

class SettingController extends GetxController {
  RxString appVersion = ''.obs;
  final isGuest = false.obs;
  final user = Rxn<UserModelResponse>();
  AuthRepository authRepository = getIt<AuthRepository>();

  RxList<SettingItem> settings = <SettingItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadSession();
    _getAppVersion();
    // _initializeSettings();
  }

  Future<void> _loadSession() async {
    final session = await SessionManager.getSessionState();
    isGuest.value = session.isGuest;
    user.value = session.user;
    _initializeSettings();
  }

  Future<void> refreshUser() async {
    final session = await SessionManager.getSessionState();
    isGuest.value = session.isGuest;
    user.value = session.user;
  }

  Future<void> _getAppVersion() async {
    final info = await PackageInfo.fromPlatform();
    appVersion.value = '${'lblVersion'.tr}${info.version}';
  }

  Future<void> doLogout({bool showSuccessView = true}) async {
    EasyLoading.show();
    final response = await authRepository.doLogout();

    await response.fold(
      (failure) {
        EasyLoading.dismiss();
        CommonComponents.displaySnackBarError(failure.message);
      },
      (response) async {
        EasyLoading.dismiss();
        if (response.status) {
          clearDownloadsOnLogout();
          await SessionManager.logout();
          Get.delete<SettingController>();
          Get.offAllNamed(Routes.login);
          CommonComponents.displaySnackBarSuccess(response.message);
        } else {
          CommonComponents.displaySnackBarError(response.message);
        }
      },
    );
  }

  Future<void> doDeleteAccount() async {
    EasyLoading.show();
    final response = await authRepository.doDeleteAccount();

    await response.fold(
      (failure) {
        EasyLoading.dismiss();
        CommonComponents.displaySnackBarError(failure.message);
      },
      (response) async {
        EasyLoading.dismiss();
        if (response.status) {
          await SessionManager.logout();
          Get.delete<DashboardController>();
          CommonComponents.displaySnackBarSuccess(response.message);
        } else {
          CommonComponents.displaySnackBarError(response.message);
        }
      },
    );
  }

  void onDeleteAccountButtonClick() {
    if (isGuest.value) {
      Get.offAllNamed(Routes.login);
      return;
    }
    showConfirmationBottomSheet(
      title: 'lblDeleteAccount',
      message: 'lblAreYouSure',
      info: 'lblDeleteAccountInfo',
      leftButtonText: 'lblCancel',
      rightButtonText: 'lblYesDelete',
      imagePath: ImageConstants.icDeleteAccountImage,
      onConfirm: () {
        doDeleteAccount();
      },
      rightButtonColor: ColorConstants.deleteAccountButtonColor,
    );
  }

  void onLogoutButtonClick() {
    if (isGuest.value) {
      Get.offAllNamed(Routes.login);
      return;
    }
    showConfirmationBottomSheet(
      title: 'lblLogout',
      message: 'lblAreYouSureLogout',
      info: 'lblLogoutInfo',
      leftButtonText: 'lblGoBack',
      rightButtonText: 'lblLogout',
      imagePath: ImageConstants.icLogOutImage,
      onConfirm: () {
        doLogout();
      },
      rightButtonColor: ColorConstants.primaryColor,
    );
  }

  void _initializeSettings() {
    settings.value = <SettingItem>[
      SettingItem(
        settingSection: SettingSection.settingsAndPreferences,
        title: 'lblMyOrder',
        onTap: () {
          if (isGuest.value) {
            Get.offAllNamed(Routes.login);
            return;
          } else {
            Get.toNamed(Routes.myOrder);
          }
        },
        image: ImageConstants.icMySaveList,
      ),
      // SettingItem(
      //   settingSection: SettingSection.settingsAndPreferences,
      //   title: 'lblStatistics',
      //   onTap: () {
      //     if (isGuest.value) {
      //       Get.offAllNamed(Routes.login);
      //       return;
      //     }
      //   },
      //   image: ImageConstants.icStatistics,
      // ),
      SettingItem(
        settingSection: SettingSection.settingsAndPreferences,
        title: 'lblInvoice',
        onTap: () {
          Get.toNamed(Routes.selectLanguage, arguments: {ArgumentsConst.isFromSetting: true});
        },
        image: ImageConstants.icLanguageSetting,
      ),
      SettingItem(
        settingSection: SettingSection.settingsAndPreferences,
        title: 'lblOrderStatus',
        onTap: () {
          if (isGuest.value) {
            Get.offAllNamed(Routes.login);
            return;
          } else {
            Get.toNamed(Routes.myPurchases, arguments: {ArgumentsConst.courseType: CourseType.coursePackage});
          }
        },
        image: ImageConstants.icMyPurchase,
      ),
    /*  SettingItem(
        settingSection: SettingSection.settingsAndPreferences,
        title: 'lblMyDownloads',
        onTap: () {
          if (isGuest.value) {
            Get.offAllNamed(Routes.login);
            return;
          } else {
            Get.toNamed(Routes.myDownloads);
          }
        },
        image: ImageConstants.icMyDownloads,
      ),
      SettingItem(
        settingSection: SettingSection.more,
        title: 'lblAboutUs',
        onTap: () {
          Get.toNamed(Routes.termsAndConditions, arguments: {ArgumentsConst.isFrom: 3});
          // if (isGuest.value) {
          //   Get.offAllNamed(Routes.login);
          //   return;
          // } else {
          //   Get.toNamed(
          //     Routes.termsAndConditions,
          //     arguments: {ArgumentsConst.isFrom: 3},
          //   );
          // }
        },
        image: ImageConstants.icAboutUs,
      ),
      SettingItem(
        settingSection: SettingSection.more,
        title: 'lblFAQ',
        onTap: () {
          Get.toNamed(Routes.faq, arguments: {ArgumentsConst.isFrom: 4});
          // if (isGuest.value) {
          //   Get.offAllNamed(Routes.login);
          //   return;
          // } else {
          //   Get.toNamed(Routes.faq, arguments: {ArgumentsConst.isFrom: 4});
          // }
        },
        image: ImageConstants.icFaq,
      ),*/
      /*SettingItem(
        settingSection: SettingSection.more,
        title: 'lblTermsConditions',
        onTap: () {
          Get.toNamed(Routes.termsAndConditions, arguments: {ArgumentsConst.isFrom: 1});
          // if (isGuest.value) {
          //   Get.offAllNamed(Routes.login);
          //   return;
          // } else {
          //   Get.toNamed(
          //     Routes.termsAndConditions,
          //     arguments: {ArgumentsConst.isFrom: 1},
          //   );
          // }
        },
        image: ImageConstants.icTermsConditions,
      ),
      SettingItem(
        settingSection: SettingSection.more,
        title: 'lblPrivacyPolicy',
        onTap: () {
          Get.toNamed(Routes.termsAndConditions, arguments: {ArgumentsConst.isFrom: 2});
          // if (isGuest.value) {
          //   Get.offAllNamed(Routes.login);
          //   return;
          // } else {
          //   Get.toNamed(
          //     Routes.termsAndConditions,
          //     arguments: {ArgumentsConst.isFrom: 2},
          //   );
          // }
        },
        image: ImageConstants.icPrivacyPolicy,
      ),
      SettingItem(
        settingSection: SettingSection.more,
        title: 'lblContactUs',
        onTap: () {
          Get.toNamed(Routes.contactUs);
          // if (isGuest.value) {
          //   Get.offAllNamed(Routes.login);
          //   return;
          // } else {
          //   Get.toNamed(Routes.contactUs);
          // }
        },
        image: ImageConstants.icContactUs,
      ),*/
      if (!isGuest.value) ...[
        SettingItem(
          settingSection: SettingSection.account,
          title: 'lblDeleteAccount',
          onTap: onDeleteAccountButtonClick,
          image: ImageConstants.icDeleteAccount,
          borderColor: ColorConstants.redColor,
          textColor: ColorConstants.redColor,
        ),
        SettingItem(settingSection: SettingSection.account, title: 'lblLogout', onTap: onLogoutButtonClick, image: ImageConstants.icLogOut),
      ],
    ].obs;
  }

  void showConfirmationBottomSheet({
    required String title,
    required String message,
    required String info,
    required String leftButtonText,
    required Color rightButtonColor,
    required String rightButtonText,
    required String imagePath,
    required VoidCallback onConfirm,
  }) {
    Widget child = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        25.vBox,
        Text(title.tr, style: AppThemeState().textStyleRegular(ColorConstants.deleteAccountTextColor, fontSize: FontConstants.font_20)),
        16.vBox,
        SvgPicture.asset(imagePath),
        17.vBox,
        Text(message.tr, style: AppThemeState().textStyleRegular(ColorConstants.deleteAccountTextColor, fontSize: FontConstants.font_20)),
        4.vBox,
        Text(
          info.tr,
          textAlign: TextAlign.center,
          style: AppThemeState().textStyleRegular(ColorConstants.deleteAccountSubTextColor, fontSize: FontConstants.font_14),
        ),
        40.vBox,
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              child: CommonButton(
                buttonText: leftButtonText.tr,
                backgroundColor: ColorConstants.secondaryButtonColor,
                border: Border.all(color: ColorConstants.borderColor, width: 1),
                onTap: () => Get.back(),
              ),
            ),
            20.hBox,
            Flexible(
              child: CommonButton(
                buttonText: rightButtonText.tr,
                backgroundColor: rightButtonColor,
                onTap: () {
                  Get.back();
                  onConfirm(); // Perform action
                },
              ),
            ),
          ],
        ).marginSymmetric(horizontal: AppSizeConstants.size_10),
        30.vBox,
      ],
    );

    CommonComponents.commonBottomSheet(child: child);
  }
}
