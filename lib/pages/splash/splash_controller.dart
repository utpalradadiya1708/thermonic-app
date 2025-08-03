import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/common/constants/app_constants.dart';
import '../../core/common/repository/apis/auth_repository.dart';
import '../../core/common/repository/local_data/local_data_source.dart';
import '../../core/common/widget/common_components.dart';
import '../../core/di/injector_container.dart';
import '../../core/theme/app_theme.dart';
import '../../core/theme/color_constants.dart';
import '../../core/theme/font_constants.dart';
import '../../models/init_model_response/init_model_response.dart';
import '../../utils/helper/session_manager.dart';
import '../../utils/logger_util.dart';

class SplashController extends GetxController {
  AuthRepository authRepository = getIt<AuthRepository>();
  LocalDataSource localDataSource = getIt<LocalDataSource>();

  @override
  void onInit() {
    onGetInit();
    super.onInit();
  }

  void onGetInit() async {
    String platform = "android";
    if (Platform.isAndroid) {
      platform = "android";
    } else {
      platform = "ios";
    }

    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    // Get current session state
    final sessionState = await SessionManager.getSessionState();
    String? userId = sessionState.user?.user.id?.toString();
    // final userJson = await localDataSource.getData(StorageKeys.cKeyUserData);
    //
    // String? userId;
    // if (userJson != null) {
    //   userId = '';
    //   // userJson['user']['id']?.toString();
    // }

    final response = await authRepository.init(platform, version, userId: userId ?? '');

    response.fold(
      (failure) {
        CommonComponents.displaySnackBarError(failure.message);
        _navigateBasedOnCurrentState();
      },
      (response) async {
        if (response.status) {
          _handleInitSuccess(response);
        } else {
          CommonComponents.displaySnackBarError(response.message);
          _navigateBasedOnCurrentState();
        }
      },
    );
  }

  Future<void> _handleInitSuccess(dynamic response) async {
    try {
      InitModelResponse initModelResponse = InitModelResponse.fromJson(response.data);

      _updateAppConstants(initModelResponse);
      await SessionManager.updateProfileSetupStatus(initModelResponse.isProfileSetup ?? false);

      print('initSuccess');

      // final bool didHandleLink = await AppLinksDeepLink.instance.handleAndClearInitialUri();

      // if (didHandleLink) {
      //   debugPrint("✅ Deep link navigation was handled. Skipping default navigation.");
      //   return;
      // }

      await _navigateBasedOnServerResponse(initModelResponse);
    } catch (e) {
      MyLogger.write('Error handling init success: $e');
      _navigateBasedOnCurrentState();
    }
  }

  void _updateAppConstants(InitModelResponse response) {
    AppConstants.aboutUs = response.aboutUs ?? '';
    AppConstants.termsConditions = response.termsAndConditions ?? '';
    AppConstants.privacyPolicy = response.privacyPolicy ?? '';
    AppConstants.igLink = response.igLink ?? '';
    AppConstants.tgLink = response.tgLink ?? '';
    AppConstants.fbLink = response.fbLink ?? '';
    AppConstants.whatsappLink = response.whatsappLink ?? '';
    AppConstants.supportEmail = response.supportEmail ?? '';
    AppConstants.supportNumber = response.supportNumber ?? '';
  }

  Future<void> _navigateBasedOnServerResponse(InitModelResponse initResponse) async {
    // Get updated session state after server response
    final currentState = await SessionManager.getSessionState();

    // Update the state with server response
    final updatedState = SessionState(
      isLanguageSelected: currentState.isLanguageSelected,
      isOnboardingDone: currentState.isOnboardingDone,
      isLoggedIn: currentState.isLoggedIn,
      isGuest: currentState.isGuest,
      isProfileSetup: initResponse.isProfileSetup ?? false,
      user: currentState.user,
    );

    final nextRoute = SessionManager.getNextRoute(updatedState);
    Get.offNamed(nextRoute);
  }

  Future<void> _navigateBasedOnCurrentState() async {
    final sessionState = await SessionManager.getSessionState();
    final nextRoute = SessionManager.getNextRoute(sessionState);
    Get.offNamed(nextRoute);
  }
}

void checkIsUpdateAvailableOrNot(int updateFlag, String message, bool profileSetup, bool isLoginAPI) {
  String positiveText = "";
  String negativeText = "";

  Widget content = Text(message, style: AppThemeState().textStyleMedium(ColorConstants.blackTextColor, fontSize: FontConstants.font_14));
  Widget title = Text(
    'appName'.tr,
    style: AppThemeState().textStyleExtraBold(ColorConstants.blackTextColor, fontSize: FontConstants.font_18),
  );

  if (updateFlag == 0) {
    // positiveText = StringConstants.lblUpdateApp;
    // negativeText = StringConstants.lblNotNow;
  } else if (updateFlag == 1) {
    // positiveText = StringConstants.lblUpdateApp;
    negativeText = "";
  } else {
    // positiveText = StringConstants.lblOkay;
    negativeText = "";
  }

  Uri url = Uri.parse(Platform.isAndroid ? "" : "");

  final actions = updateFlag == 0
      ? <Widget>[
          TextButton(
            onPressed: () {
              Get.back();
              // redirectNextPage(profileSetup);
            },
            child: Text(
              negativeText.toUpperCase(),
              style: AppThemeState().textStyleBold(ColorConstants.secondaryTextColor, fontSize: FontConstants.font_14),
            ),
          ),
          TextButton(
            onPressed: () {
              if (Platform.isAndroid) {
                SystemNavigator.pop();
              }
              launchUrl(url, mode: LaunchMode.externalApplication);
            },
            child: Text(
              positiveText.toUpperCase(),
              style: AppThemeState().textStyleBold(ColorConstants.primaryTextColor, fontSize: FontConstants.font_14),
            ),
          ),
        ]
      : <Widget>[
          TextButton(
            onPressed: () {
              Get.back();
              if (Platform.isAndroid) {
                SystemNavigator.pop();
              }
              if (updateFlag == 1) {
                launchUrl(url, mode: LaunchMode.externalApplication);
              }
              if (updateFlag == 2 && Platform.isIOS) {
                exit(0);
              }
            },
            child: Text(
              positiveText.toUpperCase(),
              style: AppThemeState().textStyleBold(ColorConstants.primaryTextColor, fontSize: FontConstants.font_14),
            ),
          ),
        ];
  showDialog(
    context: Get.overlayContext!,
    barrierDismissible: false,
    useRootNavigator: false,
    useSafeArea: false,
    barrierColor: Colors.grey.withAlpha((255 * 0.4).round()),
    builder: (dialogContext) {
      return PopScope(
        canPop: false,
        child: GetPlatform.isIOS
            ? CupertinoAlertDialog(title: title, content: content, actions: actions)
            : AlertDialog(title: title, content: content, actions: actions),
      );
    },
  );
}

/* Future<void> redirectNextPage(bool profileSetup) async {
    bool? isOnBordering = await localDataSource.getData(
      StorageKeys.cKeyIsOnBoardingDone,
    );
    bool? isLogin = localDataSource.getIsLogin();
    print('isLogin in local ${isLogin}');
    if (isOnBordering != null || isOnBordering == true) {
      if (isLogin) {
        if (profileSetup == false) {
          Get.offNamed(Routes.profileSetup);
        } else {
          Get.offNamed(Routes.dashboard);
        }
      } else {
        Get.offNamed(Routes.login);
      }
    } else {
      Get.offNamed(Routes.selectLanguage);
    }
  }
*/
/*Future<void> redirectNextPage() async {
    await Future.delayed(Duration(seconds: 3));
    final isOnBoardingDone =
        await localDataSource.getData(StorageKeys.cKeyIsOnBoardingDone) ??
        false;
    final isLanguageSelected =
        await localDataSource.getData(StorageKeys.cKeyLanguageSelected) ??
        false;
    final isLogin =
        await localDataSource.getData(StorageKeys.cKeyIsLogin) ?? false;
    final profileSetup =
        await localDataSource.getData(StorageKeys.cKeyProfileSetup) ?? 0;

    if (!isLanguageSelected) {
      Get.offNamed(Routes.selectLanguage);
      return;
    }
    if (!isOnBoardingDone) {
      Get.offNamed(Routes.onBoarding);
      return;
    }

    if (!isLogin) {
      Get.offNamed(Routes.login);
      return;
    }

    if (profileSetup == 0) {
      Get.offNamed(Routes.profileSetup);
      return;
    }

    Get.offNamed(Routes.dashboard);
    // Get.offNamed(Routes.dashboard);
  }*/

// Future<void> redirectNextPage() async {
//   Timer(Duration(seconds: 3), () {
//     Get.offNamed(Routes.selectLanguage);
//   });
//
//   bool? isOnBordering = await localDataSource.getData(
//     StorageKeys.cKeyIsOnBorderDone,
//   );
//   // bool? isLogin = localDataSource.getIsLogin();
//   // if (isOnBordering != null || isOnBordering == true) {
//   //   if (isLogin && isLoginAPI) {
//   //     if (profileSetup == 0) {
//   //       Get.offNamed(Routes.profileSetup);
//   //     } else {
//   //       AppConstants.selectedRegistrationType.value = int.parse(
//   //         await localDataSource.getData(StorageKeys.cKeyRegistrationType),
//   //       );
//   //       Get.offNamed(Routes.dashboard);
//   //     }
//   //   } else {
//   //     Get.offNamed(Routes.login);
//   //   }
//   // } else {
//   //   Get.offNamed(Routes.onBoarding);
//   // }
// }
// }
